"
I demonstrate how to render textured quads using the SDL3 GPU API.
I use vertex and fragment shaders defined in Smalltalk.
I use a hardcoded ByteArray pattern to verify the entire pipeline.
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
		'vertexBufferSize'
	],
	#pools : [
		'SDL3GPUTextureFormat',
		'SDL3GPUTextureUsageFlags'
	],
	#category : 'SDL3-Tests-Quad',
	#package : 'SDL3-Tests',
	#tag : 'Quad'
}

{ #category : 'lifecycle' }
SDL3GPUQuadDemo >> close [

	gpuPipeline ifNotNil: [ 
		gpuDevice releaseGPUGraphicsPipeline: gpuPipeline.
		gpuPipeline := nil ].

	vertexTransferBuffer ifNotNil: [ 
		gpuDevice releaseGPUTransferBuffer: vertexTransferBuffer.
		vertexTransferBuffer := nil ].
	
	vertexBuffer ifNotNil: [ 
		gpuDevice releaseGPUBuffer: vertexBuffer.
		vertexBuffer := nil ].

	sampler ifNotNil: [ 
		gpuDevice releaseGPUSampler: sampler.
		sampler := nil ].

	texture ifNotNil: [ 
		gpuDevice releaseGPUTexture: texture.
		texture := nil ].

	
	super close
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
	
	textureSamplerBindings first texture: texture.
	renderPass
		bindGPUFragmentSamplersFirstSlot: 0
		textureSamplerBindings: textureSamplerBindings
		numBindings: textureSamplerBindings size.

	renderPass
		drawGPUPrimitivesNumVertices: self verticesCount
		numInstances: 1
		firstVertex: 0
		firstInstance: 0.

	renderPass end
]

{ #category : 'initialization' }
SDL3GPUQuadDemo >> initialize [

	super initialize.
	initialExtent := 600 @ 600.
	filter := SDL3GPUFilter nearest.
	numberOfQuads := 36.

	colorTargetInfos := FFIExternalArray externalNewType: SDL3GPUColorTargetInfo size: 1.
	colorTargetInfos autoRelease.
	colorTargetInfos first
		storeOp: SDL3GPUStoreOp store;
		loadOp: SDL3GPULoadOp clear.

	vertexBufferBindings := FFIExternalArray externalNewType: SDL3GPUBufferBinding size: 1.
	vertexBufferBindings autoRelease.

	textureSamplerBindings := FFIExternalArray externalNewType: SDL3GPUTextureSamplerBinding size: 1.
	textureSamplerBindings autoRelease
]

{ #category : 'initialization' }
SDL3GPUQuadDemo >> initializeGPUResources [

	self initializeTexture.
	self updateVertexBuffer.
	self initializePipeline.
	self switchSamplerFilter.

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
			externalNewType: SDL3GPUVertexBufferDescription
			size: 1.
	vertexBindings first
		slot: 0;
		inputRate: SDL3GPUVertexInputRate vertex;
		instanceStepRate: 0;
		pitch: SDL3GPUVertex structureSize.

	vertexAttributes :=
		FFIExternalArray
			externalNewType: SDL3GPUVertexAttribute
			size: 2.
	vertexAttributes first
		bufferSlot: 0;
		format: SDL3GPUVertexElementFormat float3;
		location: 0;
		offset: 0.
	vertexAttributes second
		bufferSlot: 0;
		format: SDL3GPUVertexElementFormat float2;
		location: 1;
		offset: 12.

	colorTargets :=
		FFIExternalArray
			externalNewType: SDL3GPUColorTargetDescription
			size: 1.
	colorTargets first 
		format: (gpuDevice getGPUSwapchainTextureFormatIntoWindow: window);
		blendState:
			(SDL3GPUColorTargetBlendState new
				enableBlend: true;
				srcColorBlendfactor: SDL3GPUBlendFactor srcAlpha;
				dstColorBlendfactor: SDL3GPUBlendFactor oneMinusSrcAlpha;
				colorBlendOp: SDL3GPUBlendOp add;
				srcAlphaBlendfactor: SDL3GPUBlendFactor srcAlpha;
				dstAlphaBlendfactor: SDL3GPUBlendFactor oneMinusSrcAlpha;
				alphaBlendOp: SDL3GPUBlendOp add;
				yourself).
	pipelineCreateInfo := SDL3GPUGraphicsPipelineCreateInfo new.
	pipelineCreateInfo targetInfo
		numColorTargets: colorTargets size;
		colorTargetDescriptions: colorTargets.
	pipelineCreateInfo vertexInputState
		numVertexBuffers: vertexBindings size;
		vertexBufferDescriptions: vertexBindings;
		vertexAttributes: vertexAttributes;
		numVertexAttributes: vertexAttributes size.
	pipelineCreateInfo
		primitiveType: SDL3GPUPrimitiveType triangleList;
		vertexShader: vertexShader;
		fragmentShader: fragmentShader.

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

	| transferBuffer mappedAddress commandBuffer copyPass icon form |
	icon := self iconNamed: #remote.
	form := Form extent: icon extent depth: 32.
	form fillColor: Color transparent.
	icon displayOn: form.
	form unhibernate.

	texture :=
		gpuDevice
			new2DTextureFormat: SDL3GPUTextureFormat b8g8r8a8Unorm
			usage: SDL3GPUTextureUsageFlags sampler
			width: form width
			height: form height.
	texture assertNotNullReturn.

	transferBuffer := gpuDevice newUploadTransferBuffer: form bits byteSize.
	transferBuffer assertNotNullReturn.
	mappedAddress := gpuDevice mapGPUTransferBuffer: transferBuffer cycle: false.
	mappedAddress isNull ifTrue: [ SDL3Error signalFromLibraryErrorMessage ].

	"Copy from surface pixels handle to mappedAddress handle"
	LibC memCopy: form bits to: mappedAddress size: form bits byteSize.
	gpuDevice unmapGPUTransferBuffer: transferBuffer.

	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer assertNotNullReturn.
	copyPass := commandBuffer beginGPUCopyPass.
	copyPass
		uploadToGPUTextureSource:
			(SDL3GPUTextureTransferInfo new
				 transferBuffer: transferBuffer;
				 offset: 0;
				 yourself)
		destination:
			(SDL3GPUTextureRegion new
				 texture: texture;
				 w: form width;
				 h: form height;
				 d: 1;
				 yourself)
		cycle: false.
	copyPass end.
	sdl assertSuccess: commandBuffer submit.

	gpuDevice releaseGPUTransferBuffer: transferBuffer
]

{ #category : 'testing' }
SDL3GPUQuadDemo >> isNearestSamplerFilter [

	^ filter = SDL3GPUFilter nearest
]

{ #category : 'running' }
SDL3GPUQuadDemo >> iterateUntilQuit [

	| quit |
	quit := false.

	[ quit ] whileFalse: [
		self pollEventsDo: [ :evt |
			evt type = SDL3EventType quit ifTrue: [ quit := true ].
			evt type = SDL3EventType keyDown ifTrue: [
				evt key = SDL3Keycode escape asInteger ifTrue: [ quit := true ].

				evt key = SDL3Keycode f asInteger ifTrue: [
					self switchSamplerFilter.
					self updateTitle ].
				evt key = SDL3Keycode up asInteger ifTrue: [
					numberOfQuads := numberOfQuads + 1.
					self updateTitle ].
				evt key = SDL3Keycode down asInteger ifTrue: [
					numberOfQuads := (numberOfQuads - 1) max: 1.
					self updateTitle ]
			] ].

		self render.

		16.6 milliSeconds wait ]
]

{ #category : 'accessing' }
SDL3GPUQuadDemo >> numberOfVerticesPerQuad [

	^ 6
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
				ifTrue: [ SDL3GPUFilter linear ]
				ifFalse: [ SDL3GPUFilter nearest ].
		gpuDevice releaseGPUSampler: sampler ].

	sampler := gpuDevice newGPUSamplerCreateinfo:
		(SDL3GPUSamplerCreateInfo new
			minFilter: filter;
			magFilter: filter;
			mipmapMode: filter;
			addressModeU: SDL3GPUSamplerAddressMode clampToEdge;
			addressModeV: SDL3GPUSamplerAddressMode clampToEdge;
			addressModeW: SDL3GPUSamplerAddressMode clampToEdge;
			yourself).
	sampler assertNotNullReturn.
	
	textureSamplerBindings first sampler: sampler
]

{ #category : 'actions' }
SDL3GPUQuadDemo >> updateTitle [

	window title: ('Quads: {1} (UP/DOWN to change) - {2} filter (F to switch) - ESC to quit'
		format: {
			numberOfQuads.
			self isNearestSamplerFilter ifTrue: [ 'NEAREST' ] ifFalse: [ 'LINEAR' ]  })
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
	
	byteSize := SDL3GPUVertex structureSize * self verticesCount.

	"2. Initialize buffer (or recreate if number of quads changed)"
	vertexBufferSize = byteSize ifFalse: [

		vertexBuffer ifNotNil: [
			gpuDevice releaseGPUBuffer: vertexBuffer.
			gpuDevice releaseGPUTransferBuffer: vertexTransferBuffer ].

		vertexTransferBuffer := gpuDevice newUploadTransferBuffer: byteSize.
		vertexTransferBuffer assertNotNullReturn.

		vertexBuffer := gpuDevice 
			newGPUBufferCreateinfo:
				(SDL3GPUBufferCreateInfo new 
					usage: SDL3GPUBufferUsageFlags vertex asInteger;
					size: byteSize;
					yourself).
		vertexBuffer assertNotNullReturn.
		vertexBufferSize := byteSize ].

	"3. Upload new data (Using CYCLE: TRUE for animation)"
	mappedAddress := gpuDevice mapGPUTransferBuffer: vertexTransferBuffer cycle: true.
	mappedAddress isNull ifTrue: [ SDL3Error signalFromLibraryErrorMessage ].

	vertices :=
		FFIExternalArray
			fromHandle: mappedAddress
			type: SDL3GPUVertex
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
			(SDL3GPUTransferBufferLocation new
				transferBuffer: vertexTransferBuffer;
				offset: 0;
				yourself)
		destination:
			(SDL3GPUBufferRegion new
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
	"Triangle 1: BL -> TR -> TL (Counter-Clockwise)"
	v := aVertexArray at: startIndex.
	v x: x; y: y - h; z: 0; u: 0; v: 1. "BL"
	v := aVertexArray at: startIndex + 1.
	v x: x + w; y: y; z: 0; u: 1; v: 0. "TR"
	v := aVertexArray at: startIndex + 2.
	v x: x; y: y; z: 0; u: 0; v: 0. "TL"
	
	"Triangle 2: BL -> BR -> TR (Counter-Clockwise)"
	v := aVertexArray at: startIndex + 3.
	v x: x; y: y - h; z: 0; u: 0; v: 1. "BL"
	v := aVertexArray at: startIndex + 4.
	v x: x + w; y: y - h; z: 0; u: 1; v: 1. "BR"
	v := aVertexArray at: startIndex + 5.
	v x: x + w; y: y; z: 0; u: 1; v: 0. "TR"
]
