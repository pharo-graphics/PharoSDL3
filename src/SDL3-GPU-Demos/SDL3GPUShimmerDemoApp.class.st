"
I demonstrate a mock UI with a Shimmer Loading Effect.
"
Class {
	#name : 'SDL3GPUShimmerDemoApp',
	#superclass : 'SDL3GPUDemoApp',
	#instVars : [
		'gpuPipeline',
		'vertexBuffer',
		'instanceBuffer',
		'indexBuffer',
		'vertexBufferBindings',
		'instanceBufferBinding',
		'indexBufferBinding',
		'colorTargetInfos',
		'uniforms',
		'numberOfInstances',
		'effectType'
	],
	#pools : [
		'SDL3AllEnumerations'
	],
	#category : 'SDL3-GPU-Demos-Shimmer',
	#package : 'SDL3-GPU-Demos',
	#tag : 'Shimmer'
}

{ #category : 'lifecycle' }
SDL3GPUShimmerDemoApp >> close [

	gpuPipeline ifNotNil: [
		gpuPipeline release.
		gpuPipeline := nil ].

	vertexBuffer ifNotNil: [
		vertexBuffer release.
		vertexBuffer := nil ].

	instanceBuffer ifNotNil: [
		instanceBuffer release.
		instanceBuffer := nil ].

	indexBuffer ifNotNil: [
		indexBuffer release.
		indexBuffer := nil ].

	super close
]

{ #category : 'rendering' }
SDL3GPUShimmerDemoApp >> doRenderPassesOn: swapchainTexture with: commandBuffer [

	colorTargetInfos first texture: swapchainTextureHolder value.

	commandBuffer renderPassTargets: colorTargetInfos do: [ :renderPass |
		renderPass
			pipeline: gpuPipeline;
			vertexBuffers: vertexBufferBindings slot: 0;
			indexBuffer16Bit: indexBufferBinding.

		"Push Fragment Uniforms (space3 corresponds to Fragment stage per ground truth)"
		commandBuffer
			pushFragmentUniform: uniforms slot: 0;
			pushVertexUniform: uniforms slot: 0.

		"Draw 1 quad (6 indices) per instance"
		renderPass drawIndexedPrimitives: 6 instances: numberOfInstances firstIndex: 0 vertexOffset: 0 firstInstance: 0 ]
]

{ #category : 'initialization' }
SDL3GPUShimmerDemoApp >> initialize [

	super initialize.

	effectType := 0.

	vertexBufferBindings := FFIArray newType: SDL_GPUBufferBinding size: 2.

	instanceBufferBinding := SDL_GPUBufferBinding safeNewArray: 1.

	colorTargetInfos := SDL_GPUColorTargetInfo safeNewArray: 1.
	colorTargetInfos first
		beClear: (Color r: 0.05 g: 0.05 b: 0.1). "Dark background"

	uniforms := SDL3GPUShimmerUniforms safeNew.
	uniforms
		effectType: effectType;
		time: 0.0;
		cornerRadius: 0.0; "Overridden by instance data"
		baseColor: (SDL3FColor r: 0.2 g: 0.2 b: 0.25 a: 1.0);
		highlightColor: (SDL3FColor r: 0.3 g: 0.3 b: 0.35 a: 1.0)
]

{ #category : 'initialization' }
SDL3GPUShimmerDemoApp >> initializeGeometry [

	| instances |
	instances := self mockUIPanels.
	numberOfInstances := instances size.
	self uploadGeometry: instances
]

{ #category : 'initialization' }
SDL3GPUShimmerDemoApp >> initializePipeline [

	| vertexShader fragmentShader shaderFormats vertexAttributes vertexBindings colorTargets |

	shaderFormats := gpuDevice gpuShaderFormatsAsArray.

	vertexShader := SDL3GPUShimmerVertexShaderSource newShaderAmong: shaderFormats device: gpuDevice.
	fragmentShader := SDL3GPUShimmerFragmentShaderSource newShaderAmong: shaderFormats device: gpuDevice.

	vertexBindings := SDL_GPUVertexBufferDescription safeNewArray: 2.

	"Binding 0: Quad vertices (per vertex)"
	vertexBindings first
		slot: 0;
		pitch: SDL3GPUQuadVertex structureSize;
		inputRate: SDL_GPU_VERTEXINPUTRATE_VERTEX;
		instanceStepRate: 0.

	"Binding 1: Instance Data (per instance)"
	vertexBindings second
		slot: 1;
		pitch: SDL3GPUShimmerInstance structureSize;
		inputRate: SDL_GPU_VERTEXINPUTRATE_INSTANCE;
		instanceStepRate: 0.

	vertexAttributes := SDL_GPUVertexAttribute safeNewArray: 4.

	"Quad Position (Attribute 0)"
	vertexAttributes first
		bufferSlot: 0;
		format: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT3;
		location: 0;
		offset: 0.

	"Quad TexCoord (Attribute 1)"
	vertexAttributes second
		bufferSlot: 0;
		format: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT2;
		location: 1;
		offset: 3 * FFIFloat32 externalTypeSize.

	"Instance Bounds (Attribute 2)"
	vertexAttributes third
		bufferSlot: 1;
		format: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT4;
		location: 2;
		offset: 0.

	"Instance Extra/Radius (Attribute 3)"
	vertexAttributes fourth
		bufferSlot: 1;
		format: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT4;
		location: 3;
		offset: 16.

	colorTargets := SDL_GPUColorTargetDescription safeNewArray: 1.
	colorTargets first
		format: (gpuDevice getGPUSwapchainTextureFormatIntoWindow: window);
		blendState: SDL_GPUColorTargetBlendState newAlphaBlend.

	gpuPipeline := gpuDevice newGraphicsPipeline: [ :info |
		info
			vertex: vertexShader
			fragment: fragmentShader
			targets: colorTargets.
		info vertexInputState
			attributes: vertexAttributes
			bindings: vertexBindings ].

	vertexShader release.
	fragmentShader release
]

{ #category : 'initialization' }
SDL3GPUShimmerDemoApp >> initializeQuadBuffers: instances [

	vertexBuffer := gpuDevice
		                newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX
		                size: 4 * SDL3GPUQuadVertex structureSize.

	indexBuffer := gpuDevice
		               newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_INDEX
		               size: 6 * 2.

	instanceBuffer := gpuDevice
		                  newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX
		                  size: instances size * SDL3GPUShimmerInstance structureSize.

	gpuDevice uploadToGPUDo: [ :uploader |
		uploader
			uploadTo: vertexBuffer
			type: SDL3GPUQuadVertex
			count: 4
			cycle: false
			fillWith: [ :vertices |
				vertices first
					x: 0.0;
					y: 0.0;
					z: 0.0;
					u: 0.0;
					v: 0.0.
				vertices second
					x: 1.0;
					y: 0.0;
					z: 0.0;
					u: 1.0;
					v: 0.0.
				vertices third
					x: 1.0;
					y: 1.0;
					z: 0.0;
					u: 1.0;
					v: 1.0.
				vertices fourth
					x: 0.0;
					y: 1.0;
					z: 0.0;
					u: 0.0;
					v: 1.0 ].

		uploader
			uploadTo: indexBuffer
			type: FFIUInt16
			count: 6
			cycle: false
			fillWith: [ :indices |
				indices
					at: 1 put: 0;
					at: 2 put: 1;
					at: 3 put: 2;
					at: 4 put: 0;
					at: 5 put: 2;
					at: 6 put: 3 ].

		uploader
			uploadTo: instanceBuffer
			type: SDL3GPUShimmerInstance
			count: instances size
			cycle: false
			fillWith: [ :mappedInstances |
				instances withIndexDo: [ :inst :idx |
					(mappedInstances at: idx)
						x: inst x;
						y: inst y;
						w: inst w;
						h: inst h;
						radius: inst radius ] ] ]
]

{ #category : 'initialization' }
SDL3GPUShimmerDemoApp >> mockUIPanels [
	"Create a social network feed loading state."
	| panels |
	panels := OrderedCollection new.

	"Post 1"
	"Avatar (Circle)"
	panels add: (SDL3GPUShimmerInstance new x: 40/1280.0; y: 40/720.0; w: 60/1280.0; h: 60/720.0; radius: 30.0).
	"Name & Info"
	panels add: (SDL3GPUShimmerInstance new x: 120/1280.0; y: 45/720.0; w: 300/1280.0; h: 20/720.0; radius: 8.0).
	panels add: (SDL3GPUShimmerInstance new x: 120/1280.0; y: 75/720.0; w: 200/1280.0; h: 15/720.0; radius: 8.0).
	"Main Content"
	panels add: (SDL3GPUShimmerInstance new x: 40/1280.0; y: 120/720.0; w: 1200/1280.0; h: 400/720.0; radius: 16.0).
	"Actions"
	panels add: (SDL3GPUShimmerInstance new x: 40/1280.0; y: 540/720.0; w: 80/1280.0; h: 30/720.0; radius: 10.0).
	panels add: (SDL3GPUShimmerInstance new x: 140/1280.0; y: 540/720.0; w: 80/1280.0; h: 30/720.0; radius: 10.0).
	panels add: (SDL3GPUShimmerInstance new x: 240/1280.0; y: 540/720.0; w: 80/1280.0; h: 30/720.0; radius: 10.0).

	^ panels
]

{ #category : 'lifecycle' }
SDL3GPUShimmerDemoApp >> open [

	super open.
	self initializeGeometry.
	self initializePipeline
]

{ #category : 'initialization' }
SDL3GPUShimmerDemoApp >> setupGeometryBindings [

	vertexBufferBindings first
		buffer: vertexBuffer;
		offset: 0.
	vertexBufferBindings second
		buffer: instanceBuffer;
		offset: 0.

	indexBufferBinding := SDL_GPUBufferBinding
		                      buffer: indexBuffer
		                      offset: 0
]

{ #category : 'hooks' }
SDL3GPUShimmerDemoApp >> step [

	uniforms
		time: Time millisecondClockValue / 1000.0;
		resolutionX: (window extent x max: 1) asFloat;
		resolutionY: (window extent y max: 1) asFloat.

	self render
]

{ #category : 'accessing' }
SDL3GPUShimmerDemoApp >> updatedTitle [

	| effectName |
	effectType = 0 ifTrue: [ effectName := 'Linear Sweep' ].
	effectType = 1 ifTrue: [ effectName := 'Pulsate' ].
	effectType = 2 ifTrue: [ effectName := 'Angled Sweep' ].

	^ super updatedTitle, (' - Effect: {1} (LEFT/RIGHT to change)' format: { effectName })
]

{ #category : 'initialization' }
SDL3GPUShimmerDemoApp >> uploadGeometry: instances [
	"Upload quad vertices, indices, and instance data (panels)."

	self
		initializeQuadBuffers: instances;
		setupGeometryBindings
]

{ #category : 'hooks' }
SDL3GPUShimmerDemoApp >> visitKeyboardDownEvent: aKeyboardDownEvent [

	super visitKeyboardDownEvent: aKeyboardDownEvent.

	aKeyboardDownEvent key = SDLK_RIGHT asInteger ifTrue: [
		effectType := (effectType + 1) \\ 3.
		uniforms effectType: effectType ].
	aKeyboardDownEvent key = SDLK_LEFT asInteger ifTrue: [
		effectType := effectType - 1.
		effectType < 0 ifTrue: [ effectType := 2 ].
		uniforms effectType: effectType ].

	self updateTitle
]
