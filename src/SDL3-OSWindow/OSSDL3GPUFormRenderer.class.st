"
I am an OSWindow form renderer that uses the SDL3 GPU API to upload and present Form bits.
"
Class {
	#name : 'OSSDL3GPUFormRenderer',
	#superclass : 'OSWindowFormRenderer',
	#instVars : [
		'gpuDevice',
		'gpuTexture',
		'transferBuffer',
		'extent',
		'deferUpdates',
		'mutex'
	],
	#pools : [
		'SDL3GPUTextureUsageFlags'
	],
	#category : 'SDL3-OSWindow',
	#package : 'SDL3-OSWindow'
}

{ #category : 'deleting' }
OSSDL3GPUFormRenderer >> destroy [
	mutex critical: [
		gpuTexture ifNotNil: [ gpuDevice releaseGPUTexture: gpuTexture ].
		transferBuffer ifNotNil: [ gpuDevice releaseGPUTransferBuffer: transferBuffer ].
		gpuTexture := nil.
		transferBuffer := nil.
		gpuDevice := nil.
	].
	super destroy.
]

{ #category : 'initialization' }
OSSDL3GPUFormRenderer >> initialize [
	super initialize.
	deferUpdates := false.
	mutex := Mutex new.
]

{ #category : 'private' }
OSSDL3GPUFormRenderer >> initializeGPURenderer [
	gpuDevice := backendWindow gpuDevice.
	gpuDevice claimWindow: backendWindow sdl3Window.
]

{ #category : 'private' }
OSSDL3GPUFormRenderer >> initializeGPUResources [
	| totalBytes |
	gpuTexture ifNotNil: [ gpuDevice releaseGPUTexture: gpuTexture ].
	transferBuffer ifNotNil: [ gpuDevice releaseGPUTransferBuffer: transferBuffer ].
	
	extent := form extent.
	totalBytes := extent x * 4 * extent y.
	
	gpuTexture := gpuDevice 
		new2DTextureFormat: SDL3GPUTextureFormat b8g8r8a8Unorm 
		usage: SDL_GPU_TEXTUREUSAGE_SAMPLER asInteger
		width: extent x 
		height: extent y.
		
	transferBuffer := gpuDevice newUploadTransferBuffer: totalBytes.
]

{ #category : 'updating screen' }
OSSDL3GPUFormRenderer >> updateAll [
	| commandBuffer swapchainTextureHolder blitInfo copyPass source destination |
	mutex critical: [
		self validate ifFalse: [ ^ self ].
		deferUpdates ifTrue: [ ^ self ].

		"1. Upload bits from Smalltalk Form to the mapped Transfer Buffer"
		transferBuffer updateFromForm: form device: gpuDevice.

		"2. Start a single Command Buffer for the whole frame"
		commandBuffer := gpuDevice acquireGPUCommandBuffer.
		
		"3. Copy from Transfer Buffer to the internal GPU Texture"
		copyPass := commandBuffer beginGPUCopyPass.
		
		source := SDL3GPUTextureTransferInfo new.
		source transferBuffer: transferBuffer.
		source offset: 0; pixelsPerRow: 0; rowsPerLayer: 0.
		
		destination := SDL3GPUTextureRegion new.
		destination texture: gpuTexture.
		destination x: 0; y: 0; z: 0; w: extent x; h: extent y; d: 1.
		destination mipLevel: 0; layer: 0.
		
		copyPass uploadToGPUTextureSource: source destination: destination cycle: false.
		copyPass end.
		
		"4. Blit from the internal GPU Texture to the Swapchain"
		swapchainTextureHolder := (FFIExternalValueHolder ofType: SDL3GPUTexture) new.
		(commandBuffer
			waitAndAcquireGPUSwapchainTextureForWindow: backendWindow sdl3Window
			into: swapchainTextureHolder
			width: nil
			height: nil) ifFalse: [ 
				commandBuffer cancel.
				^ self ].
				
		blitInfo := SDL3GPUBlitInfo new.
		blitInfo source texture: gpuTexture.
		blitInfo source x: 0; y: 0; w: extent x; h: extent y.
		blitInfo source mipLevel: 0; layerOrDepthPlane: 0.
		
		blitInfo destination texture: swapchainTextureHolder value.
		blitInfo destination x: 0; y: 0; w: extent x; h: extent y.
		blitInfo destination mipLevel: 0; layerOrDepthPlane: 0.
		
		blitInfo loadOp: SDL3GPULoadOp dontCare.
		blitInfo filter: SDL3GPUFilter nearest.
		blitInfo cycle: false.
		blitInfo flipMode: SDL3FlipMode none.

		commandBuffer blitGPUTextureInfo: blitInfo.

		"5. Submit the combined work"
		commandBuffer submit.
	]
]

{ #category : 'updating screen' }
OSSDL3GPUFormRenderer >> updateRectangle: rectangle [
	"For simplicity in the initial GPU implementation, we update the whole texture if any part changed."
	self updateAll
]

{ #category : 'private' }
OSSDL3GPUFormRenderer >> validate [
	form ifNil: [ ^ false ].
	gpuDevice ifNil: [ self initializeGPURenderer ].
	(gpuTexture isNil or: [ form extent ~= extent ]) ifTrue: [ self initializeGPUResources ].
	^ true
]
