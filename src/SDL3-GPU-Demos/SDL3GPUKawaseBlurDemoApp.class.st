"
This demo shows a Dual Kawase Blur post-processing effect with the GPU graphics pipeline.
It draws a scene to an off-screen texture and applies downsampling and upsampling blur passes with fragment shaders.
"
Class {
	#name : 'SDL3GPUKawaseBlurDemoApp',
	#superclass : 'SDL3GPUDemoApp',
	#instVars : [
		'numberOfPasses',
		'blurRadius',
		'quads',
		'sceneUniforms',
		'blurTextures',
		'blurUniforms',
		'sceneTexture',
		'pharoTexture',
		'scenePipeline',
		'sampler',
		'vertexBuffer',
		'indexBuffer',
		'colorTargetInfos',
		'indexBufferBinding',
		'downsamplePipeline',
		'upsamplePipeline',
		'vertexBufferBindings',
		'textureSamplerBindings'
	],
	#category : 'SDL3-GPU-Demos-KawaseBlur',
	#package : 'SDL3-GPU-Demos',
	#tag : 'KawaseBlur'
}

{ #category : 'accessing' }
SDL3GPUKawaseBlurDemoApp >> blurRadius [
	^ blurRadius
]

{ #category : 'accessing' }
SDL3GPUKawaseBlurDemoApp >> blurRadius: aFloat [

	blurRadius := aFloat
]

{ #category : 'lifecycle' }
SDL3GPUKawaseBlurDemoApp >> destroyBlurTextures [

	blurTextures do: [ :each | DiScope disposeAndDisown: each ].
	blurTextures removeAll
]

{ #category : 'rendering' }
SDL3GPUKawaseBlurDemoApp >> doRenderPassesOn: swapchainTexture with: commandBuffer [
	"Main rendering entry point sent by the app loop"

	| lastTexture |
	"Pass 1: Render the dynamic scene into an off-screen texture"
	self renderSceneWith: commandBuffer.

	"Pass 2: Apply the Dual Kawase blur chain"
	lastTexture := self renderBlurWith: commandBuffer.

	"Pass 3: Present the final result by blitting it to the swapchain"
	self presentTexture: lastTexture on: swapchainTexture with: commandBuffer
]

{ #category : 'initialization' }
SDL3GPUKawaseBlurDemoApp >> initialize [
	super initialize.
	numberOfPasses := 4.
	blurRadius := 1.0.
	quads := OrderedCollection new.
	blurTextures := OrderedCollection new.

	self initializeFFIContainers
]

{ #category : 'initialization' }
SDL3GPUKawaseBlurDemoApp >> initializeBlurPipelines [

	| baseBuilder |
	baseBuilder := gpuDevice newGraphicsPipelineBuilder
		vertexShader: SDL3GPUDualKawaseBlurSceneVertexShaderSource;
		addVertexBufferFor: SDL3GPUQuadVertex;
		targetFormat: SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM.

	downsamplePipeline := baseBuilder copy
		fragmentShader: SDL3GPUDualKawaseDownsampleFragmentShaderSource;
		unownedNewPipeline.
	DiScope own: downsamplePipeline.

	upsamplePipeline := baseBuilder copy
		fragmentShader: SDL3GPUDualKawaseUpsampleFragmentShaderSource;
		unownedNewPipeline.
	DiScope own: upsamplePipeline
]

{ #category : 'initialization' }
SDL3GPUKawaseBlurDemoApp >> initializeBlurTextures [
	"Allocates a chain of textures at progressively halved resolutions"

	| pixelExtent width height |
	self destroyBlurTextures.

	pixelExtent := self windowPixelExtent.
	width := pixelExtent x.
	height := pixelExtent y.

	1 to: numberOfPasses do: [ :i |
		width := (width / 2) floor max: 1.
		height := (height / 2) floor max: 1.
		blurTextures add: (DiScope own: (gpuDevice
			unownedNew2DGPUTextureFormat: SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM
			usage: SDL_GPU_TEXTUREUSAGE_COLOR_TARGET | SDL_GPU_TEXTUREUSAGE_SAMPLER
			width: width
			height: height)) ]
]

{ #category : 'initialization' }
SDL3GPUKawaseBlurDemoApp >> initializeFFIContainers [
	"Initialize fixed-size FFI containers used during rendering to avoid allocation in the loop"

	sceneUniforms := SDL3GPUDualKawaseBlurSceneUniforms new.
	blurUniforms := SDL3GPUDualKawaseBlurUniforms new
]

{ #category : 'initialization' }
SDL3GPUKawaseBlurDemoApp >> initializeGPUResources [

	self initializeSceneTexture.
	self initializePharoTexture.
	self initializeSampler.
	self initializeGeometry.
	self initializeScenePipeline.
	self initializeBlurTextures.
	self initializeBlurPipelines
]

{ #category : 'initialization' }
SDL3GPUKawaseBlurDemoApp >> initializeGeometry [
	"Initializes common vertex and index buffers for quads"

	self
		initializeQuadBuffers;
		setupGeometryBindings
]

{ #category : 'initialization' }
SDL3GPUKawaseBlurDemoApp >> initializeKeybindings [

	self
		bindKey: SDLK_UP
		description: 'Increase blur radius (+0.1)'
		action: [ blurRadius := blurRadius + 0.1 ];
		bindKey: SDLK_DOWN
		description: 'Decrease blur radius (-0.1)'
		action: [ blurRadius := (blurRadius - 0.1) max: 0.0 ];
		bindKey: SDLK_RIGHT
		description: 'Increase blur passes (+1)'
		action: [ self numberOfPasses: numberOfPasses + 1 ];
		bindKey: SDLK_LEFT
		description: 'Decrease blur passes (-1)'
		action: [ self numberOfPasses: ((numberOfPasses - 1) max: 0) ].
	super initializeKeybindings
]

{ #category : 'initialization' }
SDL3GPUKawaseBlurDemoApp >> initializePharoTexture [

	DiScope own:
		(pharoTexture :=
			gpuDevice
				unownedNewGPUTextureUploadingForm: (self iconNamed: #pharoBig)
				usage: SDL_GPU_TEXTUREUSAGE_SAMPLER)
]

{ #category : 'initialization' }
SDL3GPUKawaseBlurDemoApp >> initializeQuadBuffers [

	| vertexByteSize indexByteSize |
	vertexByteSize := SDL3GPUQuadVertex structureSize * 4.
	indexByteSize := 6 * 2. "6 uint16 indices"

	"1. Allocate GPU buffers"
	DiScope own: (vertexBuffer := gpuDevice unownedNewGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX size: vertexByteSize).
	DiScope own: (indexBuffer := gpuDevice unownedNewGPUBufferUsage: SDL_GPU_BUFFERUSAGE_INDEX size: indexByteSize).

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
				vertices fourth x: -0.5; y:  0.5; z: 0.0; u: 0.0; v: 1.0 "Bottom Left" ].

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
SDL3GPUKawaseBlurDemoApp >> initializeQuads [

	| random windowExtent |
	random := Random new.
	windowExtent := self windowExtent.
	quads := OrderedCollection new.
	1 to: 20 do: [ :i |
		quads add: (SDL3GPUDualKawaseBlurQuad new
			position: (random next * windowExtent x) @ (random next * windowExtent y);
			velocity: (random next * 240.0 - 120.0) @ (random next * 240.0 - 120.0);
			rotation: random next * Float twoPi;
			rotationSpeed: random next * 3.0 - 1.5;
			scale: (64 + (random next * 128)) @ (64 + (random next * 128));
			yourself) ]
]

{ #category : 'initialization' }
SDL3GPUKawaseBlurDemoApp >> initializeSampler [

	sampler := gpuDevice unownedNewGPUSampler: [ :info |
		info
			minFilter: SDL_GPU_FILTER_LINEAR;
			magFilter: SDL_GPU_FILTER_LINEAR;
			mipmapMode: SDL_GPU_SAMPLERMIPMAPMODE_LINEAR;
			addressModeU: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE;
			addressModeV: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE;
			addressModeW: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE ].
	DiScope own: sampler
]

{ #category : 'initialization' }
SDL3GPUKawaseBlurDemoApp >> initializeScenePipeline [

	scenePipeline := gpuDevice newGraphicsPipelineBuilder
		vertexShader: SDL3GPUDualKawaseBlurSceneVertexShaderSource;
		fragmentShader: SDL3GPUQuadFragmentShaderSource;
		addVertexBufferFor: SDL3GPUQuadVertex;
		targetFormat: SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM;
		enableAlphaBlending;
		unownedNewPipeline.
	DiScope own: scenePipeline
]

{ #category : 'initialization' }
SDL3GPUKawaseBlurDemoApp >> initializeSceneTexture [

	| pixelExtent |
	pixelExtent := self windowPixelExtent.
	sceneTexture := DiScope
		dispose: sceneTexture
		andOwn: (gpuDevice
			unownedNew2DGPUTextureFormat: SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM
			usage: SDL_GPU_TEXTUREUSAGE_COLOR_TARGET | SDL_GPU_TEXTUREUSAGE_SAMPLER
			width: pixelExtent x
			height: pixelExtent y)
]

{ #category : 'initialization' }
SDL3GPUKawaseBlurDemoApp >> numberOfPasses [
	^ numberOfPasses
]

{ #category : 'accessing' }
SDL3GPUKawaseBlurDemoApp >> numberOfPasses: anInteger [

	numberOfPasses := anInteger max: 0.
	gpuDevice ifNotNil: [ self initializeBlurTextures ]
]

{ #category : 'rendering' }
SDL3GPUKawaseBlurDemoApp >> presentTexture: sourceTexture on: swapchainTexture with: commandBuffer [
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
SDL3GPUKawaseBlurDemoApp >> pushBlurUniformsWith: commandBuffer sourceExtent: sourceExtent targetExtent: targetExtent [

	blurUniforms
		texelSizeX: 1.0 / sourceExtent x;
		texelSizeY: 1.0 / sourceExtent y;
		blurRadius: blurRadius * window pixelDensity.
	commandBuffer pushFragmentUniform: blurUniforms slot: 0.

	sceneUniforms
		x: targetExtent x / 2.0;
		y: targetExtent y / 2.0;
		scaleX: targetExtent x asFloat;
		scaleY: targetExtent y asFloat;
		rotation: 0.0;
		viewportWidth: targetExtent x asFloat;
		viewportHeight: targetExtent y asFloat.
	commandBuffer pushVertexUniform: sceneUniforms slot: 0
]

{ #category : 'rendering' }
SDL3GPUKawaseBlurDemoApp >> renderBlurWith: commandBuffer [
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
SDL3GPUKawaseBlurDemoApp >> renderKawasePassWith: commandBuffer pipeline: pipeline source: source sourceExtent: sExtent target: target [
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
SDL3GPUKawaseBlurDemoApp >> renderQuad: quad with: commandBuffer on: renderPass [

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
SDL3GPUKawaseBlurDemoApp >> renderSceneWith: commandBuffer [
	"Renders the initial bouncing logos scene"

	| windowExtent |
	windowExtent := window extent.
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
			viewportWidth: windowExtent x asFloat;
			viewportHeight: windowExtent y asFloat.

		quads do: [ :quad |
			self
				renderQuad: quad
				with: commandBuffer
				on: renderPass ] ]
]

{ #category : 'lifecycle' }
SDL3GPUKawaseBlurDemoApp >> setUp [

	super setUp.
	DiScope own: (colorTargetInfos := SDL3Array unownedNewType: SDL_GPUColorTargetInfo size: 1).
	colorTargetInfos first beClear: (Color r: 0.1 g: 0.1 b: 0.1).
	DiScope own: (indexBufferBinding := SDL_GPUBufferBinding unownedNew
		beOffset: 0;
		yourself).
	DiScope own: (vertexBufferBindings := SDL3Array unownedNewType: SDL_GPUBufferBinding size: 1).
	DiScope own: (textureSamplerBindings := SDL3Array unownedNewType: SDL_GPUTextureSamplerBinding size: 1).

	self initializeQuads.
	self initializeGPUResources
]

{ #category : 'initialization' }
SDL3GPUKawaseBlurDemoApp >> setupGeometryBindings [

	vertexBufferBindings first
		buffer: vertexBuffer;
		offset: 0.
	indexBufferBinding
		buffer: indexBuffer;
		offset: 0
]

{ #category : 'hooks' }
SDL3GPUKawaseBlurDemoApp >> step: deltaSeconds [

	self stepQuads: deltaSeconds.
	super step: deltaSeconds
]

{ #category : 'stepping' }
SDL3GPUKawaseBlurDemoApp >> stepQuads: deltaSeconds [

	| windowExtent |
	windowExtent := self windowExtent.
	quads do: [ :each | each step: deltaSeconds in: windowExtent ]
]

{ #category : 'private' }
SDL3GPUKawaseBlurDemoApp >> targetExtentFor: target sourceExtent: sExtent pipeline: pipeline [

	^ pipeline == downsamplePipeline
		 ifTrue: [ (sExtent / 2) floor max: 1 @ 1 ]
		 ifFalse: [
		 (sExtent * 2) min: (window pixelExtent / 2) floor max: 1 @ 1 ]
]

{ #category : 'accessing' }
SDL3GPUKawaseBlurDemoApp >> updatedTitle [

	^ '{1} - Passes: {2}, Radius: {3}' format: {
		super updatedTitle.
		numberOfPasses.
		blurRadius printShowingDecimalPlaces: 1
	}
]

{ #category : 'hooks' }
SDL3GPUKawaseBlurDemoApp >> windowPixelSizeChanged: aPixelExtent [

	self initializeSceneTexture.
	self initializeBlurTextures
]
