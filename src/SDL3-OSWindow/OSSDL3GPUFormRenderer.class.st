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
		'gpuTransferBuffer',
		'gpuTextureFormat',
		'swapchainTextureHolder',
		'pooledTextureTransferInfo',
		'pooledTextureRegion',
		'pooledSourceLocation',
		'pooledDestinationLocation',
		'externalForm',
		'needsFlush',
		'deferFlush'
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
	"Destroy my SDL3 resources. You can send #validate to reinitialize the resources. Super-send is avoided since it looses the backendWindow, and we want to keep the reference."

	mutex critical: [
		gpuTexture ifNotNil: [
			gpuDevice releaseGPUTexture: gpuTexture ].
		gpuTransferBuffer ifNotNil: [
			gpuDevice releaseGPUTransferBuffer: gpuTransferBuffer ].
		externalForm ifNotNil: [
			externalForm destroySurface ].
		gpuTexture := nil.
		gpuTransferBuffer := nil.
		gpuDevice := nil ]
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
OSSDL3GPUFormRenderer >> initializeGPUDevice [

	gpuDevice := backendWindow gpuDevice.

	"Query swapchain format to match our internal texture for fast copies"
	gpuTextureFormat := self ffiLibrary 
		getGPUSwapchainTextureFormatDevice: gpuDevice 
		window: backendWindow sdl3Window.

	"Explicitly set VSYNC mode to avoid tearing"
	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setGPUSwapchainParametersDevice: gpuDevice 
			window: backendWindow sdl3Window 
			swapchainComposition: SDL3GPUSwapchainComposition sdr 
			presentMode: SDL3GPUPresentMode vsync)
]

{ #category : 'private' }
OSSDL3GPUFormRenderer >> initializeGPUResources [

	| totalBytes |
	gpuTexture ifNotNil: [ gpuDevice releaseGPUTexture: gpuTexture ].
	gpuTransferBuffer ifNotNil: [ gpuDevice releaseGPUTransferBuffer: gpuTransferBuffer ].
	
	extent := form extent.
	totalBytes := extent x * 4 * extent y.
	
	"Backing store needs SAMPLER usage for copying/rendering to swapchain"
	gpuTexture := gpuDevice
		new2DTextureFormat: gpuTextureFormat
		usage: (SDL_GPU_TEXTUREUSAGE_SAMPLER | SDL_GPU_TEXTUREUSAGE_COLOR_TARGET) asInteger
		width: extent x 
		height: extent y.
	gpuTexture assertNotNullReturn.

	gpuTransferBuffer := gpuDevice newUploadTransferBuffer: totalBytes.
	gpuTransferBuffer assertNotNullReturn.
	
	"New texture is empty/garbage, so it is dirty relative to screen"
	needsFlush := true.
	
	"Pre-allocate pooled structures to avoid GC pressure in hot path"
	pooledTextureTransferInfo := SDL3GPUTextureTransferInfo new.
	pooledTextureTransferInfo transferBuffer: gpuTransferBuffer.
	pooledTextureTransferInfo pixelsPerRow: 0; rowsPerLayer: 0.
	pooledTextureTransferInfo offset: 0.

	pooledTextureRegion := SDL3GPUTextureRegion new.
	pooledTextureRegion texture: gpuTexture.
	pooledTextureRegion z: 0; d: 1; mipLevel: 0; layer: 0.

	pooledSourceLocation := SDL3GPUTextureLocation new.
	pooledSourceLocation texture: gpuTexture.
	pooledSourceLocation z: 0; mipLevel: 0; layer: 0.

	pooledDestinationLocation := SDL3GPUTextureLocation new.
	pooledDestinationLocation z: 0; mipLevel: 0; layer: 0
]

{ #category : 'private' }
OSSDL3GPUFormRenderer >> mergeDamageIntoSpans: allDamage [
	"Merge overlapping or adjacent damage rectangles into a collection of disjoint vertical spans.
	 Returns a collection of Rectangles (with full width or just vertical range info)."

	| sortedRects spans currentSpan |
	allDamage ifEmpty: [ ^ #() ].

	"Filter and sort by top coordinate"
	sortedRects := (allDamage 
		collect: [ :r | r intersect: (0@0 extent: extent) ifNone: [ nil ] ])
		select: [ :each | each isNotNil ];
		sorted: [ :a :b | a top < b top ].
	
	sortedRects ifEmpty: [ ^ #() ].

	spans := OrderedCollection new.
	currentSpan := sortedRects first.

	sortedRects allButFirstDo: [ :rect |
		rect top <= currentSpan bottom
			ifTrue: [ currentSpan := currentSpan merge: rect ]
			ifFalse: [ 
				spans add: currentSpan.
				currentSpan := rect ] ].
	
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

	"A. Try Acquire Swapchain texture (Non-blocking).
	   This avoids starving background processes when VSYNC is enabled."
	| copyPass |
	(commandBuffer
		acquireGPUSwapchainTextureForWindow: backendWindow sdl3Window
		into: swapchainTextureHolder
		width: nil
		height: nil).
				
	swapchainTextureHolder value isNull ifTrue: [ 
		"Swapchain busy. Submit existing uploads and try again in the next flush."
		self ffiLibrary assertSuccess: commandBuffer submit.
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

	form ifNil: [ ^ self ].
	self updateAreas: { 0@0 extent: form extent } immediate: true
]

{ #category : 'updating screen' }
OSSDL3GPUFormRenderer >> updateAreas: allDamage immediate: forceToScreen [

	| damageSpans currentOffset mappedAddress commandBuffer |
	mutex critical: [
		self validate ifFalse: [ ^ self ].

		"1. Identify disjoint vertical spans of damage and expand each to FULL WIDTH."
		damageSpans := self mergeDamageIntoSpans: allDamage.
		damageSpans ifEmpty: [ ^ self ].

		"2. Capture and Upload each span to backing store IMMEDIATELY."
		mappedAddress := gpuDevice mapGPUTransferBuffer: gpuTransferBuffer cycle: true.
		mappedAddress isNull ifTrue: [ self error: 'Failed to map GPU transfer buffer' ].
		
		commandBuffer := gpuDevice acquireGPUCommandBuffer.
		
		[ | copyPass |
			currentOffset := 0.
			copyPass := commandBuffer beginGPUCopyPass.
			
			damageSpans do: [ :span |
				| surgicalRect |
				surgicalRect := 0 @ span top extent: extent x @ span height.
				
				externalForm
					resetExtent: surgicalRect extent
					depth: 32
					pitch: extent x * 4
					bits: mappedAddress + currentOffset.
				[ 
					externalForm copy: surgicalRect from: form to: 0@0 rule: Form over
				] ensure: [ 
					externalForm destroySurface 
				].
				
				pooledTextureTransferInfo offset: currentOffset.
				pooledTextureRegion x: 0; y: surgicalRect top; w: extent x; h: surgicalRect height.
				
				copyPass uploadToGPUTextureSource: pooledTextureTransferInfo destination: pooledTextureRegion cycle: false.
				
				currentOffset := currentOffset + (surgicalRect width * surgicalRect height * 4) ].
				
			copyPass end.
		] ensure: [ 
			gpuDevice unmapGPUTransferBuffer: gpuTransferBuffer
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

{ #category : 'private' }
OSSDL3GPUFormRenderer >> validate [

	form ifNil: [ ^ false ].

	(gpuDevice isNil or: [ gpuDevice isNull ])
		ifTrue: [ self initializeGPUDevice ].

	(gpuTexture isNil or: [ gpuTexture isNull or: [ form extent ~= extent ] ])
		ifTrue: [ self initializeGPUResources ].

	^ true
]
