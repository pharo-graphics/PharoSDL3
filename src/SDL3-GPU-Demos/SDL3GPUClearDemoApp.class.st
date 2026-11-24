"
This demo shows basic hardware-accelerated GPU initialization, render pass setup, and screen clearing.
"
Class {
	#name : 'SDL3GPUClearDemoApp',
	#superclass : 'SDL3GPUDemoApp',
	#instVars : [
		'colorTargetInfos'
	],
	#category : 'SDL3-GPU-Demos-Base',
	#package : 'SDL3-GPU-Demos',
	#tag : 'Base'
}

{ #category : 'rendering' }
SDL3GPUClearDemoApp >> doRenderPassesOn: swapchainTexture with: aCommandBuffer [

	| animatedHue |
	animatedHue := Time millisecondClockValue / 10.0 \\ 360.

	colorTargetInfos first beClearTexture: swapchainTexture color: (Color h: animatedHue s: 1.0 v: 1.0).

	aCommandBuffer renderPassTargets: colorTargetInfos do: [ :renderPass | "HERE: use `SDL3GPURenderPass` to draw" ]
]

{ #category : 'accessing' }
SDL3GPUClearDemoApp >> initialExtent [

	^ 400 @ 300
]

{ #category : 'lifecycle' }
SDL3GPUClearDemoApp >> setUp [

	super setUp.
	DiScope own: (colorTargetInfos := SDL3Array unownedNewType: SDL_GPUColorTargetInfo size: 1)
]
