"
I demonstrate how to render textured quads using the SDL3 GPU API.
I use vertex and fragment shaders defined in Pharo.
"
Class {
	#name : 'SDL3GPUQuadDemo',
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
		'vertexBufferSize',
		'indexBuffer',
		'indexBufferSize',
		'indexTransferBuffer',
		'indexBinding'
	],
	#category : 'SDL3-GPU-Demos-SimpleQuads',
	#package : 'SDL3-GPU-Demos',
	#tag : 'SimpleQuads'
}

{ #category : 'lifecycle' }
SDL3GPUQuadDemo >> close [

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

	sampler ifNotNil: [
		sampler release.
		sampler := nil ].

	texture ifNotNil: [
		texture release.
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
SDL3GPUQuadDemo >> doRenderPassesOn: swapchainTexture with: commandBuffer [

	| animatedHue |
	colorTargetInfos first texture: swapchainTexture.

	"Animate background hue to show blending"
	animatedHue := (Time millisecondClockValue / 20.0) \\ 360.
	colorTargetInfos first clearColor updateFrom: (Color h: animatedHue s: 0.8 v: 0.3).

	commandBuffer renderPassTargets: colorTargetInfos do: [ :renderPass |
		renderPass
			pipeline: gpuPipeline;
			vertexBuffers: vertexBufferBindings slot: 0;
			indexBuffer16Bit: indexBinding;
			fragmentSamplers: textureSamplerBindings slot: 0;
			drawIndexedPrimitives: self indicesCount
			instances: 1
			firstIndex: 0
			vertexOffset: 0
			firstInstance: 0 ]
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

{ #category : 'accessing' }
SDL3GPUQuadDemo >> initialExtent [

	^ 720 @ 720
]

{ #category : 'accessing' }
SDL3GPUQuadDemo >> initialWindowFlags [

	^ SDL_WINDOW_INPUT_FOCUS | SDL_WINDOW_HIGH_PIXEL_DENSITY
]

{ #category : 'initialization' }
SDL3GPUQuadDemo >> initialize [

	super initialize.

	filter := SDL_GPU_FILTER_NEAREST.
	numberOfQuads := 36.
	vertexBufferSize := 0.
	indexBufferSize := 0.

	colorTargetInfos := SDL_GPUColorTargetInfo safeNewArray: 1.
	colorTargetInfos first
		beClear: Color black.

	vertexBufferBindings := FFIArray newType: SDL_GPUBufferBinding size: 1.

	textureSamplerBindings := FFIArray newType: SDL_GPUTextureSamplerBinding size: 1.

	indexBinding := SDL_GPUBufferBinding offset: 0
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

	| vertexShader fragmentShader vertexBindings vertexAttributes colorTargets |
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
		blendState: SDL_GPUColorTargetBlendState newAlphaBlend.
	gpuPipeline := gpuDevice newGraphicsPipeline: [ :info |
		info
			primitiveType: SDL_GPU_PRIMITIVETYPE_TRIANGLELIST;
			vertexShader: vertexShader;
			fragmentShader: fragmentShader.
		info targetInfo
			colorTargetDescriptions: colorTargets;
			numColorTargets: colorTargets size.
		info vertexInputState
			vertexBufferDescriptions: vertexBindings;
			numVertexBuffers: vertexBindings size;
			vertexAttributes: vertexAttributes;
			numVertexAttributes: vertexAttributes size ].

	"We can free after pipeline was created"
	vertexShader release.
	fragmentShader release.
	vertexBindings free.
	vertexAttributes free.
	colorTargets free
]

{ #category : 'initialization' }
SDL3GPUQuadDemo >> initializeTexture [

	texture :=
		gpuDevice
			newGPUTextureUploadingForm: (self iconNamed: #remote)
			usage: SDL_GPU_TEXTUREUSAGE_SAMPLER.

	textureSamplerBindings first texture: texture
]

{ #category : 'testing' }
SDL3GPUQuadDemo >> isNearestSamplerFilter [

	^ filter = SDL_GPU_FILTER_NEAREST
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
	self initializeGPUResources
]

{ #category : 'private' }
SDL3GPUQuadDemo >> quadIndices [
	"Standard index pattern for a quad:
	Vertices: 0:TL, 1:TR, 2:BR, 3:BL
	Triangles: (0,1,2) and (0,2,3)"

	^ #(0 1 2 0 2 3)
]

{ #category : 'hooks' }
SDL3GPUQuadDemo >> step [

	self updateVertexBuffer.
	super step
]

{ #category : 'initialization' }
SDL3GPUQuadDemo >> switchSamplerFilter [

	"If needed, switch to the other filter and release current sampler"
	sampler ifNotNil: [
		filter :=
			self isNearestSamplerFilter
				ifTrue: [ SDL_GPU_FILTER_LINEAR ]
				ifFalse: [ SDL_GPU_FILTER_NEAREST ].
		sampler release ].

	sampler := gpuDevice newSampler: [ :info |
		info
			minFilter: filter;
			magFilter: filter;
			mipmapMode: filter;
			addressModeU: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE;
			addressModeV: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE;
			addressModeW: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE ].

			textureSamplerBindings first sampler: sampler
.

	self updateTitle
]

{ #category : 'initialization' }
SDL3GPUQuadDemo >> updateIndexBuffer [

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
							put: baseVertex + (self quadIndices at: j) ] ] ] ]
]

{ #category : 'initialization' }
SDL3GPUQuadDemo >> updateVertexBuffer [

	| byteSize cols rows quadW quadH phase zoom |
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
						h: quadH ] ] ]
]

{ #category : 'accessing' }
SDL3GPUQuadDemo >> updatedTitle [

	^ super updatedTitle,
		(' - Count: {1} (UP/DOWN to change) - Filter: {2} (F to switch)'
			format: {
				numberOfQuads.
				self isNearestSamplerFilter ifTrue: [ 'NEAREST' ] ifFalse: [ 'LINEAR' ] })
]

{ #category : 'accessing' }
SDL3GPUQuadDemo >> verticesCount [

	^ self numberOfVerticesPerQuad * numberOfQuads
]

{ #category : 'hooks' }
SDL3GPUQuadDemo >> visitKeyboardDownEvent: aKeyboardDownEvent [

	super visitKeyboardDownEvent: aKeyboardDownEvent.

	aKeyboardDownEvent key = SDLK_F asInteger ifTrue: [
		self switchSamplerFilter ].
	aKeyboardDownEvent key = SDLK_UP asInteger ifTrue: [
		self incrementQuads ].
	aKeyboardDownEvent key = SDLK_DOWN asInteger ifTrue: [
		self decrementQuads ]
]

{ #category : 'private' }
SDL3GPUQuadDemo >> writeQuadTo: aVertexArray at: startIndex x: x y: y w: w h: h [

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
