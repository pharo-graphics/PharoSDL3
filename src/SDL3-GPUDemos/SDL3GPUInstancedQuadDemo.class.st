"
I demonstrate how to render textured quads using the SDL3 GPU API and instanced rendering.
"
Class {
	#name : 'SDL3GPUInstancedQuadDemo',
	#superclass : 'SDL3GPUDemoApp',
	#instVars : [
		'gpuPipeline',
		'vertexBuffer',
		'sampler',
		'texture',
		'colorTargetInfos',
		'vertexBufferBindings',
		'textureSamplerBindings',
		'numberOfQuads',
		'filter',
		'vertexTransferBuffer',
		'indexBuffer',
		'indexTransferBuffer',
		'indexBinding',
		'uniforms',
		'columns',
		'rows',
		'enableRotation',
		'enableScale'
	],
	#category : 'SDL3-GPUDemos-InstancedQuads',
	#package : 'SDL3-GPUDemos',
	#tag : 'InstancedQuads'
}

{ #category : 'lifecycle' }
SDL3GPUInstancedQuadDemo >> close [

	gpuPipeline ifNotNil: [ 
		gpuDevice releaseGPUGraphicsPipeline: gpuPipeline.
		gpuPipeline := nil ].

	vertexTransferBuffer ifNotNil: [ 
		gpuDevice releaseGPUTransferBuffer: vertexTransferBuffer.
		vertexTransferBuffer := nil ].
	
	indexTransferBuffer ifNotNil: [ 
		gpuDevice releaseGPUTransferBuffer: indexTransferBuffer.
		indexTransferBuffer := nil ].

	vertexBuffer ifNotNil: [ 
		gpuDevice releaseGPUBuffer: vertexBuffer.
		vertexBuffer := nil ].

	indexBuffer ifNotNil: [ 
		gpuDevice releaseGPUBuffer: indexBuffer.
		indexBuffer := nil ].

	sampler ifNotNil: [ 
		gpuDevice releaseGPUSampler: sampler.
		sampler := nil ].

	texture ifNotNil: [ 
		gpuDevice releaseGPUTexture: texture.
		texture := nil ].

	super close
]

{ #category : 'actions' }
SDL3GPUInstancedQuadDemo >> decrementQuads [

	columns := (columns - 1) max: 1.
	rows := (rows - 1) max: 1.
	numberOfQuads := columns * rows.
	self updateTitle
]

{ #category : 'rendering' }
SDL3GPUInstancedQuadDemo >> doRenderPassesOn: swapchainTexture with: aCommandBuffer [

	| renderPass |
	colorTargetInfos first texture: swapchainTexture.

	renderPass :=
		aCommandBuffer
			beginGPURenderPassColorTargetInfos: colorTargetInfos
			depthStencilTargetInfo: nil.

	renderPass bindGPUGraphicsPipeline: gpuPipeline.

	renderPass
		bindGPUVertexBuffersFirstSlot: 0
		bindings: vertexBufferBindings.

	renderPass
		bindGPUIndexBufferBinding: indexBinding
		indexElementSize: SDL_GPU_INDEXELEMENTSIZE_16BIT.

	renderPass
		bindGPUFragmentSamplersFirstSlot: 0
		textureSamplerBindings: textureSamplerBindings.
	uniforms 
		time: Time millisecondClockValue / 1000.0;
		enableRotation: enableRotation;
		enableScale: enableScale;
		numCols: columns;
		numRows: rows.

	aCommandBuffer
		pushGPUVertexUniformDataSlotIndex: 0
		data: uniforms
		length: uniforms class structureSize.

	renderPass
		drawGPUIndexedPrimitivesNumIndices: 6
		numInstances: numberOfQuads
		firstIndex: 0
		vertexOffset: 0
		firstInstance: 0.

	renderPass end
]

{ #category : 'actions' }
SDL3GPUInstancedQuadDemo >> incrementQuads [

	columns := columns + 1.
	rows := rows + 1.
	numberOfQuads := columns * rows.
	self updateTitle
]

{ #category : 'accessing' }
SDL3GPUInstancedQuadDemo >> initialExtent [

	^ 800 @ 600
]

{ #category : 'initialization' }
SDL3GPUInstancedQuadDemo >> initialize [

	super initialize.

	filter := SDL_GPU_FILTER_NEAREST.
	columns := 6.
	rows := 6.
	numberOfQuads := columns * rows.

	enableRotation := 1.0.
	enableScale := 1.0.

	colorTargetInfos := FFIArray newType: SDL_GPUColorTargetInfo size: 1.
	colorTargetInfos first
		storeOp: SDL_GPU_STOREOP_STORE;
		loadOp: SDL_GPU_LOADOP_CLEAR.
	colorTargetInfos first clearColor r: 0.1; g: 0.1; b: 0.1; a: 1.0.

	vertexBufferBindings := FFIArray newType: SDL_GPUBufferBinding size: 1.

	textureSamplerBindings := FFIArray newType: SDL_GPUTextureSamplerBinding size: 1.

	indexBinding := SDL_GPUBufferBinding externalNew.
	indexBinding autoRelease.

	uniforms := SDL3GPUInstancedQuadUniforms new.
]

{ #category : 'initialization' }
SDL3GPUInstancedQuadDemo >> initializeGPUResources [

	self initializeTexture.
	self updateVertexBuffer.
	self updateIndexBuffer.
	self initializePipeline.
	self switchSamplerFilter
]

{ #category : 'initialization' }
SDL3GPUInstancedQuadDemo >> initializePipeline [

	| vertexShader fragmentShader vertexBindings vertexAttributes colorTargets pipelineCreateInfo |
	vertexShader :=
		SDL3GPUInstancedQuadVertexShaderSource
			newShaderAmong: shaderFormats
			device: gpuDevice.
	fragmentShader :=
		SDL3GPUInstancedQuadFragmentShaderSource
			newShaderAmong: shaderFormats
			device: gpuDevice.

	vertexBindings :=
		FFIExternalArray
			externalNewType: SDL_GPUVertexBufferDescription
			size: 1.
	vertexBindings first
		slot: 0;
		inputRate: SDL_GPU_VERTEXINPUTRATE_VERTEX;
		instanceStepRate: 0;
		pitch: SDL3GPUQuadVertex structureSize.

	vertexAttributes :=
		FFIExternalArray
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

	colorTargets :=
		FFIExternalArray
			externalNewType: SDL_GPUColorTargetDescription
			size: 1.
	colorTargets first 
		format: (gpuDevice getGPUSwapchainTextureFormatIntoWindow: window);
		blendState:
			(SDL_GPUColorTargetBlendState new
				enableBlend: true;
				srcColorBlendfactor: SDL_GPU_BLENDFACTOR_SRC_ALPHA;
				dstColorBlendfactor: SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA;
				colorBlendOp: SDL_GPU_BLENDOP_ADD;
				srcAlphaBlendfactor: SDL_GPU_BLENDFACTOR_SRC_ALPHA;
				dstAlphaBlendfactor: SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA;
				alphaBlendOp: SDL_GPU_BLENDOP_ADD;
				yourself).
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

	"We can free after pipeline was created"
	gpuDevice releaseGPUShader: vertexShader.
	gpuDevice releaseGPUShader: fragmentShader.	
	vertexBindings free.
	vertexAttributes free.
	colorTargets free
]

{ #category : 'initialization' }
SDL3GPUInstancedQuadDemo >> initializeTexture [

	texture :=
		gpuDevice
			newGPUTextureUploadingForm: (self iconNamed: #remote)
			usage: SDL_GPU_TEXTUREUSAGE_SAMPLER.

	textureSamplerBindings first texture: texture
]

{ #category : 'testing' }
SDL3GPUInstancedQuadDemo >> isNearestSamplerFilter [

	^ filter = SDL_GPU_FILTER_NEAREST
]

{ #category : 'lifecycle' }
SDL3GPUInstancedQuadDemo >> open [

	super open.
	self initializeGPUResources
]

{ #category : 'private' }
SDL3GPUInstancedQuadDemo >> quadIndices [
	^ #(0 1 2 0 2 3)
]

{ #category : 'initialization' }
SDL3GPUInstancedQuadDemo >> switchSamplerFilter [

	"If needed, switch to the other filter and release current sampler"
	sampler ifNotNil: [
		filter :=
			self isNearestSamplerFilter
				ifTrue: [ SDL_GPU_FILTER_LINEAR ]
				ifFalse: [ SDL_GPU_FILTER_NEAREST ].
		gpuDevice releaseGPUSampler: sampler ].

	sampler := gpuDevice newGPUSamplerCreateinfo:
		(SDL3GPUSamplerCreateInfo new
			minFilter: filter;
			magFilter: filter;
			mipmapMode: filter;
			addressModeU: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE;
			addressModeV: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE;
			addressModeW: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE;
			yourself).

			textureSamplerBindings first sampler: sampler

]

{ #category : 'initialization' }
SDL3GPUInstancedQuadDemo >> updateIndexBuffer [

	| mappedAddress indices byteSize commandBuffer |
	
	byteSize := 6 * 2. "16-bit indices, 6 indices per quad"

	indexTransferBuffer := gpuDevice newUploadTransferBuffer: byteSize.
	indexBuffer := gpuDevice 
		newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_INDEX
		size: byteSize.

	indexBinding buffer: indexBuffer.

	mappedAddress := gpuDevice mapGPUTransferBuffer: indexTransferBuffer cycle: true.
	mappedAddress isNull ifTrue: [ SDL3Error signalFromLibraryErrorMessage ].

	indices := FFIArray fromHandle: mappedAddress type: FFIUInt16 size: 6.
	
	1 to: 6 do: [ :j | indices at: j put: (self quadIndices at: j) ].

	gpuDevice unmapGPUTransferBuffer: indexTransferBuffer.

	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer beginGPUCopyPass
		uploadToGPUBufferSource:
			(SDL_GPUTransferBufferLocation new
				transferBuffer: indexTransferBuffer;
				offset: 0;
				yourself)
		destination:
			(SDL_GPUBufferRegion new
				buffer: indexBuffer;
				offset: 0;
				size: byteSize;
				yourself)
		cycle: true;
		end.
	commandBuffer submit.
	
	gpuDevice releaseGPUTransferBuffer: indexTransferBuffer.
	indexTransferBuffer := nil
]

{ #category : 'initialization' }
SDL3GPUInstancedQuadDemo >> updateVertexBuffer [

	| mappedAddress vertices byteSize commandBuffer |
	
	byteSize := SDL3GPUQuadVertex structureSize * 4.

	vertexTransferBuffer := gpuDevice newUploadTransferBuffer: byteSize.
	vertexBuffer := gpuDevice 
		newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX
		size: byteSize.

	vertexBufferBindings first buffer: vertexBuffer.

	mappedAddress := gpuDevice mapGPUTransferBuffer: vertexTransferBuffer cycle: true.
	mappedAddress isNull ifTrue: [ SDL3Error signalFromLibraryErrorMessage ].

	vertices :=
		FFIArray
			fromHandle: mappedAddress
			type: SDL3GPUQuadVertex
			size: 4.
	
	"Write a single base quad from 0..1 in x and 0..-1 in y"
	(vertices at: 1) x: 0; y: 0; z: 0; u: 0; v: 0.
	(vertices at: 2) x: 1; y: 0; z: 0; u: 1; v: 0.
	(vertices at: 3) x: 1; y: -1; z: 0; u: 1; v: 1.
	(vertices at: 4) x: 0; y: -1; z: 0; u: 0; v: 1.

	gpuDevice unmapGPUTransferBuffer: vertexTransferBuffer.

	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer beginGPUCopyPass
		uploadToGPUBufferSource:
			(SDL_GPUTransferBufferLocation new
				transferBuffer: vertexTransferBuffer;
				offset: 0;
				yourself)
		destination:
			(SDL_GPUBufferRegion new
				buffer: vertexBuffer;
				offset: 0;
				size: byteSize;
				yourself)
		cycle: true;
		end.
	commandBuffer submit.
	
	gpuDevice releaseGPUTransferBuffer: vertexTransferBuffer.
	vertexTransferBuffer := nil
]

{ #category : 'accessing' }
SDL3GPUInstancedQuadDemo >> updatedTitle [

	^ super updatedTitle,
		(' - Count: {1} (UP/DOWN) - Filter: {2} (F) - Rot: {3} (R) - Scale: {4} (S)'
			format: {
				numberOfQuads.
				self isNearestSamplerFilter ifTrue: [ 'NEAREST' ] ifFalse: [ 'LINEAR' ].
				enableRotation > 0.5 ifTrue: ['ON'] ifFalse: ['OFF'].
				enableScale > 0.5 ifTrue: ['ON'] ifFalse: ['OFF'] })
]

{ #category : 'hooks' }
SDL3GPUInstancedQuadDemo >> visitKeyboardDownEvent: aKeyboardDownEvent [

	super visitKeyboardDownEvent: aKeyboardDownEvent.

	aKeyboardDownEvent key = SDLK_F asInteger ifTrue: [
		self switchSamplerFilter.
		self updateTitle ].
	aKeyboardDownEvent key = SDLK_UP asInteger ifTrue: [
		self incrementQuads ].
	aKeyboardDownEvent key = SDLK_DOWN asInteger ifTrue: [
		self decrementQuads ].
	aKeyboardDownEvent key = SDLK_R asInteger ifTrue: [
		enableRotation := enableRotation > 0.5 ifTrue: [0.0] ifFalse: [1.0].
		self updateTitle ].
	aKeyboardDownEvent key = SDLK_S asInteger ifTrue: [
		enableScale := enableScale > 0.5 ifTrue: [0.0] ifFalse: [1.0].
		self updateTitle ]
]
