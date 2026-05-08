"
I demonstrate how to render textured quads using the SDL3 GPU API.
I use vertex and fragment shaders defined in Pharo.
"
Class {
	#name : 'SDL3GPUQuadDemo',
	#superclass : 'SDL3GPUClearDemo',
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
		'vertexBufferSize',
		'indexBuffer',
		'indexBufferSize',
		'indexTransferBuffer',
		'indexBinding'
	],
	#category : 'SDL3-Tests-Quads',
	#package : 'SDL3-Tests',
	#tag : 'Quads'
}

{ #category : 'lifecycle' }
SDL3GPUQuadDemo >> close [

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
SDL3GPUQuadDemo >> decrementQuads [

	numberOfQuads := (numberOfQuads - 1) max: 1.
	self updateVertexBuffer.
	self updateIndexBuffer.
	self updateTitle
]

{ #category : 'rendering' }
SDL3GPUQuadDemo >> doRenderPassesOn: aSDL3GPUTexture with: aSDL3GPUCommandBuffer [

	| animatedHue renderPass |
	vertexBufferBindings first buffer: vertexBuffer.

	colorTargetInfos first texture: aSDL3GPUTexture.

	"Animate background hue to show blending"
	animatedHue := (Time millisecondClockValue / 20.0) \\ 360.
	colorTargetInfos first clearColor updateFrom: (Color h: animatedHue s: 0.8 v: 0.3).

	renderPass :=
		aSDL3GPUCommandBuffer
			beginGPURenderPassColorTargetInfos: colorTargetInfos
			numColorTargets: colorTargetInfos size
			depthStencilTargetInfo: nil.
	renderPass assertNotNullReturn.

	renderPass bindGPUGraphicsPipeline: gpuPipeline.
	
	renderPass
		bindGPUVertexBuffersFirstSlot: 0
		bindings: vertexBufferBindings
		numBindings: vertexBufferBindings size.

	indexBinding buffer: indexBuffer; offset: 0.
	renderPass
		bindGPUIndexBufferBinding: indexBinding
		indexElementSize: SDL_GPU_INDEXELEMENTSIZE_16BIT.
	
	textureSamplerBindings first texture: texture.
	renderPass
		bindGPUFragmentSamplersFirstSlot: 0
		textureSamplerBindings: textureSamplerBindings
		numBindings: textureSamplerBindings size.

	renderPass
		drawGPUIndexedPrimitivesNumIndices: self indicesCount
		numInstances: 1
		firstIndex: 0
		vertexOffset: 0
		firstInstance: 0.

	renderPass end
]

{ #category : 'actions' }
SDL3GPUQuadDemo >> incrementQuads [

	numberOfQuads := numberOfQuads + 1.
	self updateVertexBuffer.
	self updateIndexBuffer.
	self updateTitle
]

{ #category : 'accessing' }
SDL3GPUQuadDemo >> indicesCount [

	^ numberOfQuads * 6
]

{ #category : 'initialization' }
SDL3GPUQuadDemo >> initialize [

	super initialize.
	initialExtent := 600 @ 600.
	filter := SDL_GPU_FILTER_NEAREST.
	numberOfQuads := 36.
	vertexBufferSize := 0.
	indexBufferSize := 0.

	colorTargetInfos := FFIExternalArray externalNewType: SDL_GPUColorTargetInfo size: 1.
	colorTargetInfos autoRelease.
	colorTargetInfos first
		storeOp: SDL_GPU_STOREOP_STORE;
		loadOp: SDL_GPU_LOADOP_CLEAR.

	vertexBufferBindings := FFIExternalArray externalNewType: SDL_GPUBufferBinding size: 1.
	vertexBufferBindings autoRelease.

	textureSamplerBindings := FFIExternalArray externalNewType: SDL_GPUTextureSamplerBinding size: 1.
	textureSamplerBindings autoRelease.

	indexBinding := SDL_GPUBufferBinding externalNew.
	indexBinding autoRelease
]

{ #category : 'initialization' }
SDL3GPUQuadDemo >> initializeGPUResources [

	self initializeTexture.
	self updateVertexBuffer.
	self updateIndexBuffer.
	self initializePipeline.
	self switchSamplerFilter
]

{ #category : 'initialization' }
SDL3GPUQuadDemo >> initializePipeline [

	| shaderFormats vertexShader fragmentShader vertexBindings vertexAttributes colorTargets pipelineCreateInfo |
	shaderFormats := gpuDevice gpuShaderFormatsAsArray.
	vertexShader :=
		SDL3GPUQuadVertexShaderSource
			newShaderAmong: shaderFormats
			device: gpuDevice.
	fragmentShader :=
		SDL3GPUQuadFragmentShaderSource
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
	gpuPipeline assertNotNullReturn.

	"We can free after pipeline was created"
	gpuDevice releaseGPUShader: vertexShader.
	gpuDevice releaseGPUShader: fragmentShader.	
	vertexBindings free.
	vertexAttributes free.
	colorTargets free
]

{ #category : 'initialization' }
SDL3GPUQuadDemo >> initializeTexture [

	texture :=
		gpuDevice
			newGPUTextureUploadingForm: (self iconNamed: #remote)
			usage: SDL_GPU_TEXTUREUSAGE_SAMPLER
]

{ #category : 'testing' }
SDL3GPUQuadDemo >> isNearestSamplerFilter [

	^ filter = SDL_GPU_FILTER_NEAREST
]

{ #category : 'running' }
SDL3GPUQuadDemo >> iterateUntilQuit [

	| quit |
	quit := false.

	[ quit ] whileFalse: [
		self pollEventsDo: [ :evt |
			evt type = SDL_EVENT_QUIT ifTrue: [ quit := true ].
			evt type = SDL_EVENT_KEY_DOWN ifTrue: [
				evt key = SDLK_ESCAPE asInteger ifTrue: [ quit := true ].

				evt key = SDLK_F asInteger ifTrue: [
					self switchSamplerFilter.
					self updateTitle ].
				evt key = SDLK_UP asInteger ifTrue: [
					self incrementQuads ].
				evt key = SDLK_DOWN asInteger ifTrue: [
					self decrementQuads ]
			] ].

		self render.

		16.6 milliSeconds wait ]
]

{ #category : 'accessing' }
SDL3GPUQuadDemo >> numberOfVerticesPerQuad [

	^ 4
]

{ #category : 'lifecycle' }
SDL3GPUQuadDemo >> open [
	"Run headless with:
	./pharo Pharo.image eval 'SDL3GPUQuadDemo new run'
	"

	super open.
	self updateTitle.
	self initializeGPUResources
]

{ #category : 'private' }
SDL3GPUQuadDemo >> quadIndices [
	"Standard 16-bit index pattern for a quad:
	Vertices: 0:TL, 1:TR, 2:BR, 3:BL
	Triangles: (0,1,2) and (0,2,3)
	"
	^ #(0 1 2 0 2 3)
]

{ #category : 'rendering' }
SDL3GPUQuadDemo >> render [

	self updateVertexBuffer.
	super render
]

{ #category : 'initialization' }
SDL3GPUQuadDemo >> switchSamplerFilter [

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
	sampler assertNotNullReturn.
	
	textureSamplerBindings first sampler: sampler
]

{ #category : 'initialization' }
SDL3GPUQuadDemo >> updateIndexBuffer [

	| mappedAddress indices byteSize commandBuffer copyPass |
	
	byteSize := self indicesCount * 2. "16-bit indices"

	"1. Initialize buffer (or recreate if number of quads changed)"
	indexBufferSize = byteSize ifFalse: [

		indexBuffer ifNotNil: [
			gpuDevice releaseGPUBuffer: indexBuffer.
			gpuDevice releaseGPUTransferBuffer: indexTransferBuffer ].

		indexTransferBuffer := gpuDevice newUploadTransferBuffer: byteSize.

		indexBuffer := gpuDevice 
			newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_INDEX
			size: byteSize.

		indexBufferSize := byteSize ].

	"2. Upload new data"
	mappedAddress := gpuDevice mapGPUTransferBuffer: indexTransferBuffer cycle: true.
	mappedAddress isNull ifTrue: [ SDL3Error signalFromLibraryErrorMessage ].

	indices := FFIExternalArray fromHandle: mappedAddress type: FFIUInt16 size: self indicesCount.
	
	1 to: numberOfQuads do: [ :i |
		| baseVertex baseIndex |
		baseVertex := (i - 1) * self numberOfVerticesPerQuad.
		baseIndex := (i - 1) * 6.
		1 to: 6 do: [ :j |
			indices at: baseIndex + j put: baseVertex + (self quadIndices at: j) ] ].

	gpuDevice unmapGPUTransferBuffer: indexTransferBuffer.

	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer assertNotNullReturn.
	copyPass := commandBuffer beginGPUCopyPass.
	copyPass
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
		cycle: true.
	copyPass end.
	sdl assertSuccess: commandBuffer submit
]

{ #category : 'actions' }
SDL3GPUQuadDemo >> updateTitle [

	window title: ('Quads: {1} (UP/DOWN to change) - Filter: {2} (F to switch) - ESC to quit'
		format: {
			numberOfQuads.
			self isNearestSamplerFilter ifTrue: [ 'NEAREST' ] ifFalse: [ 'LINEAR' ] })
]

{ #category : 'initialization' }
SDL3GPUQuadDemo >> updateVertexBuffer [

	| mappedAddress vertices byteSize commandBuffer copyPass cols rows quadW quadH phase zoom |
	
	"1. Determine Grid Layout"
	cols := numberOfQuads sqrt ceiling.
	rows := (numberOfQuads / cols) ceiling.
	zoom := 1.1. "Increase zoom to overlap quads"
	quadW := (2.0 / cols) * zoom.
	quadH := (2.0 / rows) * zoom.
	
	byteSize := SDL3GPUQuadVertex structureSize * self verticesCount.

	"2. Initialize buffer (or recreate if number of quads changed)"
	vertexBufferSize = byteSize ifFalse: [

		vertexBuffer ifNotNil: [
			gpuDevice releaseGPUBuffer: vertexBuffer.
			gpuDevice releaseGPUTransferBuffer: vertexTransferBuffer ].

		vertexTransferBuffer := gpuDevice newUploadTransferBuffer: byteSize.

		vertexBuffer := gpuDevice 
			newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX
			size: byteSize.

		vertexBufferSize := byteSize ].

	"3. Upload new data (Using CYCLE: TRUE for animation)"
	mappedAddress := gpuDevice mapGPUTransferBuffer: vertexTransferBuffer cycle: true.
	mappedAddress isNull ifTrue: [ SDL3Error signalFromLibraryErrorMessage ].

	vertices :=
		FFIExternalArray
			fromHandle: mappedAddress
			type: SDL3GPUQuadVertex
			size: self verticesCount.
	
	phase := Time millisecondClockValue / 500.0.
	1 to: numberOfQuads do: [ :i |
		| col row x y p |
		p := phase + (i * 0.3).
		row := (i - 1) // cols + 1.
		col := (i - 1) \\ cols + 1.
		x := -1.0 + ((col - 1) * (2.0 / cols)) + (p sin * 0.05).
		y := 1.0 - ((row - 1) * (2.0 / rows)) + (p cos * 0.05).
		self
			writeQuadTo: vertices
			at: (i - 1) * self numberOfVerticesPerQuad + 1 
			x: x
			y: y
			w: quadW
			h: quadH ].

	gpuDevice unmapGPUTransferBuffer: vertexTransferBuffer.

	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer assertNotNullReturn.
	copyPass := commandBuffer beginGPUCopyPass.
	copyPass
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
		cycle: true.
	copyPass end.
	sdl assertSuccess: commandBuffer submit
]

{ #category : 'accessing' }
SDL3GPUQuadDemo >> verticesCount [

	^ self numberOfVerticesPerQuad * numberOfQuads
]

{ #category : 'private' }
SDL3GPUQuadDemo >> writeQuadTo: aVertexArray at: startIndex x: x y: y w: w h: h [

	| v |
	"Vertices (NDC): y increases UPWARDS.
	 UVs: y increases DOWNWARDS.
	 
	 0: TL: x, y       UV: 0, 0
	 1: TR: x+w, y     UV: 1, 0
	 2: BR: x+w, y-h   UV: 1, 1
	 3: BL: x, y-h     UV: 0, 1
	 "

	"0: TL"
	v := aVertexArray at: startIndex.
	v x: x; y: y; z: 0; u: 0; v: 0.
	"1: TR"
	v := aVertexArray at: startIndex + 1.
	v x: x + w; y: y; z: 0; u: 1; v: 0.
	"2: BR"
	v := aVertexArray at: startIndex + 2.
	v x: x + w; y: y - h; z: 0; u: 1; v: 1.
	"3: BL"
	v := aVertexArray at: startIndex + 3.
	v x: x; y: y - h; z: 0; u: 0; v: 1.
]
