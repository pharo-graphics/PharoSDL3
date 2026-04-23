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
		'deferUpdates',
		'mutex',
		'accumulatedDamage',
		'gpuTransferBuffer'
	],
	#pools : [
		'SDL3GPUTextureFormat',
		'SDL3GPUTextureUsageFlags'
	],
	#category : 'SDL3-OSWindow-Renderers',
	#package : 'SDL3-OSWindow',
	#tag : 'Renderers'
}

{ #category : 'updating screen' }
OSSDL3GPUFormRenderer >> accumulateDamage: aRectangle [

	accumulatedDamage add: aRectangle
]

{ #category : 'accessing' }
OSSDL3GPUFormRenderer >> accumulatedDamage [

	^ accumulatedDamage
]

{ #category : 'updating screen' }
OSSDL3GPUFormRenderer >> clearAccumulatedDamage [

	accumulatedDamage removeAll
]

{ #category : 'morphic integration' }
OSSDL3GPUFormRenderer >> deferUpdatesWhile: aBlock [
	"Defer screen updates during the execution of aBlock."

	deferUpdates := true.
	aBlock ensure: [ 
		deferUpdates := false.
		self useDeferredUpdates ]
]

{ #category : 'deleting' }
OSSDL3GPUFormRenderer >> destroy [
	"Destroy my SDL3 resources. You can send #validate to reinitialize the resources. Super-send is avoided since it looses the backendWindow, and we want to keep the reference."

	mutex critical: [
		gpuTexture ifNotNil: [
			gpuDevice releaseGPUTexture: gpuTexture ].
		gpuTransferBuffer ifNotNil: [
			gpuDevice releaseGPUTransferBuffer: gpuTransferBuffer ].
		gpuTexture := nil.
		gpuTransferBuffer := nil.
		gpuDevice := nil ]
]

{ #category : 'initialization' }
OSSDL3GPUFormRenderer >> initialize [

	super initialize.
	deferUpdates := false.
	mutex := Mutex new.
	accumulatedDamage := OrderedCollection new
]

{ #category : 'private' }
OSSDL3GPUFormRenderer >> initializeGPUDevice [

	gpuDevice := backendWindow gpuDevice.

	"Explicitly set VSYNC to ensure consistent behavior and avoid tearing."
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
	
	gpuTexture := gpuDevice
		new2DTextureFormat: SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM
		usage: SDL_GPU_TEXTUREUSAGE_SAMPLER asInteger
		width: extent x 
		height: extent y.
	gpuTexture assertNotNullReturn.

	gpuTransferBuffer := gpuDevice newUploadTransferBuffer: totalBytes.
	gpuTransferBuffer assertNotNullReturn
]

{ #category : 'accessing' }
OSSDL3GPUFormRenderer >> outputExtent [
	
	^ backendWindow sdl3Window pixelExtent
]

{ #category : 'updating screen' }
OSSDL3GPUFormRenderer >> updateAll [

	form ifNil: [ ^ self ].
	self updateAreas: { 0@0 extent: form extent } immediate: true
]

{ #category : 'updating screen' }
OSSDL3GPUFormRenderer >> updateAreas: allDamage immediate: forceToScreen [

	| commandBuffer swapchainTextureHolder blitInfo currentAreas |
	mutex critical: [
		self validate ifFalse: [ ^ self ].

		"If updates are deferred, we accumulate damage and stop here."
		deferUpdates ifTrue: [ 
			allDamage do: [ :rect | self accumulateDamage: rect ].
			^ self ].

		currentAreas := accumulatedDamage asOrderedCollection.
		currentAreas addAll: allDamage.
		currentAreas ifEmpty: [ ^ self ].

		"1. Start a single Command Buffer for the whole frame"
		commandBuffer := gpuDevice acquireGPUCommandBuffer.

		"2. Upload only the damaged bits from Smalltalk Form to the internal GPU Texture"
		self uploadInternalTextureAreas: currentAreas commandBuffer: commandBuffer.
		
		"3. Acquire Swapchain"
		swapchainTextureHolder := (FFIExternalValueHolder ofType: SDL3GPUTexture) new.
		self ffiLibrary assertSuccess:
			(commandBuffer
				waitAndAcquireGPUSwapchainTextureForWindow: backendWindow sdl3Window
				into: swapchainTextureHolder
				width: nil
				height: nil).
				
		swapchainTextureHolder value isNull ifTrue: [ 
			self ffiLibrary assertSuccess: commandBuffer cancel.
			^ self ].
				
		"4. Blit each damage area from internal GPU Texture to the Swapchain"
		currentAreas do: [ :rect |
			| intersection |
			intersection := rect intersect: (0@0 extent: extent) ifNone: [ nil ].
			intersection ifNotNil: [ 
				blitInfo := SDL3GPUBlitInfo new.

				blitInfo source
					texture: gpuTexture;
					x: intersection left;
					y: intersection top;
					w: intersection width;
					h: intersection height;
					mipLevel: 0;
					layerOrDepthPlane: 0.

				blitInfo destination
					texture: swapchainTextureHolder value;
					x: intersection left;
					y: intersection top;
					w: intersection width;
					h: intersection height;
					mipLevel: 0;
					layerOrDepthPlane: 0.

				blitInfo
					loadOp: SDL3GPULoadOp dontCare;
					filter: SDL3GPUFilter nearest;
					cycle: false;
					flipMode: SDL3FlipMode none.

				commandBuffer blitGPUTextureInfo: blitInfo.
			]
		].

		"5. Submit the combined work and clear state"
		self ffiLibrary assertSuccess: commandBuffer submit.

		self clearAccumulatedDamage ]
]

{ #category : 'updating screen' }
OSSDL3GPUFormRenderer >> updateRectangle: rectangle [
	"Use batch update for single rectangle as well"

	self updateAreas: { rectangle } immediate: true
]

{ #category : 'private' }
OSSDL3GPUFormRenderer >> uploadInternalTextureAreas: allDamage commandBuffer: commandBuffer [

	| copyPass source destination |
	copyPass := commandBuffer beginGPUCopyPass.
	
	allDamage do: [ :rect |
		| intersection |
		"Upload SDL3 call fails with float values on rect, then we expand to tolerate it."
		intersection := rect expanded intersect: (0@0 extent: extent) ifNone: [ nil ].
		intersection ifNotNil: [ 
			"1. Upload partial bits from Form to the mapped Transfer Buffer.
			 For simplicity and to correctly handle pitch/stride, we use updateFromForm:area:device:
			 which correctly maps/unmaps the buffer for each rectangle.
			 
			 Optimization note: To further optimize, we could map ONCE and do multiple BitBlt copies, 
			 then perform multiple uploadToGPUTexture calls inside the same copyPass."
			gpuTransferBuffer updateFromForm: form area: intersection device: gpuDevice.

			"Since we copy only the sub-rect to the beginning of the transferBuffer in updateFromForm:area:,
			 the source offset is 0, but we must use the correct pitch."
			source := SDL3GPUTextureTransferInfo new.
			source
				transferBuffer: gpuTransferBuffer;
				offset: 0;
				pixelsPerRow: intersection width;
				rowsPerLayer: intersection height.

			destination := SDL3GPUTextureRegion new.
			destination
				texture: gpuTexture;
				x: intersection left;
				y: intersection top;
				z: 0;
				w: intersection width;
				h: intersection height;
				d: 1;
				mipLevel: 0;
				layer: 0.

			copyPass uploadToGPUTextureSource: source destination: destination cycle: false
		]
	].
	
	copyPass end
]

{ #category : 'private' }
OSSDL3GPUFormRenderer >> useDeferredUpdates [
	"Perform a full blit of the internal texture to the screen"

	self updateAll
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
