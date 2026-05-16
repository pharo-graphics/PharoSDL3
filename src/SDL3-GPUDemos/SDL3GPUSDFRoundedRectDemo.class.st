"
I demonstrate how to render SDF shapes.
"
Class {
	#name : 'SDL3GPUSDFRoundedRectDemo',
	#superclass : 'SDL3GPUClearDemo',
	#instVars : [
		'gpuPipeline',
		'vertexBuffer',
		'colorTargetInfos',
		'vertexBufferBindings',
		'numberOfQuads',
		'vertexTransferBuffer',
		'vertexBufferSize',
		'indexBuffer',
		'indexBufferSize',
		'indexTransferBuffer',
		'indexBinding',
		'sdfUniforms',
		'columns',
		'rows',
		'cornerRadiiBase',
		'radius'
	],
	#category : 'SDL3-GPUDemos-SDF',
	#package : 'SDL3-GPUDemos',
	#tag : 'SDF'
}

{ #category : 'lifecycle' }
SDL3GPUSDFRoundedRectDemo >> close [

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

	super close
]

{ #category : 'rendering' }
SDL3GPUSDFRoundedRectDemo >> doRenderPassesOn: swapchainTexture with: aCommandBuffer [

	| renderPass quadWidthPixels quadHeightPixels |
	colorTargetInfos first texture: swapchainTexture.

	"Calculate actual pixel dimensions of the quads based on window size and grid"
	quadWidthPixels := window width asFloat / columns.
	quadHeightPixels := window height asFloat / rows.

	sdfUniforms
		dimX: quadWidthPixels;
		dimY: quadHeightPixels;
		cornerR1: cornerRadiiBase;
		cornerR2: cornerRadiiBase;
		cornerR3: cornerRadiiBase;
		cornerR4: cornerRadiiBase;
		radius: radius.

	aCommandBuffer
		pushGPUFragmentUniformDataSlotIndex: 0
		data: sdfUniforms
		length: sdfUniforms class structureSize.

	renderPass :=
		aCommandBuffer
			beginGPURenderPassColorTargetInfos: colorTargetInfos
			numColorTargets: colorTargetInfos size
			depthStencilTargetInfo: nil.
	renderPass assertNotNullReturn.

	renderPass bindGPUGraphicsPipeline: gpuPipeline.
	
	renderPass
		bindGPUVertexBuffersFirstSlot: 0
		bindings: vertexBufferBindings
		numBindings: vertexBufferBindings size.

	renderPass
		bindGPUIndexBufferBinding: indexBinding
		indexElementSize: SDL_GPU_INDEXELEMENTSIZE_16BIT.

	renderPass
		drawGPUIndexedPrimitivesNumIndices: self indicesCount
		numInstances: 1
		firstIndex: 0
		vertexOffset: 0
		firstInstance: 0.

	renderPass end
]

{ #category : 'accessing' }
SDL3GPUSDFRoundedRectDemo >> indicesCount [

	^ numberOfQuads * 6
]

{ #category : 'initialization' }
SDL3GPUSDFRoundedRectDemo >> initialize [

	super initialize.

	initialExtent := 800 @ 600.
	initialWindowFlags := SDL3WindowFlags inputFocus | SDL3WindowFlags highPixelDensity | SDL3WindowFlags resizable.

	numberOfQuads := 16.
	columns := 4.
	rows := 4.
	vertexBufferSize := 0.
	indexBufferSize := 0.
	cornerRadiiBase := 20.0.
	radius := 50.0.

	colorTargetInfos := FFIArray newType: SDL_GPUColorTargetInfo size: 1.
	colorTargetInfos first
		storeOp: SDL_GPU_STOREOP_STORE;
		loadOp: SDL_GPU_LOADOP_CLEAR.
	colorTargetInfos first clearColor r: 0.1; g: 0.1; b: 0.1; a: 1.0.

	vertexBufferBindings := FFIArray newType: SDL_GPUBufferBinding size: 1.

	indexBinding := SDL_GPUBufferBinding externalNew.
	indexBinding autoRelease.

	sdfUniforms := SDL3GPUSDFRoundedRectUniforms new.
	sdfUniforms
		shapeType: 1; "Rounded Rect"
		radius: radius;
		strokeSize: 5.0;
		fillColor: (SDL3FColor r: 0.2 g: 0.6 b: 1.0 a: 1.0);
		strokeColor: (SDL3FColor r: 1.0 g: 1.0 b: 1.0 a: 1.0);
		fillType: 0;
		dashCount: 0.0;
		fillColor2: (SDL3FColor r: 1.0 g: 0.2 b: 0.6 a: 1.0).
]

{ #category : 'initialization' }
SDL3GPUSDFRoundedRectDemo >> initializeGPUResources [

	self updateVertexBuffer.
	self updateIndexBuffer.
	self initializePipeline
]

{ #category : 'initialization' }
SDL3GPUSDFRoundedRectDemo >> initializePipeline [

	| vertexShader fragmentShader vertexBindings vertexAttributes colorTargets pipelineCreateInfo |
	vertexShader :=
		SDL3GPUQuadVertexShaderSource
			newShaderAmong: shaderFormats
			device: gpuDevice.
	fragmentShader :=
		SDL3GPUSDFRoundedRectFragmentShaderSource
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

{ #category : 'running' }
SDL3GPUSDFRoundedRectDemo >> iterateUntilQuit [

	| quit |
	quit := false.

	[ quit ] whileFalse: [
		self pollEventsDo: [ :evt |
			evt type = SDL_EVENT_QUIT ifTrue: [ quit := true ].
			evt type = SDL_EVENT_KEY_DOWN ifTrue: [
				evt key = SDLK_ESCAPE asInteger ifTrue: [ quit := true ].

				evt key = SDLK_SPACE asInteger ifTrue: [
					sdfUniforms shapeType: (sdfUniforms shapeType = 0 ifTrue: [ 1 ] ifFalse: [ 0 ]).
					self updateTitle ].
				evt key = SDLK_F asInteger ifTrue: [
					sdfUniforms fillType: (sdfUniforms fillType + 1) \\ 3.
					self updateTitle ].
				evt key = SDLK_D asInteger ifTrue: [
					sdfUniforms dashCount: (sdfUniforms dashCount > 0.0 ifTrue: [ 0.0 ] ifFalse: [ 16.0 ]).
					self updateTitle ].
				evt key = SDLK_UP asInteger ifTrue: [
					columns := columns + 1. rows := rows + 1.
					numberOfQuads := columns * rows.
					self updateIndexBuffer.
					self updateTitle ].
				evt key = SDLK_DOWN asInteger ifTrue: [
					columns := (columns - 1) max: 1. rows := (rows - 1) max: 1.
					numberOfQuads := columns * rows.
					self updateIndexBuffer.
					self updateTitle ].
				evt key = SDLK_LEFT asInteger ifTrue: [
					cornerRadiiBase := (cornerRadiiBase - 2.0) max: 0.0.
					radius := (radius - 2.0) max: 0.0.
					self updateTitle ].
				evt key = SDLK_RIGHT asInteger ifTrue: [
					cornerRadiiBase := (cornerRadiiBase + 2.0) min: 200.0.
					radius := (radius + 2.0) min: 200.0.
					self updateTitle ]
			] ].

		self render.

		16.6 milliSeconds wait ]
]

{ #category : 'accessing' }
SDL3GPUSDFRoundedRectDemo >> numberOfVerticesPerQuad [

	^ 4
]

{ #category : 'lifecycle' }
SDL3GPUSDFRoundedRectDemo >> open [
	"Run headless with:
	./pharo Pharo.image eval 'SDL3GPUSDFRoundedRectDemo new run'
	"

	super open.
	self updateTitle.
	self initializeGPUResources
]

{ #category : 'private' }
SDL3GPUSDFRoundedRectDemo >> quadIndices [
	"Standard 16-bit index pattern for a quad:
	Vertices: 0:TL, 1:TR, 2:BR, 3:BL
	Triangles: (0,1,2) and (0,2,3)
	"
	^ #(0 1 2 0 2 3)
]

{ #category : 'rendering' }
SDL3GPUSDFRoundedRectDemo >> render [

	self updateVertexBuffer.
	super render
]

{ #category : 'initialization' }
SDL3GPUSDFRoundedRectDemo >> updateIndexBuffer [

	| mappedAddress indices byteSize commandBuffer |
	
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

		indexBinding buffer: indexBuffer.
		indexBufferSize := byteSize ].

	"2. Upload new data"
	mappedAddress := gpuDevice mapGPUTransferBuffer: indexTransferBuffer cycle: true.
	mappedAddress isNull ifTrue: [ SDL3Error signalFromLibraryErrorMessage ].

	indices := FFIArray fromHandle: mappedAddress type: FFIUInt16 size: self indicesCount.
	
	1 to: numberOfQuads do: [ :i |
		| baseVertex baseIndex |
		baseVertex := (i - 1) * self numberOfVerticesPerQuad.
		baseIndex := (i - 1) * 6.
		1 to: 6 do: [ :j |
			indices at: baseIndex + j put: baseVertex + (self quadIndices at: j) ] ].

	gpuDevice unmapGPUTransferBuffer: indexTransferBuffer.

	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer assertNotNullReturn.
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
	sdl assertSuccess: commandBuffer submit
]

{ #category : 'actions' }
SDL3GPUSDFRoundedRectDemo >> updateTitle [

	window title: ('SDF Shapes: {1} (UP/DOWN rows/cols) - Radius: {2} (LEFT/RIGHT) - SPACE: Shape - F: Fill - D: Dashes'
		format: {
			numberOfQuads.
			cornerRadiiBase })
]

{ #category : 'initialization' }
SDL3GPUSDFRoundedRectDemo >> updateVertexBuffer [

	| mappedAddress vertices byteSize commandBuffer quadW quadH padX padY cellW cellH |
	
	cellW := 2.0 / columns.
	cellH := 2.0 / rows.
	
	padX := cellW * 0.1.
	padY := cellH * 0.1.
	
	quadW := cellW - padX.
	quadH := cellH - padY.
	
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

		vertexBufferBindings first buffer: vertexBuffer.
		vertexBufferSize := byteSize ].

	"3. Upload new data (Using CYCLE: TRUE for animation)"
	mappedAddress := gpuDevice mapGPUTransferBuffer: vertexTransferBuffer cycle: true.
	mappedAddress isNull ifTrue: [ SDL3Error signalFromLibraryErrorMessage ].

	vertices :=
		FFIArray
			fromHandle: mappedAddress
			type: SDL3GPUQuadVertex
			size: self verticesCount.
	
	1 to: numberOfQuads do: [ :i |
		| col row x y |
		row := (i - 1) // columns + 1.
		col := (i - 1) \\ columns + 1.
		x := -1.0 + (padX * 0.5) + ((col - 1) * cellW).
		y := 1.0 - (padY * 0.5) - ((row - 1) * cellH).
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
	sdl assertSuccess: commandBuffer submit
]

{ #category : 'accessing' }
SDL3GPUSDFRoundedRectDemo >> verticesCount [

	^ self numberOfVerticesPerQuad * numberOfQuads
]

{ #category : 'private' }
SDL3GPUSDFRoundedRectDemo >> writeQuadTo: aVertexArray at: startIndex x: x y: y w: w h: h [

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
