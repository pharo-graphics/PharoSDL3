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
	#pools : [
		'SDL3EventType',
		'SDL3GPULoadOp',
		'SDL3GPUStoreOp',
		'SDL3Keycode'
	],
	#category : 'SDL3-Tests-Shaders',
	#package : 'SDL3-Tests',
	#tag : 'Shaders'
}

{ #category : 'lifecycle' }
SDL3GPUClearDemo >> close [

	super close.

	(mainLoopProcess isNotNil and: [ mainLoopProcess isTerminated not ])
		ifTrue: [ mainLoopProcess terminate ].

	self ensureQuitSDL3
]

{ #category : 'rendering' }
SDL3GPUClearDemo >> doRenderPassesOn: aSDL3GPUTexture with: aSDL3GPUCommandBuffer [

	| colorTargetInfo renderPass |
	colorTargetInfo := SDL_GPUColorTargetInfo new.
	colorTargetInfo
		texture: aSDL3GPUTexture;
		storeOp: SDL_GPU_STOREOP_STORE;
		loadOp: SDL_GPU_LOADOP_CLEAR.
	colorTargetInfo clearColor updateFrom:
		(Color h: (Time millisecondClockValue / 10.0) \\ 360 s: 1.0 v: 1.0).

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
			evt type = SDL_EVENT_QUIT ifTrue: [ quit := true ].

			evt type = SDL_EVENT_KEY_DOWN ifTrue: [
				evt key = SDLK_ESCAPE asInteger ifTrue: [ quit := true ] ] ].

		self render.

		16.6 milliSeconds wait ]
]

{ #category : 'lifecycle' }
SDL3GPUClearDemo >> open [

	self ensureInitSDL3.

	window :=
		sdl
			newWindowTitle: self className, ' - Low-level GPU demo - Press ESC to quit'
			w: 800
			h: 600
			flags: 0.
	window assertNotNullReturn.

	renderer := window newGPURenderer.
	renderer assertNotNullReturn.
	
	gpuDevice := renderer gpuDevice.
	gpuDevice assertNotNullReturn
]

{ #category : 'rendering' }
SDL3GPUClearDemo >> render [

	| commandBuffer swapchainTextureHolder |
	commandBuffer := gpuDevice acquireGPUCommandBuffer.

	swapchainTextureHolder :=
		(FFIExternalValueHolder ofType: SDL_GPUTexture) new.

	sdl assertSuccess: (commandBuffer
			 waitAndAcquireGPUSwapchainTextureForWindow: window
			 into: swapchainTextureHolder
			 width: nil
			 height: nil).

	"A minimized window returns NULL which would mean we'll skip
	rendering this frame."
	swapchainTextureHolder tfPointerAddress isNull ifTrue: [
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
