"
I'm a simple demo of SDL3 GPU API that clears the window with changing colors, based on SDL's ""test/testgpu_simple_clear.c"".
"
Class {
	#name : 'SDL3GPUClearDemo',
	#superclass : 'SDL3GPUDemoApp',
	#category : 'SDL3-GPUDemos-Base',
	#package : 'SDL3-GPUDemos',
	#tag : 'Base'
}

{ #category : 'rendering' }
SDL3GPUClearDemo >> doRenderPassesOn: swapchainTexture with: aCommandBuffer [

	| animatedHue renderPass colorTargetInfos |
	animatedHue := (Time millisecondClockValue / 10.0) \\ 360.

	colorTargetInfos := FFIExternalArray externalNewType: SDL_GPUColorTargetInfo size: 1.
	colorTargetInfos autoRelease.
	colorTargetInfos first
		texture: swapchainTexture;
		storeOp: SDL_GPU_STOREOP_STORE;
		loadOp: SDL_GPU_LOADOP_CLEAR;
		updateClearColorFrom: (Color h: animatedHue s: 1.0 v: 1.0).

	renderPass :=
		aCommandBuffer
			beginGPURenderPassColorTargetInfos: colorTargetInfos
			depthStencilTargetInfo: nil.

	"HERE: use `SDL3GPURenderPass` to draw"

	renderPass end
]

{ #category : 'accessing' }
SDL3GPUClearDemo >> initialExtent [

	^ 400 @ 300
]
