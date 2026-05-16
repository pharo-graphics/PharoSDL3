"
I demonstrate how to process textures using compute shaders in SDL3.
I apply a Gaussian blur filter in real-time.
"
Class {
	#name : 'SDL3GPUComputeDemo',
	#superclass : 'SDL3GPUClearDemo',
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
		'blurRadius',
		'blurSpread',
		'brightness',
		'bufferIndex',
		'vertexTransferBuffer',
		'lastExtent',
		'filterGraph',
		'hBlurFilter',
		'vBlurFilter',
		'colorFilter',
		'colorMode',
		'computePipeline',
		'intermediateTexture',
		'uniforms',
		'storageTextureArray'
	],
	#category : 'SDL3-Tests-Quads',
	#package : 'SDL3-Tests',
	#tag : 'Quads'
}

{ #category : 'lifecycle' }
SDL3GPUComputeDemo >> close [

	gpuPipeline ifNotNil: [ 
		gpuDevice releaseGPUGraphicsPipeline: gpuPipeline.
		gpuPipeline := nil ].

	computePipeline ifNotNil: [ 
		gpuDevice releaseGPUComputePipeline: computePipeline.
		computePipeline := nil ].

	vertexBuffer ifNotNil: [ 
		gpuDevice releaseGPUBuffer: vertexBuffer.
		vertexBuffer := nil ].

	vertexTransferBuffer ifNotNil: [
		gpuDevice releaseGPUTransferBuffer: vertexTransferBuffer.
		vertexTransferBuffer := nil ].

	indexBuffer ifNotNil: [ 
		gpuDevice releaseGPUBuffer: indexBuffer.
		indexBuffer := nil ].

	sampler ifNotNil: [ 
		gpuDevice releaseGPUSampler: sampler.
		sampler := nil ].

	texture ifNotNil: [ 
		gpuDevice releaseGPUTexture: texture.
		texture := nil ].

	intermediateTexture ifNotNil: [ 
		gpuDevice releaseGPUTexture: intermediateTexture.
		intermediateTexture := nil ].

	writeTexture ifNotNil: [ 
		gpuDevice releaseGPUTexture: writeTexture.
		writeTexture := nil ].

	super close
]

{ #category : 'rendering' }
SDL3GPUComputeDemo >> doRenderPassesOn: swapchainTexture with: aSDL3GPUCommandBuffer [

	| renderPass |

	"1. Horizontal Pass"
	uniforms blurRadius: blurRadius; blurSpread: blurSpread; direction: 0; brightness: 1.0.
	aSDL3GPUCommandBuffer 
		pushGPUComputeUniformDataSlotIndex: 0 
		data: uniforms 
		length: SDL3GPUBlurUniforms structureSize.

	storageTextureArray at: 1 put: intermediateTexture.

	(aSDL3GPUCommandBuffer 
		beginGPUComputePassStorageTextureBindings: (SDL_GPUStorageTextureReadWriteBinding new
			texture: intermediateTexture;
			cycle: true;
			yourself)
		numStorageTextureBindings: 1
		storageBufferBindings: nil
		numStorageBufferBindings: 0)
			bindGPUComputePipeline: computePipeline;
			bindGPUComputeStorageTexturesFirstSlot: 0 storageTextures: storageTextureArray numBindings: 1;
			bindGPUComputeSamplersFirstSlot: 0 
				textureSamplerBindings: (SDL_GPUTextureSamplerBinding new
					texture: texture;
					sampler: sampler;
					yourself)
				numBindings: 1;
			dispatchWorkgroupCountX: (lastExtent x + 7) // 8 y: (lastExtent y + 7) // 8 z: 1;
			end.

	"2. Vertical Pass"
	uniforms direction: 1; brightness: brightness.
	aSDL3GPUCommandBuffer 
		pushGPUComputeUniformDataSlotIndex: 0 
		data: uniforms 
		length: SDL3GPUBlurUniforms structureSize.

	storageTextureArray at: 1 put: writeTexture.

	(aSDL3GPUCommandBuffer 
		beginGPUComputePassStorageTextureBindings: (SDL_GPUStorageTextureReadWriteBinding new
			texture: writeTexture;
			cycle: true;
			yourself)
		numStorageTextureBindings: 1
		storageBufferBindings: nil
		numStorageBufferBindings: 0)
			bindGPUComputePipeline: computePipeline;
			bindGPUComputeStorageTexturesFirstSlot: 0 storageTextures: storageTextureArray numBindings: 1;
			bindGPUComputeSamplersFirstSlot: 0 
				textureSamplerBindings: (SDL_GPUTextureSamplerBinding new
					texture: intermediateTexture;
					sampler: sampler;
					yourself)
				numBindings: 1;
			dispatchWorkgroupCountX: (lastExtent x + 7) // 8 y: (lastExtent y + 7) // 8 z: 1;
			end.

	"3. Render Pass"
	colorTargetInfos first texture: swapchainTexture.

	renderPass :=
		aSDL3GPUCommandBuffer
			beginGPURenderPassColorTargetInfos: colorTargetInfos
			numColorTargets: colorTargetInfos size
			depthStencilTargetInfo: nil.
	renderPass assertNotNullReturn.

	renderPass bindGPUGraphicsPipeline: gpuPipeline.
	
	vertexBufferBindings first buffer: vertexBuffer.
	renderPass
		bindGPUVertexBuffersFirstSlot: 0
		bindings: vertexBufferBindings
		numBindings: vertexBufferBindings size.

	indexBinding buffer: indexBuffer.
	renderPass
		bindGPUIndexBufferBinding: indexBinding
		indexElementSize: SDL_GPU_INDEXELEMENTSIZE_16BIT.
	
	textureSamplerBindings first texture: writeTexture.
	renderPass
		bindGPUFragmentSamplersFirstSlot: 0
		textureSamplerBindings: textureSamplerBindings
		numBindings: textureSamplerBindings size.

	renderPass
		drawGPUIndexedPrimitivesNumIndices: 6
		numInstances: 1
		firstIndex: 0
		vertexOffset: 0
		firstInstance: 0.

	renderPass end
]

{ #category : 'initialization' }
SDL3GPUComputeDemo >> handleResize [
	"Recreate textures and pipelines based on the new window extent"

	gpuDevice releaseGPUTexture: texture.
	gpuDevice releaseGPUTexture: intermediateTexture.
	gpuDevice releaseGPUTexture: writeTexture.
	
	self initializeTexture.
	self initializeComputeResources
]

{ #category : 'initialization' }
SDL3GPUComputeDemo >> initialize [

	super initialize.

	initialExtent := 1280 @ 720.
	initialWindowFlags := SDL3WindowFlags resizable | SDL3WindowFlags inputFocus | SDL3WindowFlags highPixelDensity.

	blurRadius := 0.0.
	blurSpread := 1.0.
	brightness := 1.0.
	bufferIndex := 1.

	colorTargetInfos := FFIExternalArray externalNewType: SDL_GPUColorTargetInfo size: 1.
	colorTargetInfos autoRelease.
	colorTargetInfos first
		storeOp: SDL_GPU_STOREOP_STORE;
		loadOp: SDL_GPU_LOADOP_CLEAR.
	colorTargetInfos first clearColor updateFrom: Color red.

	vertexBufferBindings := FFIExternalArray externalNewType: SDL_GPUBufferBinding size: 1.
	vertexBufferBindings autoRelease.

	textureSamplerBindings := FFIExternalArray externalNewType: SDL_GPUTextureSamplerBinding size: 1.
	textureSamplerBindings autoRelease.

	indexBinding := SDL_GPUBufferBinding externalNew.
	indexBinding autoRelease.
	indexBinding offset: 0.
	
	uniforms := SDL3GPUBlurUniforms new.
	storageTextureArray := FFIExternalArray externalNewType: SDL_GPUTexture size: 1.
	storageTextureArray autoRelease
]

{ #category : 'initialization' }
SDL3GPUComputeDemo >> initializeComputeResources [

	computePipeline := SDL3GPUGaussianBlurShaderSource
		newComputePipelineAmong: gpuDevice gpuShaderFormatsAsArray
		device: gpuDevice.
	computePipeline assertNotNullReturn.

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
SDL3GPUComputeDemo >> initializeGeometry [
	"Initialize a single full-screen quad"

	| indices iTransfer mappedAddress |

	"1. Vertex Buffer"
	vertexTransferBuffer :=
		gpuDevice newUploadTransferBuffer: SDL3GPUQuadVertex structureSize * 4.

	vertexBuffer := gpuDevice
		newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX
		size: SDL3GPUQuadVertex structureSize * 4.

	"2. Index Buffer"
	iTransfer := gpuDevice newUploadTransferBuffer: 2 * 6. "16-bit indices"
	iTransfer assertNotNullReturn.
	mappedAddress := gpuDevice mapGPUTransferBuffer: iTransfer cycle: false.
	indices := FFIArray fromHandle: mappedAddress type: FFIUInt16 size: 6.
	#(1 2 3 1 3 4) doWithIndex: [ :val :idx | indices at: idx put: val - 1 ].
	gpuDevice unmapGPUTransferBuffer: iTransfer.

	indexBuffer := gpuDevice
		newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_INDEX
		size: 2 * 6.

	"3. Static Geometry Upload"
	gpuDevice acquireGPUCommandBuffer in: [ :commandBuffer |
		| copyPass |
		commandBuffer assertNotNullReturn.
		mappedAddress := gpuDevice mapGPUTransferBuffer: vertexTransferBuffer cycle: false.
		
		(FFIArray fromHandle: mappedAddress type: SDL3GPUQuadVertex size: 4)
			at: 1 put: (SDL3GPUQuadVertex new x: -1.0; y: 1.0; z: 0.0; u: 0.0; v: 0.0; yourself);
			at: 2 put: (SDL3GPUQuadVertex new x: 1.0; y: 1.0; z: 0.0; u: 1.0; v: 0.0; yourself);
			at: 3 put: (SDL3GPUQuadVertex new x: 1.0; y: -1.0; z: 0.0; u: 1.0; v: 1.0; yourself);
			at: 4 put: (SDL3GPUQuadVertex new x: -1.0; y: -1.0; z: 0.0; u: 0.0; v: 1.0; yourself).
		gpuDevice unmapGPUTransferBuffer: vertexTransferBuffer.
		
		copyPass := commandBuffer beginGPUCopyPass.
		copyPass uploadToGPUBufferSource: (SDL_GPUTransferBufferLocation new transferBuffer: vertexTransferBuffer; offset: 0; yourself)
			destination: (SDL_GPUBufferRegion new buffer: vertexBuffer; offset: 0; size: SDL3GPUQuadVertex structureSize * 4; yourself) cycle: false.
		copyPass uploadToGPUBufferSource: (SDL_GPUTransferBufferLocation new transferBuffer: iTransfer; offset: 0; yourself)
			destination: (SDL_GPUBufferRegion new buffer: indexBuffer; offset: 0; size: 2 * 6; yourself) cycle: false.
		copyPass end.
		commandBuffer submit ].

	gpuDevice releaseGPUTransferBuffer: iTransfer
]

{ #category : 'initialization' }
SDL3GPUComputeDemo >> initializePipeline [

	| vertexShader fragmentShader vertexBindings vertexAttributes colorTargets pipelineCreateInfo |
	vertexShader :=
		SDL3GPUQuadVertexShaderSource
			newShaderAmong: shaderFormats
			device: gpuDevice.
	fragmentShader :=
		SDL3GPUQuadFragmentShaderSource
			newShaderAmong: shaderFormats
			device: gpuDevice.

	vertexBindings :=
		FFIExternalArray externalNewType: SDL_GPUVertexBufferDescription size: 1.
	vertexBindings first
		slot: 0;
		inputRate: SDL_GPU_VERTEXINPUTRATE_VERTEX;
		instanceStepRate: 0;
		pitch: SDL3GPUQuadVertex structureSize.

	vertexAttributes :=
		FFIExternalArray externalNewType: SDL_GPUVertexAttribute size: 2.
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

	colorTargets :=
		FFIExternalArray externalNewType: SDL_GPUColorTargetDescription size: 1.
	colorTargets first format: (gpuDevice getGPUSwapchainTextureFormatIntoWindow: window).

	pipelineCreateInfo := SDL_GPUGraphicsPipelineCreateInfo new.
	pipelineCreateInfo
		primitiveType: SDL_GPU_PRIMITIVETYPE_TRIANGLELIST;
		vertexShader: vertexShader;
		fragmentShader: fragmentShader.
	pipelineCreateInfo targetInfo
		colorTargetDescriptions: colorTargets;
		numColorTargets: colorTargets size.
	pipelineCreateInfo vertexInputState
		vertexBufferDescriptions: vertexBindings;
		numVertexBuffers: vertexBindings size;
		vertexAttributes: vertexAttributes;
		numVertexAttributes: vertexAttributes size.

	gpuPipeline := gpuDevice newGPUGraphicsPipelineCreateinfo: pipelineCreateInfo.
	gpuPipeline assertNotNullReturn.

	gpuDevice releaseGPUShader: vertexShader.
	gpuDevice releaseGPUShader: fragmentShader.	
	vertexBindings free.
	vertexAttributes free.
	colorTargets free
]

{ #category : 'initialization' }
SDL3GPUComputeDemo >> initializeSampler [

	sampler := gpuDevice newGPUSamplerCreateinfo: (SDL3GPUSamplerCreateInfo new
		minFilter: SDL_GPU_FILTER_LINEAR;
		magFilter: SDL_GPU_FILTER_LINEAR;
		mipmapMode: SDL_GPU_FILTER_LINEAR;
		addressModeU: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE;
		addressModeV: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE;
		addressModeW: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE;
		yourself).
	sampler assertNotNullReturn.
	
	textureSamplerBindings first sampler: sampler
]

{ #category : 'initialization' }
SDL3GPUComputeDemo >> initializeTexture [

	| morph |
	lastExtent := window pixelExtent.

	morph := (Object >> #at:put:) browse owner.
	morph extent: lastExtent.

	texture :=
		gpuDevice
			newGPUTextureUploadingForm: morph asForm
			usage: SDL_GPU_TEXTUREUSAGE_SAMPLER | SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ
]

{ #category : 'running' }
SDL3GPUComputeDemo >> iterateUntilQuit [

	| quit |
	quit := false.

	[ quit ] whileFalse: [
		self pollEventsDo: [ :evt |
			evt type = SDL_EVENT_QUIT ifTrue: [ quit := true ].

			evt type = SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED ifTrue: [
				evt extent = lastExtent ifFalse: [ self handleResize ] ].

			evt type = SDL_EVENT_KEY_DOWN ifTrue: [
				evt key = SDLK_ESCAPE asInteger ifTrue: [ quit := true ].
				evt key = SDLK_UP asInteger ifTrue: [
					blurRadius := (blurRadius + 0.5) min: 10.0.
					self updateTitle ].
				evt key = SDLK_DOWN asInteger ifTrue: [
					blurRadius := (blurRadius - 0.5) max: 0.0.
					self updateTitle ].
				evt key = SDLK_LEFT asInteger ifTrue: [
					blurSpread := (blurSpread - 0.5) max: 1.0.
					self updateTitle ].
				evt key = SDLK_RIGHT asInteger ifTrue: [
					blurSpread := (blurSpread + 0.5) min: 4.0.
					self updateTitle ].
				evt key = SDLK_W asInteger ifTrue: [
					brightness := (brightness + 0.1) min: 2.0.
					self updateTitle ].
				evt key = SDLK_S asInteger ifTrue: [
					brightness := (brightness - 0.1) max: 0.0.
					self updateTitle ]
			] ].

		self render.
		16.6 milliSeconds wait ]
]

{ #category : 'lifecycle' }
SDL3GPUComputeDemo >> open [

	super open.

	self updateTitle.

	self initializeTexture.
	self initializeComputeResources.
	self initializeGeometry.
	self initializePipeline.
	self initializeSampler
]

{ #category : 'actions' }
SDL3GPUComputeDemo >> updateTitle [

	window title: ('Compute Blur - Radius: {1} (UP/DOWN) - Spread: {2} (LEFT/RIGHT) - Brightness: {3} (W/S) - ESC to quit'
		format: {
		blurRadius printShowingDecimalPlaces: 1.
		blurSpread printShowingDecimalPlaces: 1.
		brightness printShowingDecimalPlaces: 1 })
]
