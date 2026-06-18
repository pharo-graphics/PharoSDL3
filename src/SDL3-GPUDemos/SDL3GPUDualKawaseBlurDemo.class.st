"
I demonstrate a Dual Kawase Blur post-processing effect using the SDL3 GPU graphics pipeline.

I render a dynamic scene into an off-screen texture and then apply the blur effect using
multiple downsampling and upsampling passes with fragment shaders.

Controls:
- UP/DOWN: Adjust blur radius
- LEFT/RIGHT: Adjust number of blur passes (iterations)
"
Class {
	#name : 'SDL3GPUDualKawaseBlurDemo',
	#superclass : 'SDL3GPUDemoApp',
	#instVars : [
		'numberOfPasses',
		'blurRadius',
		'sceneTexture',
		'pharoTexture',
		'quads',
		'scenePipeline',
		'sampler',
		'vertexBuffer',
		'indexBuffer',
		'colorTargetInfos',
		'vertexBufferBindings',
		'textureSamplerBindings',
		'indexBufferBinding',
		'sceneUniforms',
		'blurTextures',
		'downsamplePipeline',
		'upsamplePipeline',
		'blurUniforms'
	],
	#category : 'SDL3-GPUDemos-KawaseBlur',
	#package : 'SDL3-GPUDemos',
	#tag : 'KawaseBlur'
}

{ #category : 'accessing' }
SDL3GPUDualKawaseBlurDemo >> blurRadius [
	^ blurRadius
]

{ #category : 'accessing' }
SDL3GPUDualKawaseBlurDemo >> blurRadius: aFloat [
	blurRadius := aFloat
]

{ #category : 'lifecycle' }
SDL3GPUDualKawaseBlurDemo >> close [

	self release.
	super close
]

{ #category : 'rendering' }
SDL3GPUDualKawaseBlurDemo >> doRenderPassesOn: swapchainTexture with: commandBuffer [
	"Main rendering entry point called by the app loop"

	| lastTexture |

	self stepQuads.

	"Pass 1: Render the dynamic scene into an off-screen texture"
	self renderSceneWith: commandBuffer.

	"Pass 2: Apply the Dual Kawase blur chain"
	lastTexture := self renderBlurWith: commandBuffer.

	"Pass 3: Present the final result by blitting it to the swapchain"
	self presentTexture: lastTexture on: swapchainTexture with: commandBuffer
]

{ #category : 'initialization' }
SDL3GPUDualKawaseBlurDemo >> initialize [
	super initialize.
	numberOfPasses := 4.
	blurRadius := 1.0.
	quads := OrderedCollection new.
	blurTextures := OrderedCollection new.

	self initializeFFIContainers
]

{ #category : 'initialization' }
SDL3GPUDualKawaseBlurDemo >> initializeBlurPipelines [

	| vertexShader downShader upShader colorTargets vertexBindings vertexAttributes |
	"We use our custom vertex shader that supports uniforms for full-screen quads"
	vertexShader := SDL3GPUDualKawaseBlurSceneVertexShaderSource
				newShaderAmong: shaderFormats
				device: gpuDevice.
	downShader := SDL3GPUDualKawaseDownsampleFragmentShaderSource
				 newShaderAmong: shaderFormats
				 device: gpuDevice.
	upShader := SDL3GPUDualKawaseUpsampleFragmentShaderSource
				newShaderAmong: shaderFormats
				device: gpuDevice.

	colorTargets := SDL_GPUColorTargetDescription safeNewArray: 1.
	colorTargets first format: SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM.

	vertexBindings := SDL_GPUVertexBufferDescription safeNewArray: 1.
	vertexBindings first
		slot: 0;
		inputRate: SDL_GPU_VERTEXINPUTRATE_VERTEX;
		pitch: SDL3GPUQuadVertex structureSize.

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

	"1. Downsample Pipeline"
	downsamplePipeline := gpuDevice newGraphicsPipeline: [ :info |
		info
			vertex: vertexShader
			fragment: downShader
			targets: colorTargets.
		info vertexInputState
			attributes: vertexAttributes
			bindings: vertexBindings ].

	"2. Upsample Pipeline"
	upsamplePipeline := gpuDevice newGraphicsPipeline: [ :info |
		info
			vertex: vertexShader
			fragment: upShader
			targets: colorTargets.
		info vertexInputState
			attributes: vertexAttributes
			bindings: vertexBindings ].


	vertexShader release.
	downShader release.
	upShader release
]

{ #category : 'initialization' }
SDL3GPUDualKawaseBlurDemo >> initializeBlurTextures [
	"Allocates a chain of textures at progressively halved resolutions"
	| w h |

	self releaseBlurTextures.

	w := window pixelExtent x.
	h := window pixelExtent y.

	1 to: numberOfPasses do: [ :i |
		w := (w / 2) floor max: 1.
		h := (h / 2) floor max: 1.
		blurTextures add: (gpuDevice
			new2DGPUTextureFormat: SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM
			usage: SDL_GPU_TEXTUREUSAGE_COLOR_TARGET | SDL_GPU_TEXTUREUSAGE_SAMPLER
			width: w
			height: h)
	]
]

{ #category : 'initialization' }
SDL3GPUDualKawaseBlurDemo >> initializeFFIContainers [
	"Initialize fixed-size FFI containers used during rendering to avoid allocation in the loop"

	colorTargetInfos := SDL_GPUColorTargetInfo safeNewArray: 1.
	colorTargetInfos first beClear: (Color r: 0.1 g: 0.1 b: 0.1).

	vertexBufferBindings := FFIArray newType: SDL_GPUBufferBinding size: 1.
	textureSamplerBindings := FFIArray
					  newType: SDL_GPUTextureSamplerBinding
					  size: 1.
	indexBufferBinding := SDL_GPUBufferBinding offset: 0.

	sceneUniforms := SDL3GPUDualKawaseBlurSceneUniforms new.
	blurUniforms := SDL3GPUDualKawaseBlurUniforms new
]

{ #category : 'initialization' }
SDL3GPUDualKawaseBlurDemo >> initializeGPUResources [

	self initializeSceneTexture.
	self initializePharoTexture.
	self initializeSampler.
	self initializeGeometry.
	self initializeScenePipeline.
	self initializeBlurTextures.
	self initializeBlurPipelines
]

{ #category : 'initialization' }
SDL3GPUDualKawaseBlurDemo >> initializeGeometry [
	"Initializes common vertex and index buffers for quads"

	self
		initializeQuadBuffers;
		setupGeometryBindings
]

{ #category : 'initialization' }
SDL3GPUDualKawaseBlurDemo >> initializePharoTexture [

	pharoTexture := gpuDevice newGPUTextureUploadingForm: (self iconNamed: #pharoBig) usage: SDL_GPU_TEXTUREUSAGE_SAMPLER
]

{ #category : 'initialization' }
SDL3GPUDualKawaseBlurDemo >> initializeQuadBuffers [

	| vertexByteSize indexByteSize |
	vertexByteSize := SDL3GPUQuadVertex structureSize * 4.
	indexByteSize := 6 * 2. "6 uint16 indices"

	"1. Allocate GPU buffers"
	vertexBuffer := gpuDevice
		                newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX
		                size: vertexByteSize.
	indexBuffer := gpuDevice
		               newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_INDEX
		               size: indexByteSize.

	"2. Upload to GPU"
	gpuDevice uploadToGPUDo: [ :uploader |
		uploader
			uploadTo: vertexBuffer
			type: SDL3GPUQuadVertex
			count: 4
			cycle: true
			fillWith: [ :vertices |
				"Vertices match screen space (Y points down, Top is -0.5, Bottom is 0.5)"
				vertices first  x: -0.5; y: -0.5; z: 0.0; u: 0.0; v: 0.0. "Top Left"
				vertices second x:  0.5; y: -0.5; z: 0.0; u: 1.0; v: 0.0. "Top Right"
				vertices third  x:  0.5; y:  0.5; z: 0.0; u: 1.0; v: 1.0. "Bottom Right"
				vertices fourth x: -0.5; y:  0.5; z: 0.0; u: 0.0; v: 1.0. "Bottom Left" ].

		uploader
			uploadTo: indexBuffer
			type: FFIUInt16
			count: 6
			cycle: true
			fillWith: [ :indices |
				indices
					at: 1 put: 0;
					at: 2 put: 1;
					at: 3 put: 2;
					at: 4 put: 0;
					at: 5 put: 2;
					at: 6 put: 3 ] ]
]

{ #category : 'initialization' }
SDL3GPUDualKawaseBlurDemo >> initializeQuads [

	| random extent |
	random := Random new.
	extent := window pixelExtent.
	quads := OrderedCollection new.
	1 to: 20 do: [ :i |
		quads add: (SDL3GPUDualKawaseBlurQuad new
			position: (random next * extent x) @ (random next * extent y);
			velocity: (random next * 4 - 2) @ (random next * 4 - 2);
			rotation: random next * Float twoPi;
			rotationSpeed: random next * 0.05 - 0.025;
			scale: (64 + (random next * 128)) @ (64 + (random next * 128));
			yourself) ]
]

{ #category : 'initialization' }
SDL3GPUDualKawaseBlurDemo >> initializeSampler [

	sampler := gpuDevice newSampler: [ :info |
		info
			minFilter: SDL_GPU_FILTER_LINEAR;
			magFilter: SDL_GPU_FILTER_LINEAR;
			mipmapMode: SDL_GPU_SAMPLERMIPMAPMODE_LINEAR;
			addressModeU: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE;
			addressModeV: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE;
			addressModeW: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE ]
]

{ #category : 'initialization' }
SDL3GPUDualKawaseBlurDemo >> initializeScenePipeline [

	| vertexShader fragmentShader colorTargets vertexBindings vertexAttributes |
	vertexShader := SDL3GPUDualKawaseBlurSceneVertexShaderSource
				newShaderAmong: shaderFormats
				device: gpuDevice.
	fragmentShader := SDL3GPUQuadFragmentShaderSource
				 newShaderAmong: shaderFormats
				 device: gpuDevice.

	colorTargets := SDL_GPUColorTargetDescription safeNewArray: 1.
	colorTargets first
		format: SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM;
		blendState: SDL_GPUColorTargetBlendState newAlphaBlend.

	vertexBindings := SDL_GPUVertexBufferDescription safeNewArray: 1.
	vertexBindings first
		slot: 0;
		inputRate: SDL_GPU_VERTEXINPUTRATE_VERTEX;
		pitch: SDL3GPUQuadVertex structureSize.

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

	scenePipeline := gpuDevice newGraphicsPipeline: [ :info |
		info
			vertex: vertexShader
			fragment: fragmentShader
			targets: colorTargets.
		info vertexInputState
			attributes: vertexAttributes
			bindings: vertexBindings ].

	vertexShader release.
	fragmentShader release
]

{ #category : 'initialization' }
SDL3GPUDualKawaseBlurDemo >> initializeSceneTexture [

	sceneTexture ifNotNil: [ sceneTexture release ].

	sceneTexture :=
		gpuDevice
			new2DGPUTextureFormat: SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM
			usage: SDL_GPU_TEXTUREUSAGE_COLOR_TARGET | SDL_GPU_TEXTUREUSAGE_SAMPLER
			width: window pixelExtent x
			height: window pixelExtent y
]

{ #category : 'initialization' }
SDL3GPUDualKawaseBlurDemo >> numberOfPasses [
	^ numberOfPasses
]

{ #category : 'accessing' }
SDL3GPUDualKawaseBlurDemo >> numberOfPasses: anInteger [

	numberOfPasses := anInteger max: 0.
	gpuDevice ifNotNil: [ self initializeBlurTextures ]
]

{ #category : 'lifecycle' }
SDL3GPUDualKawaseBlurDemo >> open [

	super open.
	self initializeQuads.
	self initializeGPUResources
]

{ #category : 'rendering' }
SDL3GPUDualKawaseBlurDemo >> presentTexture: sourceTexture on: swapchainTexture with: commandBuffer [
	"Blits the final off-screen result to the window swapchain"

	| windowExtent lastExtent |
	windowExtent := window pixelExtent.

	"Determine the extent of the texture to present"
	lastExtent := windowExtent.
	(sourceTexture ~~ sceneTexture) ifTrue: [
		"If it's one of the blur textures, it's at half resolution"
		lastExtent := (windowExtent / 2) floor max: 1@1
	].

	commandBuffer blitFrom: sourceTexture to: swapchainTexture do: [ :blitInfo |
		blitInfo source
			w: lastExtent x;
			h: lastExtent y.
		blitInfo destination
			w: windowExtent x;
			h: windowExtent y.
		blitInfo loadOp: SDL_GPU_LOADOP_CLEAR.
		blitInfo updateClearColorFrom: Color black ]
]

{ #category : 'private' }
SDL3GPUDualKawaseBlurDemo >> pushBlurUniformsWith: commandBuffer sourceExtent: sExtent targetExtent: targetExtent [

	blurUniforms
		texelSizeX: 1.0 / sExtent x;
		texelSizeY: 1.0 / sExtent y;
		blurRadius: blurRadius.
	commandBuffer
		pushFragmentUniform: blurUniforms slot: 0.

	sceneUniforms
		x: targetExtent x / 2.0;
		y: targetExtent y / 2.0;
		scaleX: targetExtent x asFloat;
		scaleY: targetExtent y asFloat;
		rotation: 0.0;
		viewportWidth: targetExtent x asFloat;
		viewportHeight: targetExtent y asFloat.
	commandBuffer
		pushVertexUniform: sceneUniforms slot: 0
]

{ #category : 'lifecycle' }
SDL3GPUDualKawaseBlurDemo >> release [

	sceneTexture ifNotNil: [ sceneTexture release ].
	pharoTexture ifNotNil: [ pharoTexture release ].
	scenePipeline ifNotNil: [ scenePipeline release ].
	sampler ifNotNil: [ sampler release ].
	vertexBuffer ifNotNil: [ vertexBuffer release ].
	indexBuffer ifNotNil: [ indexBuffer release ].

	self releaseBlurTextures.
	downsamplePipeline ifNotNil: [ downsamplePipeline release ].
	upsamplePipeline ifNotNil: [ upsamplePipeline release ]
]

{ #category : 'lifecycle' }
SDL3GPUDualKawaseBlurDemo >> releaseBlurTextures [

	blurTextures do: [ :each | each release ].
	blurTextures removeAll
]

{ #category : 'rendering' }
SDL3GPUDualKawaseBlurDemo >> renderBlurWith: commandBuffer [
	"Executes the Dual Kawase blur chain using multiple render passes"

	| currentSource currentExtent |
	numberOfPasses = 0 ifTrue: [ ^ sceneTexture ].

	currentSource := sceneTexture.
	currentExtent := window pixelExtent.

	"1. Downsample chain"
	blurTextures do: [ :target |
		currentExtent := self
					renderKawasePassWith: commandBuffer
					pipeline: downsamplePipeline
					source: currentSource
					sourceExtent: currentExtent
					target: target.
		currentSource := target ].

	"2. Upsample chain"
	blurTextures size - 1 to: 1 by: -1 do: [ :i |
		| target |
		target := blurTextures at: i.
		currentExtent := self
					renderKawasePassWith: commandBuffer
					pipeline: upsamplePipeline
					source: currentSource
					sourceExtent: currentExtent
					target: target.
		currentSource := target ].

	^ currentSource
]

{ #category : 'rendering' }
SDL3GPUDualKawaseBlurDemo >> renderKawasePassWith: commandBuffer pipeline: pipeline source: source sourceExtent: sExtent target: target [
	"Executes a single downsample or upsample pass"

	| targetExtent |
	targetExtent :=
		self
			targetExtentFor: target
			sourceExtent: sExtent
			pipeline: pipeline.

	colorTargetInfos first texture: target.
	commandBuffer renderPassTargets: colorTargetInfos do: [ :renderPass |
		vertexBufferBindings first
			buffer: vertexBuffer;
			offset: 0.
		indexBufferBinding
			buffer: indexBuffer;
			offset: 0.
		textureSamplerBindings first
			texture: source;
			sampler: sampler.

		renderPass
			pipeline: pipeline;
			vertexBuffers: vertexBufferBindings slot: 0;
			indexBuffer16Bit: indexBufferBinding;
			fragmentSamplers: textureSamplerBindings slot: 0.

		self
			pushBlurUniformsWith: commandBuffer
			sourceExtent: sExtent
			targetExtent: targetExtent.

		renderPass
			drawIndexedPrimitives: 6
			instances: 1
			firstIndex: 0
			vertexOffset: 0
			firstInstance: 0 ].

	^ targetExtent
]

{ #category : 'private' }
SDL3GPUDualKawaseBlurDemo >> renderQuad: quad with: commandBuffer on: renderPass [

	sceneUniforms
		x: quad position x;
		y: quad position y;
		scaleX: quad scale x;
		scaleY: quad scale y;
		rotation: quad rotation.
	commandBuffer
		pushVertexUniform: sceneUniforms slot: 0.
	renderPass
		drawIndexedPrimitives: 6
		instances: 1
		firstIndex: 0
		vertexOffset: 0
		firstInstance: 0
]

{ #category : 'rendering' }
SDL3GPUDualKawaseBlurDemo >> renderSceneWith: commandBuffer [
	"Renders the initial bouncing logos scene"

	| extent |
	extent := window pixelExtent.
	colorTargetInfos first texture: sceneTexture.

	commandBuffer renderPassTargets: colorTargetInfos do: [ :renderPass |
		renderPass pipeline: scenePipeline.

		vertexBufferBindings first
			buffer: vertexBuffer;
			offset: 0.
		indexBufferBinding
			buffer: indexBuffer;
			offset: 0.
		renderPass
			vertexBuffers: vertexBufferBindings slot: 0;
			indexBuffer16Bit: indexBufferBinding.

		textureSamplerBindings first
			texture: pharoTexture;
			sampler: sampler.
		renderPass fragmentSamplers: textureSamplerBindings slot: 0.

		sceneUniforms
			viewportWidth: extent x asFloat;
			viewportHeight: extent y asFloat.

		quads do: [ :quad |
			self
				renderQuad: quad
				with: commandBuffer
				on: renderPass ] ]
]

{ #category : 'initialization' }
SDL3GPUDualKawaseBlurDemo >> setupGeometryBindings [

	vertexBufferBindings first
		buffer: vertexBuffer;
		offset: 0.
	indexBufferBinding
		buffer: indexBuffer;
		offset: 0
]

{ #category : 'initialization' }
SDL3GPUDualKawaseBlurDemo >> stepQuads [

	| extent |
	extent := window pixelExtent.
	quads do: [ :each | each stepIn: extent ]
]

{ #category : 'private' }
SDL3GPUDualKawaseBlurDemo >> targetExtentFor: target sourceExtent: sExtent pipeline: pipeline [

	^ pipeline == downsamplePipeline
		 ifTrue: [ (sExtent / 2) floor max: 1 @ 1 ]
		 ifFalse: [
		 (sExtent * 2) min: (window pixelExtent / 2) floor max: 1 @ 1 ]
]

{ #category : 'accessing' }
SDL3GPUDualKawaseBlurDemo >> updatedTitle [

	^ '{1} - Passes: {2}, Radius: {3}' format: {
		super updatedTitle.
		numberOfPasses.
		blurRadius printShowingDecimalPlaces: 1
	}
]

{ #category : 'hooks' }
SDL3GPUDualKawaseBlurDemo >> visitKeyboardDownEvent: aKeyboardDownEvent [

	| key |
	super visitKeyboardDownEvent: aKeyboardDownEvent.
	key := aKeyboardDownEvent key.

	key = SDLK_UP asInteger ifTrue: [ blurRadius := blurRadius + 0.1 ].
	key = SDLK_DOWN asInteger ifTrue: [ blurRadius := (blurRadius - 0.1) max: 0.0 ].

	key = SDLK_RIGHT asInteger ifTrue: [ self numberOfPasses: (numberOfPasses + 1) ].
	key = SDLK_LEFT asInteger ifTrue: [ self numberOfPasses: ((numberOfPasses - 1) max: 0) ].

	self updateTitle
]

{ #category : 'visiting - concrete' }
SDL3GPUDualKawaseBlurDemo >> visitWindowPixelSizeChangedEvent: aWindowPixelSizeChangedEvent [

	super visitWindowPixelSizeChangedEvent: aWindowPixelSizeChangedEvent.

	self initializeSceneTexture.
	self initializeBlurTextures
]
