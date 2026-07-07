"
I demonstrate how to process textures using compute shaders in SDL3.
I apply a Gaussian blur filter in real-time.
"
Class {
	#name : 'SDL3GPUBlurComputeDemoApp',
	#superclass : 'SDL3GPUDemoApp',
	#instVars : [
		'gpuPipeline',
		'vertexBuffer',
		'sampler',
		'texture',
		'colorTargetInfos',
		'vertexBufferBindings',
		'textureSamplerBindings',
		'indexBuffer',
		'indexBinding',
		'writeTexture',
		'bufferIndex',
		'lastExtent',
		'computePipeline',
		'intermediateTexture',
		'uniforms',
		'storageTextureArray',
		'blurStorageBindings',
		'blurSamplerBindings'
	],
	#category : 'SDL3-GPU-Demos-GaussianBlur',
	#package : 'SDL3-GPU-Demos',
	#tag : 'GaussianBlur'
}

{ #category : 'lifecycle' }
SDL3GPUBlurComputeDemoApp >> close [

	gpuPipeline ifNotNil: [
		gpuPipeline release.
		gpuPipeline := nil ].

	computePipeline ifNotNil: [
		computePipeline release.
		computePipeline := nil ].

	vertexBuffer ifNotNil: [
		vertexBuffer release.
		vertexBuffer := nil ].

	indexBuffer ifNotNil: [
		indexBuffer release.
		indexBuffer := nil ].

	sampler ifNotNil: [
		sampler release.
		sampler := nil ].

	texture ifNotNil: [
		texture release.
		texture := nil ].

	intermediateTexture ifNotNil: [
		intermediateTexture release.
		intermediateTexture := nil ].

	writeTexture ifNotNil: [
		writeTexture release.
		writeTexture := nil ].

	super close
]

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
			pipeline: gpuPipeline;
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

	texture release.
	intermediateTexture release.
	writeTexture release.

	self initializeTexture.
	self initializeComputeResources
]

{ #category : 'initialization' }
SDL3GPUBlurComputeDemoApp >> initialize [

	super initialize.

	bufferIndex := 1.

	colorTargetInfos := FFIArray newType: SDL_GPUColorTargetInfo size: 1.
	colorTargetInfos first
		storeOp: SDL_GPU_STOREOP_STORE;
		loadOp: SDL_GPU_LOADOP_CLEAR.
	colorTargetInfos first clearColor updateFrom: Color red.

	vertexBufferBindings := FFIArray newType: SDL_GPUBufferBinding size: 1.

	textureSamplerBindings := FFIArray newType: SDL_GPUTextureSamplerBinding size: 1.

	indexBinding := SDL_GPUBufferBinding offset: 0.

	blurStorageBindings := SDL3GPUStorageTextureReadWriteBinding safeNewArray: 1.

	blurSamplerBindings := SDL3GPUTextureSamplerBinding safeNewArray: 1.

	uniforms := SDL3GPUBlurUniforms new.
	uniforms
		blurRadius: 0.0;
		blurSpread: 1.0;
		brightness: 1.0.
		
	storageTextureArray := FFIArray newType: SDL_GPUTexture size: 1
]

{ #category : 'initialization' }
SDL3GPUBlurComputeDemoApp >> initializeComputeResources [

	computePipeline := SDL3GPUGaussianBlurShaderSource
		newComputePipelineAmong: gpuDevice gpuShaderFormatsAsArray
		device: gpuDevice.

	writeTexture :=
		gpuDevice
			new2DGPUTextureFormat: SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM
			usage: SDL_GPU_TEXTUREUSAGE_SAMPLER | SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE
			width: lastExtent x
			height: lastExtent y.

	intermediateTexture :=
		gpuDevice
			new2DGPUTextureFormat: SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM
			usage: SDL_GPU_TEXTUREUSAGE_SAMPLER | SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE
			width: lastExtent x
			height: lastExtent y
]

{ #category : 'initialization' }
SDL3GPUBlurComputeDemoApp >> initializeGeometry [
	"Initialize a single full-screen quad"

	vertexBuffer := gpuDevice
		                newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX
		                size: SDL3GPUQuadVertex structureSize * 4.

	indexBuffer := gpuDevice
		               newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_INDEX
		               size: 2 * 6.

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
			fillWith: [ :indices |
				#( 0 1 2 0 2 3 ) doWithIndex: [ :val :idx |
					indices at: idx put: val ] ] ]
]

{ #category : 'initialization' }
SDL3GPUBlurComputeDemoApp >> initializePipeline [

	| vertexShader fragmentShader vertexBindings vertexAttributes colorTargets |

	shaderFormats := gpuDevice gpuShaderFormatsAsArray.

	vertexShader := SDL3GPUQuadVertexShaderSource
				newShaderAmong: shaderFormats
				device: gpuDevice.
	fragmentShader := SDL3GPUQuadFragmentShaderSource
				 newShaderAmong: shaderFormats
				 device: gpuDevice.

	vertexBindings := self newVertexBufferDescriptions.
	vertexAttributes := self newVertexAttributeDescriptions.
	colorTargets := self newColorTargetDescriptions.

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
SDL3GPUBlurComputeDemoApp >> initializeSampler [

	sampler := gpuDevice newSampler: [ :info |
		info minFilter: SDL_GPU_FILTER_LINEAR;
		magFilter: SDL_GPU_FILTER_LINEAR;
		mipmapMode: SDL_GPU_FILTER_LINEAR;
		addressModeU: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE;
		addressModeV: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE;
		addressModeW: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE;
		yourself ].

	textureSamplerBindings first sampler: sampler
]

{ #category : 'initialization' }
SDL3GPUBlurComputeDemoApp >> initializeTexture [

	| browserMorph form |
	lastExtent := window pixelExtent.

	"Take a snapshot of a browser to be used as background"
	browserMorph := (Object >> #at:put:) browse owner.
	form := browserMorph extent: lastExtent; asForm.
	browserMorph delete.

	texture :=
		gpuDevice
			newGPUTextureUploadingForm: form
			usage: SDL_GPU_TEXTUREUSAGE_SAMPLER | SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ
]

{ #category : 'private' }
SDL3GPUBlurComputeDemoApp >> newColorTargetDescriptions [

	| colorTargets |
	colorTargets := SDL_GPUColorTargetDescription safeNewArray: 1.
	colorTargets first
		format: (gpuDevice getGPUSwapchainTextureFormatIntoWindow: window);
		blendState: SDL_GPUColorTargetBlendState new.
	^ colorTargets
]

{ #category : 'private' }
SDL3GPUBlurComputeDemoApp >> newVertexAttributeDescriptions [

	| vertexAttributes |
	vertexAttributes := FFIExternalArray
							externalNewType: SDL_GPUVertexAttribute
							size: 2.
	vertexAttributes first
		bufferSlot: 0;
		format: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT3;
		location: 0;
		offset: 0.
	vertexAttributes second
		bufferSlot: 0;
		format: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT2;
		location: 1;
		offset: 12.
	^ vertexAttributes
]

{ #category : 'private' }
SDL3GPUBlurComputeDemoApp >> newVertexBufferDescriptions [

	| vertexBindings |
	vertexBindings := FFIExternalArray
						 externalNewType: SDL_GPUVertexBufferDescription
						 size: 1.
	vertexBindings first
		slot: 0;
		inputRate: SDL_GPU_VERTEXINPUTRATE_VERTEX;
		instanceStepRate: 0;
		pitch: SDL3GPUQuadVertex structureSize.
	^ vertexBindings
]

{ #category : 'lifecycle' }
SDL3GPUBlurComputeDemoApp >> open [

	super open.

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
