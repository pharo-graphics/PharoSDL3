"
I demonstrate how to render textured quads using the SDL3 GPU API.
I use vertex and fragment shaders defined in Pharo.
"
Class {
	#name : 'SDL3GPUQuadDemoApp',
	#superclass : 'SDL3GPUDemoApp',
	#instVars : [
		'numberOfQuads',
		'filter',
		'vertexBufferSize',
		'indexBufferSize',
		'pipeline',
		'vertexBuffer',
		'indexBuffer',
		'texture',
		'sampler',
		'vertexTransferBuffer',
		'indexTransferBuffer',
		'colorTargetInfos',
		'indexBinding',
		'vertexBufferBindings',
		'textureSamplerBindings'
	],
	#category : 'SDL3-GPU-Demos-Base',
	#package : 'SDL3-GPU-Demos',
	#tag : 'Base'
}

{ #category : 'actions' }
SDL3GPUQuadDemoApp >> decrementQuads [

	numberOfQuads := (numberOfQuads - 1) max: 1.
	self updateVertexBuffer.
	self updateIndexBuffer.
	self updateTitle
]

{ #category : 'rendering' }
SDL3GPUQuadDemoApp >> doRenderPassesOn: swapchainTexture with: commandBuffer [

	| animatedHue |
	colorTargetInfos first texture: swapchainTexture.

	"Animate background hue to show blending"
	animatedHue := (Time millisecondClockValue / 20.0) \\ 360.
	colorTargetInfos first clearColor updateFrom: (Color h: animatedHue s: 0.8 v: 0.3).

	commandBuffer renderPassTargets: colorTargetInfos do: [ :renderPass |
		renderPass
			pipeline: pipeline;
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
SDL3GPUQuadDemoApp >> incrementQuads [

	numberOfQuads := numberOfQuads + 1.
	self updateVertexBuffer.
	self updateIndexBuffer.
	self updateTitle
]

{ #category : 'accessing' }
SDL3GPUQuadDemoApp >> indicesCount [

	^ numberOfQuads * 6
]

{ #category : 'accessing' }
SDL3GPUQuadDemoApp >> initialExtent [

	^ 720 @ 720
]

{ #category : 'accessing' }
SDL3GPUQuadDemoApp >> initialWindowFlags [

	^ SDL_WINDOW_INPUT_FOCUS | SDL_WINDOW_HIGH_PIXEL_DENSITY
]

{ #category : 'initialization' }
SDL3GPUQuadDemoApp >> initialize [

	super initialize.

	filter := SDL_GPU_FILTER_NEAREST.
	numberOfQuads := 36.
	vertexBufferSize := 0.
	indexBufferSize := 0
]

{ #category : 'initialization' }
SDL3GPUQuadDemoApp >> initializeGPUResources [

	self initializeTexture.
	self updateVertexBuffer.
	self updateIndexBuffer.
	self initializePipeline.
	self switchSamplerFilter
]

{ #category : 'initialization' }
SDL3GPUQuadDemoApp >> initializePipeline [

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
SDL3GPUQuadDemoApp >> initializeTexture [

	DiScope own:
		(texture :=
			gpuDevice
				unownedNewGPUTextureUploadingForm: (self iconNamed: #remote)
				usage: SDL_GPU_TEXTUREUSAGE_SAMPLER).

	textureSamplerBindings first texture: texture
]

{ #category : 'testing' }
SDL3GPUQuadDemoApp >> isNearestSamplerFilter [

	^ filter = SDL_GPU_FILTER_NEAREST
]

{ #category : 'accessing' }
SDL3GPUQuadDemoApp >> numberOfVerticesPerQuad [

	^ 4
]

{ #category : 'private' }
SDL3GPUQuadDemoApp >> quadIndices [
	"Standard index pattern for a quad:
	Vertices: 0:TL, 1:TR, 2:BR, 3:BL
	Triangles: (0,1,2) and (0,2,3)"

	^ #(0 1 2 0 2 3)
]

{ #category : 'lifecycle' }
SDL3GPUQuadDemoApp >> setUp [
	"Run headless with:
	./pharo Pharo.image eval 'SDL3GPUQuadDemoApp new run'
	"

	super setUp.
	DiScope own: (colorTargetInfos := SDL3Array unownedNewType: SDL_GPUColorTargetInfo size: 1).
	colorTargetInfos first beClear: Color black.
	DiScope own: (indexBinding := SDL_GPUBufferBinding unownedNew
		beOffset: 0;
		yourself).
	DiScope own: (vertexBufferBindings := SDL3Array unownedNewType: SDL_GPUBufferBinding size: 1).
	DiScope own: (textureSamplerBindings := SDL3Array unownedNewType: SDL_GPUTextureSamplerBinding size: 1).

	self initializeGPUResources
]

{ #category : 'hooks' }
SDL3GPUQuadDemoApp >> step [

	self updateVertexBuffer.
	super step
]

{ #category : 'initialization' }
SDL3GPUQuadDemoApp >> switchSamplerFilter [
	"If needed, switch to the other filter and dispose current sampler"

	sampler ifNotNil: [
		sampler dispose.
		filter := self isNearestSamplerFilter
			ifTrue: [ SDL_GPU_FILTER_LINEAR ]
			ifFalse: [ SDL_GPU_FILTER_NEAREST ] ].

	sampler := gpuDevice unownedNewGPUSampler: [ :info |
		info
			minFilter: filter;
			magFilter: filter;
			mipmapMode: filter;
			addressModeU: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE;
			addressModeV: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE;
			addressModeW: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE ].
	DiScope own: sampler.

	textureSamplerBindings first sampler: sampler.

	self updateTitle
]

{ #category : 'initialization' }
SDL3GPUQuadDemoApp >> updateIndexBuffer [

	| byteSize |
	byteSize := self indicesCount * 2. "16-bit indices"

	"1. Initialize buffer (or recreate if number of quads changed)"
	indexBufferSize = byteSize ifFalse: [
		indexTransferBuffer ifNotNil: [ indexTransferBuffer dispose ].
		indexBuffer ifNotNil: [ indexBuffer dispose ].
		DiScope own: (indexTransferBuffer := gpuDevice unownedNewGPUUploadTransferBuffer: byteSize).
		DiScope own: (indexBuffer := gpuDevice unownedNewGPUBufferUsage: SDL_GPU_BUFFERUSAGE_INDEX size: byteSize).
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
SDL3GPUQuadDemoApp >> updateVertexBuffer [

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
		vertexTransferBuffer ifNotNil: [ vertexTransferBuffer dispose ].
		vertexBuffer ifNotNil: [ vertexBuffer dispose ].
		DiScope own: (vertexTransferBuffer := gpuDevice unownedNewGPUUploadTransferBuffer: byteSize).
		DiScope own: (vertexBuffer := gpuDevice unownedNewGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX size: byteSize).
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
SDL3GPUQuadDemoApp >> updatedTitle [

	^ super updatedTitle,
		(' - Count: {1} (UP/DOWN to change) - Filter: {2} (F to switch)'
			format: {
				numberOfQuads.
				self isNearestSamplerFilter ifTrue: [ 'NEAREST' ] ifFalse: [ 'LINEAR' ] })
]

{ #category : 'accessing' }
SDL3GPUQuadDemoApp >> verticesCount [

	^ self numberOfVerticesPerQuad * numberOfQuads
]

{ #category : 'hooks' }
SDL3GPUQuadDemoApp >> visitKeyboardDownEvent: aKeyboardDownEvent [

	super visitKeyboardDownEvent: aKeyboardDownEvent.

	aKeyboardDownEvent key = SDLK_F asInteger ifTrue: [
		self switchSamplerFilter ].
	aKeyboardDownEvent key = SDLK_UP asInteger ifTrue: [
		self incrementQuads ].
	aKeyboardDownEvent key = SDLK_DOWN asInteger ifTrue: [
		self decrementQuads ]
]

{ #category : 'private' }
SDL3GPUQuadDemoApp >> writeQuadTo: aVertexArray at: startIndex x: x y: y w: w h: h [

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
