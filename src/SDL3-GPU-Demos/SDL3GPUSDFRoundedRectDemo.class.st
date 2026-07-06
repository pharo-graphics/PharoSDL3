"
I demonstrate how to render SDF shapes.
"
Class {
	#name : 'SDL3GPUSDFRoundedRectDemo',
	#superclass : 'SDL3GPUDemoApp',
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
	#category : 'SDL3-GPU-Demos-SDF',
	#package : 'SDL3-GPU-Demos',
	#tag : 'SDF'
}

{ #category : 'lifecycle' }
SDL3GPUSDFRoundedRectDemo >> close [

	gpuPipeline ifNotNil: [
		gpuPipeline release.
		gpuPipeline := nil ].

	vertexTransferBuffer ifNotNil: [
		vertexTransferBuffer release.
		vertexTransferBuffer := nil ].

	indexTransferBuffer ifNotNil: [
		indexTransferBuffer release.
		indexTransferBuffer := nil ].

	vertexBuffer ifNotNil: [
		vertexBuffer release.
		vertexBuffer := nil ].

	indexBuffer ifNotNil: [
		indexBuffer release.
		indexBuffer := nil ].

	super close
]

{ #category : 'rendering' }
SDL3GPUSDFRoundedRectDemo >> doRenderPassesOn: swapchainTexture with: commandBuffer [

	| quadWidthPixels quadHeightPixels physicalExtent |

	colorTargetInfos first texture: swapchainTexture.

	"Calculate actual pixel dimensions of the quads based on window size and grid"
	physicalExtent := window pixelExtent.
	quadWidthPixels := physicalExtent x asFloat / columns.
	quadHeightPixels := physicalExtent y asFloat / rows.

	sdfUniforms
		dimX: quadWidthPixels;
		dimY: quadHeightPixels;
		cornerR1: cornerRadiiBase;
		cornerR2: cornerRadiiBase;
		cornerR3: cornerRadiiBase;
		cornerR4: cornerRadiiBase;
		radius: radius.

	commandBuffer
		pushFragmentUniform: sdfUniforms slot: 0.

	commandBuffer renderPassTargets: colorTargetInfos do: [ :renderPass |
		renderPass
			pipeline: gpuPipeline;
			vertexBuffers: vertexBufferBindings slot: 0;
			indexBuffer16Bit: indexBinding;
			drawIndexedPrimitives: self indicesCount
			instances: 1
			firstIndex: 0
			vertexOffset: 0
			firstInstance: 0 ]

]

{ #category : 'accessing' }
SDL3GPUSDFRoundedRectDemo >> indicesCount [

	^ numberOfQuads * 6
]

{ #category : 'initialization' }
SDL3GPUSDFRoundedRectDemo >> initialize [

	super initialize.

	numberOfQuads := 16.
	columns := 4.
	rows := 4.
	vertexBufferSize := 0.
	indexBufferSize := 0.
	cornerRadiiBase := 20.0.
	radius := 50.0.

	colorTargetInfos := SDL_GPUColorTargetInfo safeNewArray: 1.
	colorTargetInfos first
		beClear: (Color r: 0.1 g: 0.1 b: 0.1).

	vertexBufferBindings := FFIArray newType: SDL_GPUBufferBinding size: 1.

	indexBinding := SDL_GPUBufferBinding offset: 0.

	sdfUniforms := SDL3GPUSDFRoundedRectUniforms new.
	sdfUniforms
		shapeType: 1; "Rounded Rect"
		radius: radius;
		strokeSize: 5.0;
		fillColor: (SDL3FColor r: 0.2 g: 0.6 b: 1.0 a: 1.0);
		strokeColor: (SDL3FColor r: 1.0 g: 1.0 b: 1.0 a: 1.0);
		fillType: 0;
		dashCount: 0.0;
		fillColor2: (SDL3FColor r: 1.0 g: 0.2 b: 0.6 a: 1.0)
]

{ #category : 'initialization' }
SDL3GPUSDFRoundedRectDemo >> initializePipeline [

	| vertexShader fragmentShader vertexBindings vertexAttributes colorTargets |

	vertexShader := SDL3GPUQuadVertexShaderSource
						newShaderAmong: shaderFormats
						device: gpuDevice.
	fragmentShader := SDL3GPUSDFRoundedRectFragmentShaderSource
						 newShaderAmong: shaderFormats
						 device: gpuDevice.

	vertexBindings := self newSDFVertexBindings.
	vertexAttributes := self newSDFVertexAttributes.

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

	"We can free after pipeline was created"
	vertexShader release.

	fragmentShader release
]

{ #category : 'initialization' }
SDL3GPUSDFRoundedRectDemo >> newGPUResources [

	self updateVertexBuffer.
	self updateIndexBuffer.
	self initializePipeline
]

{ #category : 'private' }
SDL3GPUSDFRoundedRectDemo >> newQuadIndices [
	"Standard 16-bit index pattern for a quad:
	Vertices: 0:TL, 1:TR, 2:BR, 3:BL
	Triangles: (0,1,2) and (0,2,3)
	"

	^ #( 0 1 2 0 2 3 )
]

{ #category : 'private' }
SDL3GPUSDFRoundedRectDemo >> newSDFVertexAttributes [

	| vertexAttributes |
	vertexAttributes := SDL_GPUVertexAttribute safeNewArray: 2.

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
SDL3GPUSDFRoundedRectDemo >> newSDFVertexBindings [

	| vertexBindings |
	vertexBindings := SDL_GPUVertexBufferDescription safeNewArray: 1.

	vertexBindings first
		slot: 0;
		inputRate: SDL_GPU_VERTEXINPUTRATE_VERTEX;
		instanceStepRate: 0;
		pitch: SDL3GPUQuadVertex structureSize.

	^ vertexBindings
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
	self newGPUResources
]

{ #category : 'hooks' }
SDL3GPUSDFRoundedRectDemo >> step [

	self updateVertexBuffer.
	super step
]

{ #category : 'initialization' }
SDL3GPUSDFRoundedRectDemo >> updateIndexBuffer [

	| byteSize |
	byteSize := self indicesCount * 2. "16-bit indices"

	"1. Initialize buffer (or recreate if number of quads changed)"
	indexBufferSize = byteSize ifFalse: [
		indexBuffer ifNotNil: [
			indexBuffer release.
			indexTransferBuffer release ].

		indexTransferBuffer := gpuDevice newUploadTransferBuffer: byteSize.

		indexBuffer := gpuDevice
			               newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_INDEX
			               size: byteSize.

		indexBinding buffer: indexBuffer.
		indexBufferSize := byteSize ].

	"2. Upload new data"
	gpuDevice uploadToGPUDo: [ :uploader |
		uploader
			transferBuffer: indexTransferBuffer
			uploadTo: indexBuffer
			type: FFIUInt16
			count: self indicesCount
			cycle: true
			fillWith: [ :indices |
				1 to: numberOfQuads do: [ :i |
					| baseVertex baseIndex |
					baseVertex := (i - 1) * self numberOfVerticesPerQuad.
					baseIndex := (i - 1) * 6.
					1 to: 6 do: [ :j |
						indices
							at: baseIndex + j
							put: baseVertex + (self newQuadIndices at: j) ] ] ] ]
]

{ #category : 'initialization' }
SDL3GPUSDFRoundedRectDemo >> updateVertexBuffer [

	| byteSize cellW cellH padX padY quadW quadH |
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
			vertexBuffer release.
			vertexTransferBuffer release ].

		vertexTransferBuffer := gpuDevice newUploadTransferBuffer: byteSize.

		vertexBuffer := gpuDevice
			               newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX
			               size: byteSize.

		vertexBufferBindings first buffer: vertexBuffer.
		vertexBufferSize := byteSize ].

	"3. Upload new data (Using CYCLE: TRUE for animation)"
	gpuDevice uploadToGPUDo: [ :uploader |
		uploader
			transferBuffer: vertexTransferBuffer
			uploadTo: vertexBuffer
			type: SDL3GPUQuadVertex
			count: self verticesCount
			cycle: true
			fillWith: [ :vertices |
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
						h: quadH ] ] ]
]

{ #category : 'accessing' }
SDL3GPUSDFRoundedRectDemo >> updatedTitle [

	^ super updatedTitle, (' - Count: {1} (UP/DOWN rows/cols) - Radius: {2} (LEFT/RIGHT) - SPACE: Shape - F: Fill - D: Dashes'
		format: {
			numberOfQuads.
			cornerRadiiBase })
]

{ #category : 'accessing' }
SDL3GPUSDFRoundedRectDemo >> verticesCount [

	^ self numberOfVerticesPerQuad * numberOfQuads
]

{ #category : 'hooks' }
SDL3GPUSDFRoundedRectDemo >> visitKeyboardDownEvent: aKeyboardDownEvent [

	super visitKeyboardDownEvent: aKeyboardDownEvent.

	aKeyboardDownEvent key = SDLK_SPACE asInteger ifTrue: [
		sdfUniforms shapeType: (sdfUniforms shapeType = 0 ifTrue: [ 1 ] ifFalse: [ 0 ]) ].
	aKeyboardDownEvent key = SDLK_F asInteger ifTrue: [
		sdfUniforms fillType: (sdfUniforms fillType + 1) \\ 3 ].
	aKeyboardDownEvent key = SDLK_D asInteger ifTrue: [
		sdfUniforms dashCount: (sdfUniforms dashCount > 0.0 ifTrue: [ 0.0 ] ifFalse: [ 16.0 ]) ].
	aKeyboardDownEvent key = SDLK_UP asInteger ifTrue: [
		columns := columns + 1. rows := rows + 1.
		numberOfQuads := columns * rows.
		self updateIndexBuffer ].
	aKeyboardDownEvent key = SDLK_DOWN asInteger ifTrue: [
		columns := (columns - 1) max: 1. rows := (rows - 1) max: 1.
		numberOfQuads := columns * rows.
		self updateIndexBuffer ].
	aKeyboardDownEvent key = SDLK_LEFT asInteger ifTrue: [
		cornerRadiiBase := (cornerRadiiBase - 2.0) max: 0.0.
		radius := (radius - 2.0) max: 0.0 ].
	aKeyboardDownEvent key = SDLK_RIGHT asInteger ifTrue: [
		cornerRadiiBase := (cornerRadiiBase + 2.0) min: 200.0.
		radius := (radius + 2.0) min: 200.0 ].

	self updateTitle
]

{ #category : 'private' }
SDL3GPUSDFRoundedRectDemo >> writeQuadTo: aVertexArray at: startIndex x: x y: y w: w h: h [

	| v |
	"Vertices (NDC): y increases UPWARDS.
	UVs: y increases DOWNWARDS.

	0: TL: x, y	   UV: 0, 0
	1: TR: x+w, y	 UV: 1, 0
	2: BR: x+w, y-h   UV: 1, 1
	3: BL: x, y-h	 UV: 0, 1
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
	v x: x; y: y - h; z: 0; u: 0; v: 1
]
