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

	super close.

	(mainLoopProcess isNotNil and: [ mainLoopProcess isTerminated not ])
		ifTrue: [ mainLoopProcess terminate ].

	self ensureQuitSDL3.
	Smalltalk snapshot: false andQuit: true
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

	| commandBuffer swapchainTextureHolder colorTargetInfo renderPass |
	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	
	swapchainTextureHolder := (FFIExternalValueHolder ofType: SDL3GPUTexture) new.
	sdl assertSuccess:
		(commandBuffer
			acquireGPUSwapchainTextureForWindow: window
			into: swapchainTextureHolder
			width: nil
			height: nil).

	"A minimized window returns NULL which would mean we'll skip
	rendering this frame."
	swapchainTextureHolder tfPointerAddress isNull
		ifTrue: [ ^ commandBuffer cancel ].
	
	colorTargetInfo := SDL3GPUColorTargetInfo new.
	colorTargetInfo
		texture: swapchainTextureHolder value;
		storeOp: SDL3GPUStoreOp store;
		loadOp: SDL3GPULoadOp clear.
	colorTargetInfo clearColor updateFrom:
		(Color h: (Time millisecondClockValue / 10.0) \\ 360 s: 1.0 v: 1.0).

	renderPass :=
		commandBuffer
			beginGPURenderPassColorTargetInfos: colorTargetInfo
			numColorTargets: 1
			depthStencilTargetInfo: nil.
	renderPass assertNotNullReturn.

	"todo: perform draw operations in the render pass"

	renderPass end.

	commandBuffer submit
]

{ #category : 'running' }
SDL3GPUClearDemo >> run [
	"Run headless with:
	./pharo Pharo.image eval --no-quit 'SDL3GPUClearDemo new run'.
	"

	self open.
	self runUntilQuit.
	self close
]

{ #category : 'running' }
SDL3GPUClearDemo >> runUntilQuit [
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
