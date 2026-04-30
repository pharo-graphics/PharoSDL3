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
		'gpuTextureFormat',
		'swapchainTextureHolder',
		'pooledSourceLocation',
		'pooledDestinationLocation',
		'needsFlush',
		'deferFlush',
		'uploadStream'
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
		
		uploadStream ifNotNil: [ 
			uploadStream destroy.
			uploadStream := nil ].

		gpuTexture := nil ]
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
	needsFlush := false
]

{ #category : 'private' }
OSSDL3GPUFormRenderer >> initializeGPUResources [
	"Initialize the SDL3 resources that depend on the form extent"

	gpuTexture ifNotNil: [ gpuDevice releaseGPUTexture: gpuTexture ].
	
	extent := form extent.
	
	uploadStream ifNil: [ 
		uploadStream := OSSDL3GPUUploadStream new.
		uploadStream gpuDevice: OSSDL3Driver new gpuDevice.
		uploadStream resetForExtent: extent ].

	"Backing store needs SAMPLER usage for copying/rendering to swapchain"
	gpuTexture := gpuDevice
		new2DTextureFormat: SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM
		usage: SDL_GPU_TEXTUREUSAGE_SAMPLER | SDL_GPU_TEXTUREUSAGE_COLOR_TARGET
		width: extent x 
		height: extent y.
	gpuTexture assertNotNullReturn.

	"Pre-allocate pooled structures to avoid GC pressure in hot path"
	swapchainTextureHolder := (FFIExternalValueHolder ofType: SDL3GPUTexture) new.
	pooledSourceLocation := SDL3GPUTextureLocation new.
	pooledSourceLocation texture: gpuTexture.
	pooledDestinationLocation := SDL3GPUTextureLocation new.

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

	pooledDestinationLocation texture: swapchainTextureHolder value.

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

	self updateAreas: { form boundingBox } immediate: true
]

{ #category : 'updating screen' }
OSSDL3GPUFormRenderer >> updateAreas: allDamage immediate: forceToScreen [

	mutex critical: [
		self validate ifFalse: [ ^ self ].

		allDamage ifEmpty: [ ^ self ].

		"1. Identify disjoint vertical spans of damage.
		   We still merge them to reduce the number of BitBlt calls."
		(self mergeDamage: allDamage) do: [ :span |
			uploadStream uploadForm: form region: span to: gpuTexture ].
		
		uploadStream finish.

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

{ #category : 'updating screen' }
OSSDL3GPUFormRenderer >> updateToNewResolution [

	self validate
]

{ #category : 'private' }
OSSDL3GPUFormRenderer >> validate [

	form ifNil: [ ^ false ].

	(gpuDevice isNil or: [ gpuDevice isNull ]) ifTrue: [
		"The SDL3GPUDevice is shared among windows"
		Stdio stdout << backendWindow sdl3Window asString; lf; flush.

	 	gpuDevice := OSSDL3Driver current gpuDevice.
		gpuDevice claimWindow: backendWindow sdl3Window ].

	(gpuTexture isNil or: [ uploadStream isNil or: [ form extent ~= extent ] ]) ifTrue: [ 
		uploadStream ifNotNil: [ uploadStream resetForExtent: form extent ].
		self initializeGPUResources ].

	^ true
]
