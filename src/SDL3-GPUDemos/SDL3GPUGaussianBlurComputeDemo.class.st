"
I demonstrate how to process textures using compute shaders in SDL3.
I apply a Gaussian blur filter in real-time.
"
Class {
	#name : 'SDL3GPUGaussianBlurComputeDemo',
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
		'blurRadius',
		'blurSpread',
		'brightness',
		'bufferIndex',
		'vertexTransferBuffer',
		'lastExtent',
		'computePipeline',
		'intermediateTexture',
		'uniforms',
		'storageTextureArray',
		'blurStorageBindings',
		'blurSamplerBindings'
	],
	#category : 'SDL3-GPUDemos-GaussianBlur',
	#package : 'SDL3-GPUDemos',
	#tag : 'GaussianBlur'
}

{ #category : 'lifecycle' }
SDL3GPUGaussianBlurComputeDemo >> close [

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
SDL3GPUGaussianBlurComputeDemo >> doRenderPassesOn: swapchainTexture with: aSDL3GPUCommandBuffer [

	self
		executeBlurPassWith: aSDL3GPUCommandBuffer
		direction: 0
		inputTexture: texture
		outputTexture: intermediateTexture
		brightness: 1.0.
		
	self
		executeBlurPassWith: aSDL3GPUCommandBuffer
		direction: 1
		inputTexture: intermediateTexture
		outputTexture: writeTexture
		brightness: brightness.
		
	self executeFinalRenderPassOn: swapchainTexture with: aSDL3GPUCommandBuffer
]

{ #category : 'private' }
SDL3GPUGaussianBlurComputeDemo >> executeBlurPassWith: aSDL3GPUCommandBuffer direction: aDirection inputTexture: inputTexture outputTexture: outputTexture brightness: aBrightness [

	uniforms
		blurRadius: blurRadius;
		blurSpread: blurSpread;
		direction: aDirection;
		brightness: aBrightness.
	aSDL3GPUCommandBuffer
		pushGPUComputeUniformDataSlotIndex: 0
		data: uniforms
		length: SDL3GPUBlurUniforms structureSize.

	storageTextureArray at: 1 put: outputTexture.

	blurStorageBindings first
		texture: outputTexture;
		cycle: true.

	blurSamplerBindings first
		texture: inputTexture;
		sampler: sampler.

	(aSDL3GPUCommandBuffer
		beginGPUComputePassStorageTextureBindings: blurStorageBindings
		storageBufferBindings: #())
		bindGPUComputePipeline: computePipeline;
		bindGPUComputeStorageTexturesFirstSlot: 0
		storageTextures: storageTextureArray;
		bindGPUComputeSamplersFirstSlot: 0
		textureSamplerBindings: blurSamplerBindings;
		dispatchWorkgroupCountX: lastExtent x + 7 // 8
		y: lastExtent y + 7 // 8
		z: 1;
		end
]

{ #category : 'private' }
SDL3GPUGaussianBlurComputeDemo >> executeFinalRenderPassOn: swapchainTexture with: aSDL3GPUCommandBuffer [

	| renderPass |
	colorTargetInfos first texture: swapchainTexture.
	renderPass := aSDL3GPUCommandBuffer
				 beginGPURenderPassColorTargetInfos: colorTargetInfos
				 depthStencilTargetInfo: nil.

	renderPass bindGPUGraphicsPipeline: gpuPipeline.

	vertexBufferBindings first buffer: vertexBuffer.
	renderPass bindGPUVertexBuffersFirstSlot: 0 bindings: vertexBufferBindings.

	indexBinding buffer: indexBuffer.
	renderPass
		bindGPUIndexBufferBinding: indexBinding
		indexElementSize: SDL_GPU_INDEXELEMENTSIZE_16BIT.

	textureSamplerBindings first
		texture: writeTexture;
		sampler: sampler.
	renderPass
		bindGPUFragmentSamplersFirstSlot: 0
		textureSamplerBindings: textureSamplerBindings.

	renderPass
		drawGPUIndexedPrimitivesNumIndices: 6
		numInstances: 1
		firstIndex: 0
		vertexOffset: 0
		firstInstance: 0.

	renderPass end
]

{ #category : 'private' }
SDL3GPUGaussianBlurComputeDemo >> fillIndexTransferBuffer: iTransfer [

	| mappedAddress indices |
	mappedAddress := gpuDevice mapGPUTransferBuffer: iTransfer cycle: false.
	indices := FFIArray fromHandle: mappedAddress type: FFIUInt16 size: 6.
	#( 1 2 3 1 3 4 ) doWithIndex: [ :val :idx | 
		indices at: idx put: val - 1 ].
	gpuDevice unmapGPUTransferBuffer: iTransfer
]

{ #category : 'initialization' }
SDL3GPUGaussianBlurComputeDemo >> handleResize [
	"Recreate textures and pipelines based on the new window extent"

	gpuDevice releaseGPUTexture: texture.
	gpuDevice releaseGPUTexture: intermediateTexture.
	gpuDevice releaseGPUTexture: writeTexture.
	
	self initializeTexture.
	self initializeComputeResources
]

{ #category : 'initialization' }
SDL3GPUGaussianBlurComputeDemo >> initialize [

	super initialize.

	blurRadius := 0.0.
	blurSpread := 1.0.
	brightness := 1.0.
	bufferIndex := 1.

	colorTargetInfos := FFIArray newType: SDL_GPUColorTargetInfo size: 1.
	colorTargetInfos first
		storeOp: SDL_GPU_STOREOP_STORE;
		loadOp: SDL_GPU_LOADOP_CLEAR.
	colorTargetInfos first clearColor updateFrom: Color red.

	vertexBufferBindings := FFIArray newType: SDL_GPUBufferBinding size: 1.

	textureSamplerBindings := FFIArray newType: SDL_GPUTextureSamplerBinding size: 1.

	indexBinding := SDL_GPUBufferBinding externalNew.
	indexBinding autoRelease.
	indexBinding offset: 0.

	blurStorageBindings := FFIExternalArray
					  externalNewType:
					  SDL_GPUStorageTextureReadWriteBinding
					  size: 1.
	blurStorageBindings autoRelease.

	blurSamplerBindings := FFIExternalArray
					  externalNewType: SDL_GPUTextureSamplerBinding
					  size: 1.
	blurSamplerBindings autoRelease.

	uniforms := SDL3GPUBlurUniforms new.
	storageTextureArray := FFIArray newType: SDL_GPUTexture size: 1.
]

{ #category : 'initialization' }
SDL3GPUGaussianBlurComputeDemo >> initializeComputeResources [

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
SDL3GPUGaussianBlurComputeDemo >> initializeGeometry [
	"Initialize a single full-screen quad"

	| iTransfer |
	vertexTransferBuffer := gpuDevice newUploadTransferBuffer:
					SDL3GPUQuadVertex structureSize * 4.
	vertexBuffer := gpuDevice
				newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX
				size: SDL3GPUQuadVertex structureSize * 4.

	iTransfer := gpuDevice newUploadTransferBuffer: 2 * 6. "16-bit indices"
	self fillIndexTransferBuffer: iTransfer.

	indexBuffer := gpuDevice
				  newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_INDEX
				  size: 2 * 6.

	self uploadStaticGeometryWithIndexTransfer: iTransfer.

	gpuDevice releaseGPUTransferBuffer: iTransfer
]

{ #category : 'initialization' }
SDL3GPUGaussianBlurComputeDemo >> initializePipeline [

	| vertexShader fragmentShader vertexBindings vertexAttributes colorTargets pipelineCreateInfo |
	vertexShader := SDL3GPUQuadVertexShaderSource
				newShaderAmong: shaderFormats
				device: gpuDevice.
	fragmentShader := SDL3GPUQuadFragmentShaderSource
				 newShaderAmong: shaderFormats
				 device: gpuDevice.

	vertexBindings := self newVertexBufferDescriptions.
	vertexAttributes := self newVertexAttributeDescriptions.
	colorTargets := self newColorTargetDescriptions.

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

	gpuDevice releaseGPUShader: vertexShader.
	gpuDevice releaseGPUShader: fragmentShader.
	vertexBindings free.
	vertexAttributes free.
	colorTargets free
]

{ #category : 'initialization' }
SDL3GPUGaussianBlurComputeDemo >> initializeSampler [

	sampler := gpuDevice newGPUSamplerCreateinfo: (SDL3GPUSamplerCreateInfo new
		minFilter: SDL_GPU_FILTER_LINEAR;
		magFilter: SDL_GPU_FILTER_LINEAR;
		mipmapMode: SDL_GPU_FILTER_LINEAR;
		addressModeU: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE;
		addressModeV: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE;
		addressModeW: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE;
		yourself).

		textureSamplerBindings first sampler: sampler

]

{ #category : 'initialization' }
SDL3GPUGaussianBlurComputeDemo >> initializeTexture [

	| browserMorph form |
	lastExtent := window pixelExtent.

	"Take a snapshot of a browser to be used as background"
	browserMorph :=(Object >> #at:put:) browse owner.
	form := browserMorph extent: lastExtent; asForm.
	browserMorph delete.

	texture :=
		gpuDevice
			newGPUTextureUploadingForm: form
			usage: SDL_GPU_TEXTUREUSAGE_SAMPLER | SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ
]

{ #category : 'private' }
SDL3GPUGaussianBlurComputeDemo >> newColorTargetDescriptions [

	| colorTargets |
	colorTargets := self newColorTargetDescriptions: 1.
	colorTargets first
		format: (gpuDevice getGPUSwapchainTextureFormatIntoWindow: window);
		blendState: SDL_GPUColorTargetBlendState new.
	^ colorTargets
]

{ #category : 'private' }
SDL3GPUGaussianBlurComputeDemo >> newVertexAttributeDescriptions [

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
SDL3GPUGaussianBlurComputeDemo >> newVertexBufferDescriptions [

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
SDL3GPUGaussianBlurComputeDemo >> open [

	super open.

	self initializeTexture.
	self initializeComputeResources.
	self initializeGeometry.
	self initializePipeline.
	self initializeSampler
]

{ #category : 'accessing' }
SDL3GPUGaussianBlurComputeDemo >> updatedTitle [

	^ super updatedTitle,
		(' - Radius: {1} (UP/DOWN) - Spread: {2} (LEFT/RIGHT) - Brightness: {3} (W/S)'
			format: {
				blurRadius printShowingDecimalPlaces: 1.
				blurSpread printShowingDecimalPlaces: 1.
				brightness printShowingDecimalPlaces: 1 })
]

{ #category : 'private' }
SDL3GPUGaussianBlurComputeDemo >> uploadStaticGeometryWithIndexTransfer: iTransfer [

	| mappedAddress |
	gpuDevice acquireGPUCommandBuffer in: [ :commandBuffer | 
		| copyPass |
		mappedAddress := gpuDevice
					mapGPUTransferBuffer: vertexTransferBuffer
					cycle: false.

		(FFIArray fromHandle: mappedAddress type: SDL3GPUQuadVertex size: 4)
			at: 1
			put: (SDL3GPUQuadVertex new
					x: -1.0;
					y: 1.0;
					z: 0.0;
					u: 0.0;
					v: 0.0;
					yourself);
			at: 2
			put: (SDL3GPUQuadVertex new
					x: 1.0;
					y: 1.0;
					z: 0.0;
					u: 1.0;
					v: 0.0;
					yourself);
			at: 3
			put: (SDL3GPUQuadVertex new
					x: 1.0;
					y: -1.0;
					z: 0.0;
					u: 1.0;
					v: 1.0;
					yourself);
			at: 4
			put: (SDL3GPUQuadVertex new
					x: -1.0;
					y: -1.0;
					z: 0.0;
					u: 0.0;
					v: 1.0;
					yourself).
		gpuDevice unmapGPUTransferBuffer: vertexTransferBuffer.

		copyPass := commandBuffer beginGPUCopyPass.
		copyPass
			uploadToGPUBufferSource: (SDL_GPUTransferBufferLocation new
					transferBuffer: vertexTransferBuffer;
					offset: 0;
					yourself)
			destination: (SDL_GPUBufferRegion new
					buffer: vertexBuffer;
					offset: 0;
					size: SDL3GPUQuadVertex structureSize * 4;
					yourself)
			cycle: false.
		copyPass
			uploadToGPUBufferSource: (SDL_GPUTransferBufferLocation new
					transferBuffer: iTransfer;
					offset: 0;
					yourself)
			destination: (SDL_GPUBufferRegion new
					buffer: indexBuffer;
					offset: 0;
					size: 2 * 6;
					yourself)
			cycle: false.
		copyPass end.
		commandBuffer submit ]
]

{ #category : 'hooks' }
SDL3GPUGaussianBlurComputeDemo >> visitKeyboardDownEvent: aKeyboardDownEvent [

	super visitKeyboardDownEvent: aKeyboardDownEvent.

	aKeyboardDownEvent key = SDLK_UP asInteger ifTrue: [
		blurRadius := (blurRadius + 0.5) min: 10.0 ].
	aKeyboardDownEvent key = SDLK_DOWN asInteger ifTrue: [
		blurRadius := (blurRadius - 0.5) max: 0.0 ].
	aKeyboardDownEvent key = SDLK_LEFT asInteger ifTrue: [
		blurSpread := (blurSpread - 0.5) max: 1.0 ].
	aKeyboardDownEvent key = SDLK_RIGHT asInteger ifTrue: [
		blurSpread := (blurSpread + 0.5) min: 4.0 ].
	aKeyboardDownEvent key = SDLK_W asInteger ifTrue: [
		brightness := (brightness + 0.1) min: 2.0 ].
	aKeyboardDownEvent key = SDLK_S asInteger ifTrue: [
		brightness := (brightness - 0.1) max: 0.0 ].
	
	self updateTitle
]

{ #category : 'visiting - concrete' }
SDL3GPUGaussianBlurComputeDemo >> visitWindowPixelSizeChangedEvent: aWindowPixelSizeChangedEvent [

	super visitWindowPixelSizeChangedEvent: aWindowPixelSizeChangedEvent.

	aWindowPixelSizeChangedEvent extent = lastExtent ifFalse: [ self handleResize ]
]
