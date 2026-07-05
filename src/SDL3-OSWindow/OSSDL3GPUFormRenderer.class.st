"
I am an OSWindow form renderer that uses the SDL3 GPU API to upload and present Form bits.
"
Class {
	#name : 'OSSDL3GPUFormRenderer',
	#superclass : 'OSWindowFormRenderer',
	#traits : 'LibTSDL3',
	#classTraits : 'LibTSDL3 classTrait',
	#instVars : [
		'gpuTexture',
		'extent',
		'mutex',
		'swapchainTextureHolder',
		'needsFlush',
		'deferFlush',
		'uploadStream',
		'swapchainWidthHolder',
		'swapchainHeightHolder',
		'gpuDevice'
	],
	#pools : [
		'SDL3AllEnumerations'
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
			gpuTexture release.
			gpuTexture := nil ].
		
		uploadStream ifNotNil: [ 
			uploadStream destroy.
			uploadStream := nil ]
		]
]

{ #category : 'updating screen' }
OSSDL3GPUFormRenderer >> flush [
	"Process any pending presentation to the screen"

	mutex critical: [
		| commandBuffer |
		needsFlush ifFalse: [ ^ self ].
		self validate ifFalse: [ ^ self ].

		"Try to Acquire Swapchain texture (Non-blocking)."
		commandBuffer := gpuDevice acquireGPUCommandBuffer.
		commandBuffer
			acquireSwapchainTextureForWindow: backendWindow sdlWindow
			into: swapchainTextureHolder
			width: swapchainWidthHolder
			height: swapchainHeightHolder.

		"If swapchain is not available submit the empty command buffer and retry later"
		[	swapchainTextureHolder value isNull ifFalse: [

				commandBuffer blitFrom: gpuTexture to: swapchainTextureHolder value do: [ :blitInfo |
					blitInfo source 
						w: extent x;
						h: extent y.
						
					blitInfo destination 
						w: swapchainWidthHolder value;
						h: swapchainHeightHolder value.
						
					blitInfo
						loadOp: SDL_GPU_LOADOP_DONT_CARE;
						filter: SDL_GPU_FILTER_LINEAR ].

				needsFlush := false ]

			] ensure: [ commandBuffer submit ] ]
]

{ #category : 'accessing' }
OSSDL3GPUFormRenderer >> gpuDevice [

	^ gpuDevice
]

{ #category : 'accessing' }
OSSDL3GPUFormRenderer >> gpuDevice: aSDL3GPUDevice [

	gpuDevice := aSDL3GPUDevice
]

{ #category : 'updating' }
OSSDL3GPUFormRenderer >> updateGPUDevice: aGPUDevice [

	gpuDevice == aGPUDevice ifTrue: [ ^ self ].
	mutex critical: [ 
		(gpuDevice isNil not and: [ gpuDevice isNull not ]) ifTrue: [ 
			gpuDevice releaseWindow: backendWindow sdlWindow ].
		self destroy.
		gpuDevice := aGPUDevice.
		(gpuDevice isNil not and: [ gpuDevice isNull not ]) ifTrue: [ 
			gpuDevice claimWindow: backendWindow sdlWindow ] ]
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

	extent := form extent.

	gpuTexture ifNotNil: [ gpuTexture release ].
	
	gpuTexture := gpuDevice
		new2DGPUTextureFormat: SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM
		usage: SDL_GPU_TEXTUREUSAGE_SAMPLER | SDL_GPU_TEXTUREUSAGE_COLOR_TARGET
		width: extent x 
		height: extent y.

	uploadStream ifNil: [
		uploadStream := OSSDL3GPUUploadStream new.
		uploadStream gpuDevice: gpuDevice ].
	uploadStream resetForExtent: extent.

	"Pre-allocate to avoid GC pressure in hot path"
	swapchainTextureHolder := (FFIExternalValueHolder ofType: SDL_GPUTexture) new.
	swapchainWidthHolder := FFIUInt32 newValueHolder.
	swapchainHeightHolder := FFIUInt32 newValueHolder
]

{ #category : 'private' }
OSSDL3GPUFormRenderer >> mergedDamage: allDamage do: aBlock [
	"Merge overlapping or adjacent damage rectangles into a collection of disjoint vertical spans.
	Returns a collection of Rectangles (with full width or just vertical range info)."

	| sortedRects currentSpan |
	allDamage ifEmpty: [ ^ #() ].

	"Filter and sort by top coordinate"
	sortedRects := OrderedCollection new.
	allDamage do: [ :each |
		each intersect: (0@0 extent: extent) ifPresent: [ :intersection |
			sortedRects add: intersection ] ].
	
	sortedRects ifEmpty: [ ^ #() ].
	sortedRects sort: [ :a :b | a top < b top ].

	currentSpan := sortedRects first.

	sortedRects allButFirstDo: [ :each |
		each top <= currentSpan bottom
			ifTrue: [ currentSpan := currentSpan merge: each ]
			ifFalse: [ 
				aBlock value: currentSpan.
				currentSpan := each ] ].
	
	aBlock value: currentSpan
]

{ #category : 'testing' }
OSSDL3GPUFormRenderer >> needsFlush [

	^ needsFlush
]

{ #category : 'accessing' }
OSSDL3GPUFormRenderer >> outputExtent [
	
	^ backendWindow sdlWindow pixelExtent
]

{ #category : 'updating screen' }
OSSDL3GPUFormRenderer >> updateAll [

	self updateRectangle: (0@0 extent: extent)
]

{ #category : 'updating screen' }
OSSDL3GPUFormRenderer >> updateAreas: allDamage immediate: forceToScreen [

	mutex critical: [
		self validate ifFalse: [ ^ self ].

		allDamage ifEmpty: [ ^ self ].

		"1. Identify disjoint vertical spans of damage.
		  We merge them to reduce the number of BitBlt calls."
		self mergedDamage: allDamage do: [ :each |
			uploadStream
				uploadForm: form
				region: each
				to: gpuTexture
				at: each origin ].
		
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

	mutex critical: [ self validate ]
]

{ #category : 'private' }
OSSDL3GPUFormRenderer >> validate [

	form ifNil: [ ^ false ].

	(gpuDevice isNil or: [ gpuDevice isNull ]) ifTrue: [ ^ false ].

	(gpuTexture isNil or: [ 
		 gpuTexture isNull or: [ 
			 uploadStream isNil or: [ form extent ~= extent ] ] ]) ifTrue: [ 
		self initializeGPUResources ].

	^ true
]

