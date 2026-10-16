"
I demonstrate how to render textured quads using the SDL3 GPU API and instanced rendering.
"
Class {
	#name : 'SDL3GPUInstancedQuadDemoApp',
	#superclass : 'SDL3GPUDemoApp',
	#instVars : [
		'numberOfQuads',
		'filter',
		'uniforms',
		'columns',
		'rows',
		'enableRotation',
		'enableScale',
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
SDL3GPUInstancedQuadDemoApp >> decrementQuads [

	columns := (columns - 1) max: 1.
	rows := (rows - 1) max: 1.
	numberOfQuads := columns * rows.
	self updateTitle
]

{ #category : 'rendering' }
SDL3GPUInstancedQuadDemoApp >> doRenderPassesOn: swapchainTexture with: commandBuffer [

	colorTargetInfos first texture: swapchainTexture.

	commandBuffer renderPassTargets: colorTargetInfos do: [ :renderPass |
		renderPass
			pipeline: pipeline;
			vertexBuffers: vertexBufferBindings slot: 0;
			indexBuffer16Bit: indexBinding;
			fragmentSamplers: textureSamplerBindings slot: 0.

		uniforms
			time: Time millisecondClockValue / 1000.0;
			enableRotation: enableRotation;
			enableScale: enableScale;
			numCols: columns;
			numRows: rows.

		commandBuffer
			pushVertexUniform: uniforms slot: 0.

		renderPass
			drawIndexedPrimitives: 6
			instances: numberOfQuads
			firstIndex: 0
			vertexOffset: 0
			firstInstance: 0 ]
]

{ #category : 'actions' }
SDL3GPUInstancedQuadDemoApp >> incrementQuads [

	columns := columns + 1.
	rows := rows + 1.
	numberOfQuads := columns * rows.
	self updateTitle
]

{ #category : 'accessing' }
SDL3GPUInstancedQuadDemoApp >> initialExtent [

	^ 800 @ 600
]

{ #category : 'initialization' }
SDL3GPUInstancedQuadDemoApp >> initialize [

	super initialize.

	filter := SDL_GPU_FILTER_NEAREST.
	columns := 6.
	rows := 6.
	numberOfQuads := columns * rows.

	enableRotation := 1.0.
	enableScale := 1.0.

	uniforms := SDL3GPUInstancedQuadUniforms new
]

{ #category : 'initialization' }
SDL3GPUInstancedQuadDemoApp >> initializeGPUResources [

	self initializeTexture.
	self updateVertexBuffer.
	self updateIndexBuffer.
	self initializePipeline.
	self switchSamplerFilter
]

{ #category : 'initialization' }
SDL3GPUInstancedQuadDemoApp >> initializePipeline [

	pipeline := gpuDevice newGraphicsPipelineBuilder
		vertexShader: SDL3GPUInstancedQuadVertexShaderSource;
		fragmentShader: SDL3GPUQuadFragmentShaderSource;
		addVertexBufferFor: SDL3GPUQuadVertex;
		targetWindow: window;
		enableAlphaBlending;
		unownedNewPipeline.
	DiScope own: pipeline
]

{ #category : 'initialization' }
SDL3GPUInstancedQuadDemoApp >> initializeTexture [

	DiScope own:
		(texture :=
			gpuDevice
				unownedNewGPUTextureUploadingForm: (self iconNamed: #remote)
				usage: SDL_GPU_TEXTUREUSAGE_SAMPLER).

	textureSamplerBindings first texture: texture
]

{ #category : 'testing' }
SDL3GPUInstancedQuadDemoApp >> isNearestSamplerFilter [

	^ filter = SDL_GPU_FILTER_NEAREST
]

{ #category : 'private' }
SDL3GPUInstancedQuadDemoApp >> quadIndices [
	"Standard index pattern for a quad:
	Vertices: 0:TL, 1:TR, 2:BR, 3:BL
	Triangles: (0,1,2) and (0,2,3)"

	^ #(0 1 2 0 2 3)
]

{ #category : 'lifecycle' }
SDL3GPUInstancedQuadDemoApp >> setUp [

	super setUp.
	DiScope own: (colorTargetInfos := SDL3Array unownedNewType: SDL_GPUColorTargetInfo size: 1).
	colorTargetInfos first beClear: (Color r: 0.1 g: 0.1 b: 0.1).
	DiScope own: (indexBinding := SDL_GPUBufferBinding unownedNew
		beOffset: 0;
		yourself).
	DiScope own: (vertexBufferBindings := SDL3Array unownedNewType: SDL_GPUBufferBinding size: 1).
	DiScope own: (textureSamplerBindings := SDL3Array unownedNewType: SDL_GPUTextureSamplerBinding size: 1).

	self initializeGPUResources
]

{ #category : 'initialization' }
SDL3GPUInstancedQuadDemoApp >> switchSamplerFilter [
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

	textureSamplerBindings first sampler: sampler
]

{ #category : 'initialization' }
SDL3GPUInstancedQuadDemoApp >> updateIndexBuffer [

	| byteSize |
	byteSize := 6 * 2. "16-bit indices, 6 indices per quad"

	indexTransferBuffer := gpuDevice unownedNewGPUUploadTransferBuffer: byteSize.
	indexBuffer := gpuDevice
		               unownedNewGPUBufferUsage: SDL_GPU_BUFFERUSAGE_INDEX
		               size: byteSize.
	DiScope own: indexBuffer.

	indexBinding buffer: indexBuffer.

	gpuDevice uploadToGPUDo: [ :uploader |
		uploader
			transferBuffer: indexTransferBuffer
			uploadTo: indexBuffer
			type: FFIUInt16
			count: 6
			cycle: true
			fillWith: [ :indices |
				1 to: 6 do: [ :j |
					indices at: j put: (self quadIndices at: j) ] ] ].

	indexTransferBuffer dispose.
	indexTransferBuffer := nil
]

{ #category : 'initialization' }
SDL3GPUInstancedQuadDemoApp >> updateVertexBuffer [

	| byteSize |
	byteSize := SDL3GPUQuadVertex structureSize * 4.

	vertexTransferBuffer := gpuDevice unownedNewGPUUploadTransferBuffer: byteSize.
	vertexBuffer := gpuDevice
		               unownedNewGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX
		               size: byteSize.
	DiScope own: vertexBuffer.

	vertexBufferBindings first buffer: vertexBuffer.

	gpuDevice uploadToGPUDo: [ :uploader |
		uploader
			transferBuffer: vertexTransferBuffer
			uploadTo: vertexBuffer
			type: SDL3GPUQuadVertex
			count: 4
			cycle: true
			fillWith: [ :vertices |
				"Write a single base quad from 0..1 in x and 0..-1 in y"
				vertices first  x: 0; y:  0; z: 0; u: 0; v: 0.
				vertices second x: 1; y:  0; z: 0; u: 1; v: 0.
				vertices third  x: 1; y: -1; z: 0; u: 1; v: 1.
				vertices fourth x: 0; y: -1; z: 0; u: 0; v: 1 ] ].

	vertexTransferBuffer dispose.
	vertexTransferBuffer := nil
]

{ #category : 'accessing' }
SDL3GPUInstancedQuadDemoApp >> updatedTitle [

	^ super updatedTitle,
		(' - Count: {1} (UP/DOWN) - Filter: {2} (F) - Rot: {3} (R) - Scale: {4} (S)'
			format: {
				numberOfQuads.
				self isNearestSamplerFilter ifTrue: [ 'NEAREST' ] ifFalse: [ 'LINEAR' ].
				enableRotation > 0.5 ifTrue: ['ON'] ifFalse: ['OFF'].
				enableScale > 0.5 ifTrue: ['ON'] ifFalse: ['OFF'] })
]

{ #category : 'hooks' }
SDL3GPUInstancedQuadDemoApp >> visitKeyboardDownEvent: aKeyboardDownEvent [

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
