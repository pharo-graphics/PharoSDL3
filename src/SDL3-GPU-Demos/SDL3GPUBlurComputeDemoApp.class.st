"
I demonstrate how to process textures using compute shaders in SDL3.
I apply a Gaussian blur filter in real-time.
"
Class {
	#name : 'SDL3GPUBlurComputeDemoApp',
	#superclass : 'SDL3GPUDemoApp',
	#instVars : [
		'bufferIndex',
		'lastExtent',
		'uniforms',
		'pipeline',
		'computePipeline',
		'vertexBuffer',
		'indexBuffer',
		'sampler',
		'texture',
		'intermediateTexture',
		'writeTexture',
		'colorTargetInfos',
		'indexBinding',
		'blurStorageBindings',
		'blurSamplerBindings',
		'vertexBufferBindings',
		'textureSamplerBindings',
		'storageTextureArray'
	],
	#category : 'SDL3-GPU-Demos-GaussianBlur',
	#package : 'SDL3-GPU-Demos',
	#tag : 'GaussianBlur'
}

{ #category : 'rendering' }
SDL3GPUBlurComputeDemoApp >> doRenderPassesOn: swapchainTexture with: commandBuffer [

	"Pass 1: Horizontal Blur (Force brightness to 1.0)"
	self
		executeBlurPassWith: commandBuffer
		direction: 0
		inputTexture: texture
		outputTexture: intermediateTexture
		brightness: 1.0.

	"Pass 2: Vertical Blur (Use current state brightness)"
	self
		executeBlurPassWith: commandBuffer
		direction: 1
		inputTexture: intermediateTexture
		outputTexture: writeTexture
		brightness: uniforms brightness.

	self executeFinalRenderPassOn: swapchainTexture with: commandBuffer
]

{ #category : 'private' }
SDL3GPUBlurComputeDemoApp >> executeBlurPassWith: commandBuffer direction: direction inputTexture: inputTexture outputTexture: outputTexture brightness: passBrightness [

	uniforms
		direction: direction;
		brightness: passBrightness.
		
	commandBuffer
		pushComputeUniform: uniforms slot: 0.

	storageTextureArray at: 1 put: outputTexture.

	blurStorageBindings first
		texture: outputTexture;
		cycle: true.

	blurSamplerBindings first
		texture: inputTexture;
		sampler: sampler.

	commandBuffer computePassTextures: blurStorageBindings computeStorageBuffers: #() do: [ :computePass |
		computePass
			pipeline: computePipeline;
			computeStorageTextures: storageTextureArray slot: 0;
			computeSamplers: blurSamplerBindings slot: 0;
			dispatchX: lastExtent x
			y: lastExtent y
			z: 1 ]
]

{ #category : 'private' }
SDL3GPUBlurComputeDemoApp >> executeFinalRenderPassOn: swapchainTexture with: commandBuffer [

	colorTargetInfos first texture: swapchainTexture.
	textureSamplerBindings first
		texture: writeTexture;
		sampler: sampler.

	commandBuffer renderPassTargets: colorTargetInfos do: [ :renderPass |
		vertexBufferBindings first buffer: vertexBuffer.
		indexBinding buffer: indexBuffer.

		renderPass
			pipeline: pipeline;
			vertexBuffers: vertexBufferBindings slot: 0;
			indexBuffer16Bit: indexBinding;
			fragmentSamplers: textureSamplerBindings slot: 0;
			drawIndexedPrimitives: 6
			instances: 1
			firstIndex: 0
			vertexOffset: 0
			firstInstance: 0 ]
]

{ #category : 'initialization' }
SDL3GPUBlurComputeDemoApp >> handleResize [
	"Recreate textures and pipelines based on the new window extent"

	self initializeTexture.
	self initializeComputeResources
]

{ #category : 'initialization' }
SDL3GPUBlurComputeDemoApp >> initialize [

	super initialize.

	bufferIndex := 1.

	uniforms := SDL3GPUBlurUniforms new.
	uniforms
		blurRadius: 0.0;
		blurSpread: 1.0;
		brightness: 1.0
]

{ #category : 'initialization' }
SDL3GPUBlurComputeDemoApp >> initializeComputeResources [

	computePipeline ifNotNil: [ computePipeline dispose ].
	writeTexture ifNotNil: [ writeTexture dispose ].
	intermediateTexture ifNotNil: [ intermediateTexture dispose ].

	computePipeline := SDL3GPUGaussianBlurShaderSource unownedNewComputePipelineForDevice: gpuDevice.
	DiScope own: computePipeline.

	writeTexture := gpuDevice
		unownedNew2DGPUTextureFormat: SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM
		usage: SDL_GPU_TEXTUREUSAGE_SAMPLER | SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE
		width: lastExtent x
		height: lastExtent y.
	DiScope own: writeTexture.

	intermediateTexture := gpuDevice
		unownedNew2DGPUTextureFormat: SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM
		usage: SDL_GPU_TEXTUREUSAGE_SAMPLER | SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE
		width: lastExtent x
		height: lastExtent y.
	DiScope own: intermediateTexture
]

{ #category : 'initialization' }
SDL3GPUBlurComputeDemoApp >> initializeGeometry [
	"Initialize a single full-screen quad"

	vertexBuffer := gpuDevice unownedNewGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX size: SDL3GPUQuadVertex structureSize * 4.
	DiScope own: vertexBuffer.

	indexBuffer := gpuDevice unownedNewGPUBufferUsage: SDL_GPU_BUFFERUSAGE_INDEX size: 2 * 6.
	DiScope own: indexBuffer.

	gpuDevice uploadToGPUDo: [ :uploader |
		uploader
			uploadTo: vertexBuffer
			type: SDL3GPUQuadVertex
			count: 4
			cycle: false
			fillWith: [ :vertices |
				vertices first
					x: -1.0;
					y: 1.0;
					z: 0.0;
					u: 0.0;
					v: 0.0.
				vertices second
					x: 1.0;
					y: 1.0;
					z: 0.0;
					u: 1.0;
					v: 0.0.
				vertices third
					x: 1.0;
					y: -1.0;
					z: 0.0;
					u: 1.0;
					v: 1.0.
				vertices fourth
					x: -1.0;
					y: -1.0;
					z: 0.0;
					u: 0.0;
					v: 1.0 ].

		uploader
			uploadTo: indexBuffer
			type: FFIUInt16
			count: 6
			cycle: false
			fillWith: [ :indices | #( 0 1 2 0 2 3 ) doWithIndex: [ :val :idx | indices at: idx put: val ] ] ]
]

{ #category : 'initialization' }
SDL3GPUBlurComputeDemoApp >> initializePipeline [

	pipeline := gpuDevice newGraphicsPipelineBuilder
		vertexShader: SDL3GPUQuadVertexShaderSource;
		fragmentShader: SDL3GPUQuadFragmentShaderSource;
		addVertexBufferFor: SDL3GPUQuadVertex;
		targetWindow: window;
		enableAlphaBlending;
		unownedNewPipeline.
	DiScope own: pipeline
]

{ #category : 'initialization' }
SDL3GPUBlurComputeDemoApp >> initializeSampler [

	DiScope own: (sampler := gpuDevice unownedNewGPUSampler: [ :info |
		info minFilter: SDL_GPU_FILTER_LINEAR;
		magFilter: SDL_GPU_FILTER_LINEAR;
		mipmapMode: SDL_GPU_FILTER_LINEAR;
		addressModeU: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE;
		addressModeV: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE;
		addressModeW: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE;
		yourself ]).

	textureSamplerBindings first sampler: sampler
]

{ #category : 'initialization' }
SDL3GPUBlurComputeDemoApp >> initializeTexture [

	| browserMorph form |
	lastExtent := window pixelExtent.

	texture ifNotNil: [ texture dispose ].

	"Take a snapshot of a browser to be used as background"
	browserMorph := (Object >> #at:put:) browse owner.
	form := browserMorph
		extent: lastExtent;
		asForm.
	browserMorph delete.
	DiScope own: (texture := gpuDevice
		unownedNewGPUTextureUploadingForm: form
		usage: SDL_GPU_TEXTUREUSAGE_SAMPLER | SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ)
]

{ #category : 'lifecycle' }
SDL3GPUBlurComputeDemoApp >> setUp [

	super setUp.
	DiScope own: (colorTargetInfos := SDL3Array unownedNewType: SDL_GPUColorTargetInfo size: 1).
	colorTargetInfos first
		storeOp: SDL_GPU_STOREOP_STORE;
		loadOp: SDL_GPU_LOADOP_CLEAR.
	colorTargetInfos first clearColor updateFrom: Color red.
	DiScope own: (indexBinding := SDL_GPUBufferBinding unownedNew
		beOffset: 0;
		yourself).
	DiScope own: (blurStorageBindings := SDL3Array unownedNewType: SDL3GPUStorageTextureReadWriteBinding size: 1).
	DiScope own: (blurSamplerBindings := SDL3Array unownedNewType: SDL3GPUTextureSamplerBinding size: 1).
	DiScope own: (vertexBufferBindings := SDL3Array unownedNewType: SDL_GPUBufferBinding size: 1).
	DiScope own: (textureSamplerBindings := SDL3Array unownedNewType: SDL_GPUTextureSamplerBinding size: 1).
	DiScope own: (storageTextureArray := SDL3Array unownedNewType: SDL_GPUTexture size: 1).

	self initializeTexture.
	self initializeComputeResources.
	self initializeGeometry.
	self initializePipeline.
	self initializeSampler
]

{ #category : 'accessing' }
SDL3GPUBlurComputeDemoApp >> updatedTitle [

	^ super updatedTitle,
		(' - Radius: {1} (UP/DOWN) - Spread: {2} (LEFT/RIGHT) - Brightness: {3} (W/S)'
			format: {
				uniforms blurRadius printShowingDecimalPlaces: 1.
				uniforms blurSpread printShowingDecimalPlaces: 1.
				uniforms brightness printShowingDecimalPlaces: 1 })
]

{ #category : 'hooks' }
SDL3GPUBlurComputeDemoApp >> visitKeyboardDownEvent: aKeyboardDownEvent [

	super visitKeyboardDownEvent: aKeyboardDownEvent.

	aKeyboardDownEvent key = SDLK_UP asInteger ifTrue: [
		uniforms blurRadius: (uniforms blurRadius + 0.5 min: 10.0) ].
	aKeyboardDownEvent key = SDLK_DOWN asInteger ifTrue: [
		uniforms blurRadius: (uniforms blurRadius - 0.5 max: 0.0) ].
	aKeyboardDownEvent key = SDLK_LEFT asInteger ifTrue: [
		uniforms blurSpread: (uniforms blurSpread - 0.5 max: 1.0) ].
	aKeyboardDownEvent key = SDLK_RIGHT asInteger ifTrue: [
		uniforms blurSpread: (uniforms blurSpread + 0.5 min: 4.0) ].
	aKeyboardDownEvent key = SDLK_W asInteger ifTrue: [
		uniforms brightness: (uniforms brightness + 0.1 min: 2.0) ].
	aKeyboardDownEvent key = SDLK_S asInteger ifTrue: [
		uniforms brightness: (uniforms brightness - 0.1 max: 0.0) ].

	self updateTitle
]

{ #category : 'visiting - concrete' }
SDL3GPUBlurComputeDemoApp >> visitWindowPixelSizeChangedEvent: aWindowPixelSizeChangedEvent [

	super visitWindowPixelSizeChangedEvent: aWindowPixelSizeChangedEvent.

	aWindowPixelSizeChangedEvent extent = lastExtent ifFalse: [ self handleResize ]
]
