"
I am an abstract superclass for all SDL3 applications that use the low-level GPU API with a single window. 

I manage the GPUDevice lifecycle, coordinate the swapchain texture acquisition, and provide a standardized rendering loop for GPU-driven demos. My subclasses must implement #doRenderPassesOn:with: to define their specific drawing logic.

I am the GPU-centric sibling of SDL3SingleWindowApp (which uses the SDL_Renderer API).
"
Class {
	#name : 'SDL3GPUDemoApp',
	#superclass : 'SDL3SingleWindowApp',
	#instVars : [
		'gpuDevice',
		'swapchainTextureHolder',
		'shaderFormats'
	],
	#category : 'SDL3-GPUDemos-Base',
	#package : 'SDL3-GPUDemos',
	#tag : 'Base'
}

{ #category : 'testing' }
SDL3GPUDemoApp class >> isAbstract [

	^ self == SDL3GPUDemoApp
]

{ #category : 'lifecycle' }
SDL3GPUDemoApp >> close [

	gpuDevice ifNotNil: [
		gpuDevice destroy.
		gpuDevice := nil ].

	super close
]

{ #category : 'rendering' }
SDL3GPUDemoApp >> doRenderPassesOn: swapchainTexture with: aCommandBuffer [
	"Subclasses must override this to perform their GPU drawing commands."

	self subclassResponsibility
]

{ #category : 'accessing' }
SDL3GPUDemoApp >> initialWindowFlags [

	^ SDL_WINDOW_RESIZABLE | SDL_WINDOW_INPUT_FOCUS | SDL_WINDOW_HIGH_PIXEL_DENSITY
]

{ #category : 'initialization' }
SDL3GPUDemoApp >> initialize [

	super initialize.
	
	"Pre-allocate object to avoid GC pressure in hot path"
	swapchainTextureHolder := (FFIExternalValueHolder ofType: SDL_GPUTexture) new
]

{ #category : 'initialization' }
SDL3GPUDemoApp >> newColorTargetDescriptions: aSize [

	| array |
	array := FFIExternalArray
				  externalNewType: SDL_GPUColorTargetDescription
				  size: aSize.
	array autoRelease.
	^ array
]

{ #category : 'lifecycle' }
SDL3GPUDemoApp >> open [

	gpuDevice := SDL_GPUDevice
		unsafeNewFormatFlags: SDL_GPU_SHADERFORMAT_DXIL | SDL_GPU_SHADERFORMAT_MSL | SDL_GPU_SHADERFORMAT_SPIRV
		debugMode: true name: nil.

	shaderFormats := gpuDevice gpuShaderFormatsAsArray.
	
	super open.

	gpuDevice claimWindow: window
]

{ #category : 'rendering' }
SDL3GPUDemoApp >> render [

	| commandBuffer |
	commandBuffer := gpuDevice acquireGPUCommandBuffer.

	"This SDL3 function doesn't block on VSYNC.
	We do use it to avoid blocking Pharo VM."
	commandBuffer
		acquireGPUSwapchainTextureForWindow: window
		into: swapchainTextureHolder
		width: nil height: nil.

	"A NULL pointer is not an error in this case:
	It means too many frames are in flight, or window is minimized, so we'll skip rendering this time."
	[ swapchainTextureHolder value isNull ifFalse: [
		self doRenderPassesOn: swapchainTextureHolder value with: commandBuffer ]
	] ensure: [ commandBuffer submit "Submit even if empty" ]
]

{ #category : 'hooks' }
SDL3GPUDemoApp >> step [

	self render
]
