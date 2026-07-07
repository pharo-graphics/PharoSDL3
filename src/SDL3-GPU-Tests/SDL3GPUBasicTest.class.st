"
I am a base test for the SDL3 GPU API.
"
Class {
	#name : 'SDL3GPUBasicTest',
	#superclass : 'SDL3GPUTest',
	#category : 'SDL3-GPU-Tests-Basic',
	#package : 'SDL3-GPU-Tests',
	#tag : 'Basic'
}

{ #category : 'tests' }
SDL3GPUBasicTest >> test01AcquireAndCancelCommandBuffer [

	| commandBuffer |
	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer cancel
]

{ #category : 'tests' }
SDL3GPUBasicTest >> test02AcquireSwapchainTextureAndSubmitEmpty [

	| commandBuffer textureHolder |
	commandBuffer := gpuDevice acquireGPUCommandBuffer.

	textureHolder := (FFIExternalValueHolder ofType: SDL_GPUTexture) new.
	
	commandBuffer
		waitAndAcquireSwapchainTextureForWindow: window
		into: textureHolder width: nil height: nil.
		
	self deny: textureHolder value isNull.

	commandBuffer submit
]

{ #category : 'tests' }
SDL3GPUBasicTest >> test03ClearColorInRenderPass [

	| commandBuffer textureHolder colorTargetInfos |
	commandBuffer := gpuDevice acquireGPUCommandBuffer.

	textureHolder := (FFIExternalValueHolder ofType: SDL_GPUTexture) new.
	
	commandBuffer
		waitAndAcquireSwapchainTextureForWindow: window
		into: textureHolder width: nil height: nil.
	
	self deny: textureHolder value isNull.
	
	colorTargetInfos := SDL_GPUColorTargetInfo safeNewArray: 1.
	colorTargetInfos first
		beClearTexture: textureHolder value
		color: Color yellow.

	commandBuffer renderPassTargets: colorTargetInfos do: [ :renderPass | ].
		
	commandBuffer submit
]
