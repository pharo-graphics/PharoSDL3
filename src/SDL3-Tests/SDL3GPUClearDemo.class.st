"
I'm a simple demo of SDL3 GPU API that clears the window with changing colors, based on SDL's ""test/testgpu_simple_clear.c"".
"
Class {
	#name : 'SDL3GPUClearDemo',
	#superclass : 'SDL3Demo',
	#instVars : [
		'mainLoopProcess',
		'gpuDevice',
		'swapchainTextureHolder',
		'shaderFormats'
	],
	#category : 'SDL3-Tests-Quads',
	#package : 'SDL3-Tests',
	#tag : 'Quads'
}

{ #category : 'lifecycle' }
SDL3GPUClearDemo >> close [

	gpuDevice ifNotNil: [ gpuDevice destroy ].

	super close.

	(mainLoopProcess isNotNil and: [ mainLoopProcess isTerminated not ])
		ifTrue: [ mainLoopProcess terminate ].

	self ensureQuitSDL3
]

{ #category : 'rendering' }
SDL3GPUClearDemo >> doRenderPassesOn: swapchainTexture with: aCommandBuffer [

	| animatedHue colorTargetInfo renderPass |
	
	animatedHue := (Time millisecondClockValue / 10.0) \\ 360.
	
	colorTargetInfo := SDL_GPUColorTargetInfo new.
	colorTargetInfo
		texture: swapchainTexture;
		storeOp: SDL_GPU_STOREOP_STORE;
		loadOp: SDL_GPU_LOADOP_CLEAR.
	colorTargetInfo clearColor updateFrom: (Color h: animatedHue s: 1.0 v: 1.0).

	renderPass :=
		aCommandBuffer
			beginGPURenderPassColorTargetInfos: colorTargetInfo
			numColorTargets: 1
			depthStencilTargetInfo: nil.
	renderPass assertNotNullReturn.

	"HERE: use `SDL3GPURenderPass` to draw"

	renderPass end
]

{ #category : 'initialization' }
SDL3GPUClearDemo >> initialize [

	super initialize.
	initialExtent := 400 @ 300.
	
	"Pre-allocate object to avoid GC pressure in hot path"
	swapchainTextureHolder := (FFIExternalValueHolder ofType: SDL_GPUTexture) new
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

	gpuDevice := sdl
		newGPUDeviceFormatFlags: SDL_GPU_SHADERFORMAT_DXIL | SDL_GPU_SHADERFORMAT_MSL | SDL_GPU_SHADERFORMAT_SPIRV
		debugMode: true name: nil.
	gpuDevice assertNotNullReturn.

	shaderFormats := gpuDevice gpuShaderFormatsAsArray.
	
	"Windows can be created after the GPU device was created (they need to be 'claimed')"
	window :=
		sdl
			newWindowTitle: self className, ' - ESC to quit'
			w: initialExtent x
			h: initialExtent y
			flags: initialWindowFlags.
	window assertNotNullReturn.

	sdl assertSuccess: (gpuDevice claimWindow: window)
]

{ #category : 'rendering' }
SDL3GPUClearDemo >> render [

	| commandBuffer |
	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer assertNotNullReturn.

	sdl assertSuccess:
		(commandBuffer
			 waitAndAcquireGPUSwapchainTextureForWindow: window
			 into: swapchainTextureHolder
			 width: nil
			 height: nil).
	
	"A NULL pointer means we'll skip rendering this time.
	(This happens when the window is minimized, for example.)"
	swapchainTextureHolder value isNull ifTrue: [ ^ commandBuffer cancel ].

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
