"
I'm a simple demo of SDL3 GPU API that clears the window with changing colors, based on SDL's ""test/testgpu_simple_clear.c"".
"
Class {
	#name : 'SDL3GPUClearDemo',
	#superclass : 'SDL3Demo',
	#instVars : [
		'mainLoopProcess',
		'gpuDevice'
	],
	#category : 'SDL3-Tests-Shaders',
	#package : 'SDL3-Tests',
	#tag : 'Shaders'
}

{ #category : 'lifecycle' }
SDL3GPUClearDemo >> close [

	gpuDevice ifNotNil: #destroy.

	super close.

	(mainLoopProcess isNotNil and: [ mainLoopProcess isTerminated not ])
		ifTrue: [ mainLoopProcess terminate ].

	self ensureQuitSDL3
]

{ #category : 'rendering' }
SDL3GPUClearDemo >> doRenderPassesOn: aSDL3GPUTexture with: aSDL3GPUCommandBuffer [

	| animatedHue colorTargetInfo renderPass |
	
	animatedHue := (Time millisecondClockValue / 10.0) \\ 360.
	
	colorTargetInfo := SDL3GPUColorTargetInfo new.
	colorTargetInfo
		texture: aSDL3GPUTexture;
		storeOp: SDL3GPUStoreOp store;
		loadOp: SDL3GPULoadOp clear.
	colorTargetInfo clearColor updateFrom: (Color h: animatedHue s: 1.0 v: 1.0).

	renderPass :=
		aSDL3GPUCommandBuffer
			beginGPURenderPassColorTargetInfos: colorTargetInfo
			numColorTargets: 1
			depthStencilTargetInfo: nil.
	renderPass assertNotNullReturn.

	"HERE: use `SDL3GPURenderPass` to draw"

	renderPass end
]

{ #category : 'running' }
SDL3GPUClearDemo >> iterateUntilQuit [

	| quit |
	quit := false.

	[ quit ] whileFalse: [
		self pollEventsDo: [ :evt |
			evt type = SDL3EventType quit ifTrue: [ quit := true ].
			evt type = SDL3EventType keyDown ifTrue: [
				evt key = SDL3Keycode escape asInteger ifTrue: [ quit := true ] ] ].

		self render.

		16.6 milliSeconds wait ]
]

{ #category : 'lifecycle' }
SDL3GPUClearDemo >> open [

	self ensureInitSDL3.

	gpuDevice := sdl
		newGPUDeviceFormatFlags: SDL3GPUShaderFormat dxil | SDL3GPUShaderFormat msl | SDL3GPUShaderFormat spirv
		debugMode: true name: nil.
	gpuDevice assertNotNullReturn.

	"Windows can be created after the GPU device was created (they need to be 'claimed')"
	window :=
		sdl
			newWindowTitle: self className, ' - Press ESC to quit'
			w: 400
			h: 300
			flags: 0.
	window assertNotNullReturn.
	sdl assertSuccess: (gpuDevice claimWindow: window)
]

{ #category : 'rendering' }
SDL3GPUClearDemo >> render [

	| commandBuffer swapchainTextureHolder |
	commandBuffer := gpuDevice acquireGPUCommandBuffer.

	swapchainTextureHolder := (FFIExternalValueHolder ofType: SDL3GPUTexture) new.
	sdl assertSuccess:
		(commandBuffer
			 waitAndAcquireGPUSwapchainTextureForWindow: window
			 into: swapchainTextureHolder
			 width: nil
			 height: nil).
	
	"A NULL pointer means we'll skip rendering this time.
	(This happens when the window is minimized, for example.)"
	swapchainTextureHolder value isNull ifTrue: [
		^ commandBuffer cancel ].

	self
		doRenderPassesOn: swapchainTextureHolder value
		with: commandBuffer.

	commandBuffer submit
]

{ #category : 'running' }
SDL3GPUClearDemo >> run [
	"Run headless with:
	./pharo Pharo.image eval 'SDL3GPUClearDemo new run'
	"

	self open.
	self iterateUntilQuit.
	self close
]
