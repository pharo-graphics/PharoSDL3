"
I demonstrate how to render textured quads using the SDL3 GPU API and instanced rendering.
"
Class {
	#name : 'SDL3GPUInstancedQuadDemoApp',
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
	#category : 'SDL3-GPU-Demos-InstancedQuads',
	#package : 'SDL3-GPU-Demos',
	#tag : 'InstancedQuads'
}

{ #category : 'lifecycle' }
SDL3GPUInstancedQuadDemoApp >> close [

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
			pipeline: gpuPipeline;
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

	colorTargetInfos := SDL_GPUColorTargetInfo safeNewArray: 1.
	colorTargetInfos first
		beClear: (Color r: 0.1 g: 0.1 b: 0.1).

	vertexBufferBindings := FFIArray newType: SDL_GPUBufferBinding size: 1.

	textureSamplerBindings := FFIArray newType: SDL_GPUTextureSamplerBinding size: 1.

	indexBinding := SDL_GPUBufferBinding offset: 0.

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

	| vertexShader fragmentShader vertexBindings vertexAttributes colorTargets |

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
	fragmentShader release.
]

{ #category : 'initialization' }
SDL3GPUInstancedQuadDemoApp >> initializeTexture [

	texture :=
		gpuDevice
			newGPUTextureUploadingForm: (self iconNamed: #remote)
			usage: SDL_GPU_TEXTUREUSAGE_SAMPLER.

	textureSamplerBindings first texture: texture
]

{ #category : 'testing' }
SDL3GPUInstancedQuadDemoApp >> isNearestSamplerFilter [

	^ filter = SDL_GPU_FILTER_NEAREST
]

{ #category : 'lifecycle' }
SDL3GPUInstancedQuadDemoApp >> open [

	super open.
	self initializeGPUResources
]

{ #category : 'private' }
SDL3GPUInstancedQuadDemoApp >> quadIndices [
	"Standard index pattern for a quad:
	Vertices: 0:TL, 1:TR, 2:BR, 3:BL
	Triangles: (0,1,2) and (0,2,3)"

	^ #(0 1 2 0 2 3)
]

{ #category : 'initialization' }
SDL3GPUInstancedQuadDemoApp >> switchSamplerFilter [

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

]

{ #category : 'initialization' }
SDL3GPUInstancedQuadDemoApp >> updateIndexBuffer [

	| byteSize |
	byteSize := 6 * 2. "16-bit indices, 6 indices per quad"

	indexTransferBuffer := gpuDevice newUploadTransferBuffer: byteSize.
	indexBuffer := gpuDevice
		               newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_INDEX
		               size: byteSize.

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

	indexTransferBuffer release.
	indexTransferBuffer := nil
]

{ #category : 'initialization' }
SDL3GPUInstancedQuadDemoApp >> updateVertexBuffer [

	| byteSize |
	byteSize := SDL3GPUQuadVertex structureSize * 4.

	vertexTransferBuffer := gpuDevice newUploadTransferBuffer: byteSize.
	vertexBuffer := gpuDevice
		               newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX
		               size: byteSize.

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
				vertices first
					x: 0;
					y: 0;
					z: 0;
					u: 0;
					v: 0.
				vertices second
					x: 1;
					y: 0;
					z: 0;
					u: 1;
					v: 0.
				vertices third
					x: 1;
					y: -1;
					z: 0;
					u: 1;
					v: 1.
				vertices fourth
					x: 0;
					y: -1;
					z: 0;
					u: 0;
					v: 1 ] ].

	vertexTransferBuffer release.
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
