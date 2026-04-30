"
I am an OSWindow form renderer that uses the SDL3 GPU API to upload and present Form bits.
"
Class {
	#name : 'OSSDL3GPUFormRenderer',
	#superclass : 'OSWindowFormRenderer',
	#traits : 'LibTSDL3',
	#classTraits : 'LibTSDL3 classTrait',
	#instVars : [
		'gpuDevice',
		'gpuTexture',
		'extent',
		'mutex',
		'swapchainTextureHolder',
		'pooledSourceLocation',
		'pooledDestinationLocation',
		'externalForm',
		'needsFlush',
		'deferFlush',
		'transferInfo',
		'transferBuffer',
		'transferRegion'
	],
	#pools : [
		'SDL3GPUTextureFormat',
		'SDL3GPUTextureUsageFlags'
	],
	#category : 'SDL3-OSWindow-Renderers',
	#package : 'SDL3-OSWindow',
	#tag : 'Renderers'
}

{ #category : 'morphic integration' }
OSSDL3GPUFormRenderer >> deferUpdatesWhile: aBlock [
	"Defer screen updates during the execution of aBlock."

	deferFlush := true.
	aBlock ensure: [ 
		deferFlush := false.
		self flush ]
]

{ #category : 'deleting' }
OSSDL3GPUFormRenderer >> destroy [
	"Release the SDL3 resources that depend on the form extent. You can send #validate to reinitialize the resources. We avoid sending #destroy to super since it nils backendWindow and we need to keep the reference."

	mutex critical: [
		gpuTexture ifNotNil: [
			gpuDevice releaseGPUTexture: gpuTexture ].
		transferBuffer ifNotNil: [
			gpuDevice releaseGPUTransferBuffer: transferBuffer ].
		gpuTexture := nil.
		transferBuffer := nil ]
]

{ #category : 'updating screen' }
OSSDL3GPUFormRenderer >> flush [
	"Process any pending presentation to the screen.
	 The backing store is assumed to be up-to-date (handled in updateAreas:)."

	| commandBuffer |
	mutex critical: [
		self validate ifFalse: [ ^ self ].
		
		"If nothing dirty to present, just return"
		needsFlush ifFalse: [ ^ self ].

		commandBuffer := gpuDevice acquireGPUCommandBuffer.
		self privateFlush: commandBuffer.
	]
]

{ #category : 'initialization' }
OSSDL3GPUFormRenderer >> initialize [

	super initialize.
	deferFlush := false.
	mutex := Mutex new.
	needsFlush := false.
	swapchainTextureHolder := (FFIExternalValueHolder ofType: SDL3GPUTexture) new.
	externalForm := OSSDL3ExternalForm new
]

{ #category : 'private' }
OSSDL3GPUFormRenderer >> initializeGPUResources [
	"Initialize the SDL3 resources that depend on the form extent"

	| totalBytes |
	gpuTexture ifNotNil: [ gpuDevice releaseGPUTexture: gpuTexture ].
	transferBuffer ifNotNil: [ gpuDevice releaseGPUTransferBuffer: transferBuffer ].
	
	extent := form extent.
	totalBytes := extent x * 4 * extent y.
	
	"Backing store needs SAMPLER usage for copying/rendering to swapchain"
	gpuTexture := gpuDevice
		new2DTextureFormat: SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM
		usage: SDL_GPU_TEXTUREUSAGE_SAMPLER | SDL_GPU_TEXTUREUSAGE_COLOR_TARGET
		width: extent x 
		height: extent y.
	gpuTexture assertNotNullReturn.

	transferBuffer := gpuDevice newUploadTransferBuffer: totalBytes.
	transferBuffer assertNotNullReturn.
	
	"Pre-allocate pooled structures to avoid GC pressure in hot path"
	transferInfo := SDL3GPUTextureTransferInfo new.
	transferInfo transferBuffer: transferBuffer.
	transferInfo pixelsPerRow: 0; rowsPerLayer: 0.
	transferInfo offset: 0.

	transferRegion := SDL3GPUTextureRegion new.
	transferRegion texture: gpuTexture.
	transferRegion z: 0; d: 1; mipLevel: 0; layer: 0.

	pooledSourceLocation := SDL3GPUTextureLocation new.
	pooledSourceLocation texture: gpuTexture.
	pooledSourceLocation z: 0; mipLevel: 0; layer: 0.

	pooledDestinationLocation := SDL3GPUTextureLocation new.
	pooledDestinationLocation z: 0; mipLevel: 0; layer: 0
]

{ #category : 'private' }
OSSDL3GPUFormRenderer >> mergeDamage: allDamage [
	"Merge overlapping or adjacent damage rectangles into a collection of disjoint vertical spans.
	 Returns a collection of Rectangles (with full width or just vertical range info)."

	| sortedRects spans currentSpan |
	allDamage ifEmpty: [ ^ #() ].

	"Filter and sort by top coordinate"
	sortedRects := allDamage
		collect: [ :each | each intersect: (0@0 extent: extent) ifNone: [ nil ] ]
		thenSelect: [ :each | each isNotNil ].
	
	sortedRects ifEmpty: [ ^ #() ].
	sortedRects sort: [ :a :b | a top < b top ].

	spans := OrderedCollection new.
	currentSpan := sortedRects first.

	sortedRects allButFirstDo: [ :each |
		each top <= currentSpan bottom
			ifTrue: [ currentSpan := currentSpan merge: each ]
			ifFalse: [ 
				spans add: currentSpan.
				currentSpan := each ] ].
	
	spans add: currentSpan.
	^ spans
]

{ #category : 'accessing' }
OSSDL3GPUFormRenderer >> outputExtent [
	
	^ backendWindow sdl3Window pixelExtent
]

{ #category : 'private' }
OSSDL3GPUFormRenderer >> privateFlush: commandBuffer [
	"Actual implementation of swapchain presentation. 
	 Assumes mutex is held and resources are validated."

	"A. Try Acquire Swapchain texture (Non-blocking)."
	| copyPass |
	(commandBuffer
		acquireGPUSwapchainTextureForWindow: backendWindow sdl3Window
		into: swapchainTextureHolder
		width: nil
		height: nil).
				
	swapchainTextureHolder value isNull ifTrue: [ 
		"Swapchain not available; retry in the next flush."
		self ffiLibrary assertSuccess: commandBuffer cancel.
		^ self ].
					
	"B. Copy FULL backing store to Swapchain.
	   GPU-to-GPU copy is extremely fast and ensures screen consistency."
	copyPass := commandBuffer beginGPUCopyPass.
	
	pooledSourceLocation x: 0; y: 0.
	pooledDestinationLocation texture: swapchainTextureHolder value.
	pooledDestinationLocation x: 0; y: 0.
	
	copyPass 
		copyGPUTextureToTextureSource: pooledSourceLocation 
		destination: pooledDestinationLocation 
		w: extent x 
		h: extent y 
		d: 1 
		cycle: false.
	
	copyPass end.

	"C. Submit everything and record that screen is now up-to-date"
	self ffiLibrary assertSuccess: commandBuffer submit.
	needsFlush := false
]

{ #category : 'updating screen' }
OSSDL3GPUFormRenderer >> updateAll [

	self updateAreas: form boundingBox immediate: true
]

{ #category : 'updating screen' }
OSSDL3GPUFormRenderer >> updateAreas: allDamage immediate: forceToScreen [

	| mergedDamage currentOffset mappedAddress commandBuffer |
	mutex critical: [
		self validate ifFalse: [ ^ self ].

		"1. Identify disjoint vertical spans of damage."
		mergedDamage := self mergeDamage: allDamage.
		mergedDamage ifEmpty: [ ^ self ].

		"2. Upload each span to backing store IMMEDIATELY."
		mappedAddress := gpuDevice mapGPUTransferBuffer: transferBuffer cycle: true.
		mappedAddress isNull ifTrue: [ SDL3Error signalFromLibraryErrorMessage ].
		
		commandBuffer := gpuDevice acquireGPUCommandBuffer.
		commandBuffer assertNotNullReturn.
		
		[ | copyPass |
			currentOffset := 0.
			copyPass := commandBuffer beginGPUCopyPass.
			
			mergedDamage do: [ :each |
				| uploadRectangle |
				uploadRectangle := 0 @ each top extent: extent x @ each height.
				
				externalForm
					resetExtent: uploadRectangle extent
					depth: 32
					pitch: uploadRectangle width * 4
					bits: mappedAddress + currentOffset.
				[ 
					externalForm copy: uploadRectangle from: form to: 0@0 rule: Form over
				] ensure: [ 
					externalForm destroySurface 
				].
				
				transferInfo offset: currentOffset.
				transferRegion
					x: uploadRectangle left;
					y: uploadRectangle top;
					w: uploadRectangle width;
					h: uploadRectangle height.

				copyPass uploadToGPUTextureSource: transferInfo destination: transferRegion cycle: false.
				
				currentOffset := currentOffset + (uploadRectangle width * uploadRectangle height * 4) ].
				
			copyPass end.
		] ensure: [ 
			gpuDevice unmapGPUTransferBuffer: transferBuffer
		].

		self ffiLibrary assertSuccess: commandBuffer submit.
		needsFlush := true.

		"3. If forcing to screen OR not deferred, flush to swapchain."
		(forceToScreen or: [ deferFlush not ]) ifTrue: [ self flush ]
	]
]

{ #category : 'updating screen' }
OSSDL3GPUFormRenderer >> updateRectangle: rectangle [
	"Use batch update for single rectangle as well"

	self updateAreas: { rectangle } immediate: true
]

{ #category : 'events' }
OSSDL3GPUFormRenderer >> updateToNewResolution [

	self validate
]

{ #category : 'private' }
OSSDL3GPUFormRenderer >> validate [

	form ifNil: [ ^ false ].

	(gpuDevice isNil or: [ gpuDevice isNull ]) ifTrue: [
		"The SDL3GPUDevice is shared among windows"
	 	gpuDevice := OSSDL3Driver current gpuDevice.
		gpuDevice claimWindow: backendWindow sdl3Window ].

	(gpuTexture isNil or: [ gpuTexture isNull or: [ form extent ~= extent ] ])
		ifTrue: [ self initializeGPUResources ].

	^ true
]
