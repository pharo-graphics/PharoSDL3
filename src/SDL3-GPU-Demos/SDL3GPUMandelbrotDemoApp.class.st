"
I am a specialized demo for a tiled map with latency emulation.

I demonstrate:
- Background GPU fractal generation (compute pipeline).
- Tiled rendering with level-of-detail (LOD) transitions.
- High-quality Mandelbrot visualization (2x2 SSAA, smooth coloring).
- Asynchronous resource loading mockup with 'Shimmer' effect.
"
Class {
	#name : 'SDL3GPUMandelbrotDemoApp',
	#superclass : 'SDL3GPUDemoApp',
	#instVars : [
		'camera',
		'tileManager',
		'atlasSizeSlots',
		'tileSizePixels',
		'tileToSlotMap',
		'freeSlots',
		'loadingDelayMillis',
		'tileStates',
		'loadedKeysQueue',
		'computedKeys',
		'visibleReadyKeys',
		'visibleFallbackKeys',
		'visibleLoadingKeys',
		'computePipeline',
		'quadPipeline',
		'shimmerPipeline',
		'atlasTexture',
		'sampler',
		'vertexBuffer',
		'indexBuffer',
		'instanceBuffer',
		'shimmerInstanceBuffer',
		'colorTargetInfos',
		'atlasBindings',
		'uniforms',
		'shimmerUniforms',
		'vertexBufferBindings',
		'shimmerVertexBufferBindings',
		'samplerBindings',
		'indexBufferBinding'
	],
	#category : 'SDL3-GPU-Demos-TiledMap',
	#package : 'SDL3-GPU-Demos',
	#tag : 'TiledMap'
}

{ #category : 'rendering' }
SDL3GPUMandelbrotDemoApp >> computeNewTiles [
	"Generate fractal bits for newly ready tiles on the GPU."

	| commandBuffer newKeysToCompute |
	newKeysToCompute := visibleReadyKeys reject: [ :key | computedKeys includes: key ].
	newKeysToCompute ifEmpty: [ ^ self ].

	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	self executeComputePassFor: newKeysToCompute with: commandBuffer.
	commandBuffer submit.

	computedKeys addAll: newKeysToCompute
]

{ #category : 'rendering' }
SDL3GPUMandelbrotDemoApp >> doRenderPassesOn: swapchainTexture with: commandBuffer [

	self uploadInstanceDataWith: commandBuffer.

	self
		executeGraphicsPassOn: swapchainTexture
		readyCount: visibleReadyKeys size + visibleFallbackKeys size
		loadingCount: visibleLoadingKeys size
		with: commandBuffer
]

{ #category : 'private' }
SDL3GPUMandelbrotDemoApp >> evictTilesNotIn: keys [
	"Evict tiles that are no longer visible"

	tileStates keys copy do: [ :k |
		(keys includes: k) ifFalse: [
			tileStates removeKey: k.
			computedKeys remove: k ifAbsent: [ ].
			tileToSlotMap at: k ifPresent: [ :slot |
				freeSlots addLast: slot.
				tileToSlotMap removeKey: k ] ] ]
]

{ #category : 'private' }
SDL3GPUMandelbrotDemoApp >> executeComputePassFor: keys with: commandBuffer [

	atlasBindings first beTexture: atlasTexture.

	commandBuffer computePassTextures: atlasBindings computeStorageBuffers: #() do: [ :computePass |
		computePass pipeline: computePipeline.

		keys do: [ :key |
			| slot |
			slot := tileToSlotMap at: key ifAbsent: [ 0 ].
			self pushTileUniforms: key slot: slot with: commandBuffer.
			computePass
				dispatchX: tileSizePixels
				y: tileSizePixels
				z: 1 ] ]
]

{ #category : 'private' }
SDL3GPUMandelbrotDemoApp >> executeGraphicsPassOn: swapchainTexture readyCount: readyCount loadingCount: loadingCount with: commandBuffer [

	colorTargetInfos first texture: swapchainTexture.
	commandBuffer renderPassTargets: colorTargetInfos do: [ :renderPass |
		"Pass A: Ready Tiles (Fractal) - Including Fallbacks"
		readyCount > 0 ifTrue: [
			renderPass
				pipeline: quadPipeline;
				vertexBuffers: vertexBufferBindings slot: 0;
				indexBuffer16Bit: indexBufferBinding;
				fragmentSamplers: samplerBindings slot: 0;
				drawIndexedPrimitives: 6
				instances: readyCount
				firstIndex: 0
				vertexOffset: 0
				firstInstance: 0 ].

		"Pass B: Loading Tiles (Shimmer)"
		loadingCount > 0 ifTrue: [
			shimmerUniforms time: Time millisecondClockValue / 1000.0.
			shimmerUniforms resolutionX: window pixelExtent x; resolutionY: window pixelExtent y.
			commandBuffer
				pushVertexUniform: shimmerUniforms slot: 0;
				pushFragmentUniform: shimmerUniforms slot: 0.

			renderPass
				pipeline: shimmerPipeline;
				vertexBuffers: shimmerVertexBufferBindings slot: 0;
				indexBuffer16Bit: indexBufferBinding;
				drawIndexedPrimitives: 6
				instances: loadingCount
				firstIndex: 0
				vertexOffset: 0
				firstInstance: 0 ] ]
]

{ #category : 'private' }
SDL3GPUMandelbrotDemoApp >> fillInstance: anInstance forKey: key slot: aSlotIndex parentKey: aParentKey [

	| lod fractalTileSize minFractal screenRect atlasRect slotX slotY |
	lod := key third.
	fractalTileSize := 4.0 / (2 ** lod).
	minFractal := key first * fractalTileSize @ (key second * fractalTileSize).

	"Map fractal coord back to logical 0..1 based on camera"
	screenRect := camera fractalToLogicalRect: (minFractal extent: fractalTileSize @ fractalTileSize).

	slotX := aSlotIndex \\ atlasSizeSlots x.
	slotY := aSlotIndex // atlasSizeSlots x.

	"Base atlas rect for the slot"
	atlasRect := SDL3FRect new
		x: slotX asFloat / atlasSizeSlots x asFloat;
		y: slotY asFloat / atlasSizeSlots y asFloat;
		w: 1.0 / atlasSizeSlots x asFloat;
		h: 1.0 / atlasSizeSlots y asFloat;
		yourself.

	"If using a parent slot, we must only use a quadrant of it"
	aParentKey ifNotNil: [ | subX subY |
		subX := key first \\ 2.
		subY := key second \\ 2.
		atlasRect
			x: atlasRect x + (subX * 0.5 * atlasRect w);
			y: atlasRect y + (subY * 0.5 * atlasRect h);
			w: atlasRect w * 0.5;
			h: atlasRect h * 0.5 ].

	anInstance screenRect
		x: screenRect left asFloat;
		y: screenRect top asFloat;
		w: screenRect width asFloat;
		h: screenRect height asFloat.
	anInstance atlasRect
		x: atlasRect x;
		y: atlasRect y;
		w: atlasRect w;
		h: atlasRect h
]

{ #category : 'accessing' }
SDL3GPUMandelbrotDemoApp >> initialExtent [

	^ 720 @ 720
]

{ #category : 'initialization' }
SDL3GPUMandelbrotDemoApp >> initialize [

	super initialize.

	tileSizePixels := 512.
	atlasSizeSlots := 8 @ 8. "4096x4096 atlas"

	camera := SDL3TiledMapCamera new.
	camera
		viewportExtent: self initialExtent;
		center: -0.5 @ 0.0;
		zoomLevel: 1.5.

	tileManager := SDL3TileManager new.
	tileManager camera: camera.

	tileToSlotMap := Dictionary new.
	freeSlots := (0 to: atlasSizeSlots x * atlasSizeSlots y - 1) asOrderedCollection.

	loadingDelayMillis := 250.
	tileStates := Dictionary new.
	loadedKeysQueue := SharedQueue new.
	computedKeys := Set new.

	visibleReadyKeys := OrderedCollection new.
	visibleFallbackKeys := OrderedCollection new.
	visibleLoadingKeys := OrderedCollection new
]

{ #category : 'initialization' }
SDL3GPUMandelbrotDemoApp >> initializeAtlas [

	atlasTexture := gpuDevice unownedNewGPUTexture: [ :info |
		info
			type: SDL_GPU_TEXTURETYPE_2D;
			format: SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM;
			width: atlasSizeSlots x * tileSizePixels;
			height: atlasSizeSlots y * tileSizePixels;
			layerCountOrDepth: 1;
			numLevels: 1;
			usage: SDL_GPU_TEXTUREUSAGE_SAMPLER | SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE ].
	DiScope own: atlasTexture.

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
SDL3GPUMandelbrotDemoApp >> initializeGeometry [
	"Upload a standard 1x1 quad (0..1)."

	self
		initializeQuadBuffers;
		initializeInstanceBuffers;
		setupGeometryBindings
]

{ #category : 'initialization' }
SDL3GPUMandelbrotDemoApp >> initializeInstanceBuffers [
	"Pre-allocate instance buffers for up to 256 tiles"

	DiScope own:
		(instanceBuffer := gpuDevice unownedNewGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX size: 256 * SDL3GPUTileInstance structureSize).
	DiScope own: (shimmerInstanceBuffer := gpuDevice
		unownedNewGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX
		size: 256 * SDL3GPUTileInstance structureSize)
]

{ #category : 'initialization' }
SDL3GPUMandelbrotDemoApp >> initializeQuadBuffers [

	DiScope own:
		(vertexBuffer := gpuDevice unownedNewGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX size: 4 * SDL3GPUQuadVertex structureSize).
	DiScope own: (indexBuffer := gpuDevice unownedNewGPUBufferUsage: SDL_GPU_BUFFERUSAGE_INDEX size: 6 * 2).

	gpuDevice uploadToGPUDo: [ :uploader |
		uploader
			uploadTo: vertexBuffer
			type: SDL3GPUQuadVertex
			count: 4
			cycle: false
			fillWith: [ :vertices |
				vertices first  x: 0.0; y: 0.0; z: 0.0; u: 0.0; v: 0.0.
				vertices second x: 1.0; y: 0.0; z: 0.0; u: 1.0; v: 0.0.
				vertices third  x: 1.0; y: 1.0; z: 0.0; u: 1.0; v: 1.0.
				vertices fourth x: 0.0; y: 1.0; z: 0.0; u: 0.0; v: 1.0 ].

		uploader
			uploadTo: indexBuffer
			type: FFIUInt16
			count: 6
			cycle: false
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
SDL3GPUMandelbrotDemoApp >> initializeShaders [

	DiScope own: (computePipeline := SDL3GPUMandelbrotComputeShaderSource unownedNewComputePipelineForDevice: gpuDevice).

	quadPipeline := gpuDevice newGraphicsPipelineBuilder
		vertexShader: SDL3GPUTiledMapVertexShaderSource;
		fragmentShader: SDL3GPUQuadFragmentShaderSource;
		addVertexBufferFor: SDL3GPUQuadVertex;
		addVertexBufferFor: SDL3GPUTileInstance
			slot: 1
			inputRate: SDL3GPUVertexInputRate instance;
		targetWindow: window;
		unownedNewPipeline.
	DiScope own: quadPipeline.

	shimmerPipeline := gpuDevice newGraphicsPipelineBuilder
		vertexShader: SDL3GPUShimmerVertexShaderSource;
		fragmentShader: SDL3GPUShimmerFragmentShaderSource;
		addVertexBufferFor: SDL3GPUQuadVertex;
		addVertexBufferFor: SDL3GPUTileInstance
			slot: 1
			inputRate: SDL3GPUVertexInputRate instance;
		targetWindow: window;
		enableAlphaBlending;
		unownedNewPipeline.
	DiScope own: shimmerPipeline
]

{ #category : 'private' }
SDL3GPUMandelbrotDemoApp >> processLoadedKeysQueue [
	"Process loaded keys from the background thread"

	| toProcess |
	toProcess := OrderedCollection new.
	[ loadedKeysQueue isEmpty ] whileFalse: [ toProcess add: loadedKeysQueue next ].

	toProcess do: [ :loadedKey |
		(tileStates includesKey: loadedKey) ifTrue: [
			freeSlots ifNotEmpty: [
				tileToSlotMap at: loadedKey put: freeSlots removeFirst.
				tileStates at: loadedKey put: #ready
			] ifEmpty: [
				loadedKeysQueue nextPut: loadedKey
			]
		]
	]
]

{ #category : 'private' }
SDL3GPUMandelbrotDemoApp >> pushTileUniforms: key slot: slot with: commandBuffer [
	"Push compute uniforms for a specific tile."

	| lod fractalTileSize minX minY |
	lod := key third.
	fractalTileSize := 4.0 / (2 ** lod).

	minX := key first * fractalTileSize.
	minY := key second * fractalTileSize.

	uniforms
		x1: minX asFloat;
		y1: minY asFloat;
		x2: (minX + fractalTileSize) asFloat;
		y2: (minY + fractalTileSize) asFloat;
		maxIterations: 256;
		atlasSlot: slot;
		tileSize: tileSizePixels.

	commandBuffer pushComputeUniform: uniforms slot: 0
]

{ #category : 'private' }
SDL3GPUMandelbrotDemoApp >> requestTile: key [
	"Emulate loading latency with jitter."

	| jitteredDelay |
	loadingDelayMillis = 0 ifTrue: [
		freeSlots ifNotEmpty: [
			tileToSlotMap at: key put: freeSlots removeFirst.
			^ tileStates at: key put: #ready ] ].

	"Emulate latency to load tiles (50% to 150% of the base parameter)"
	jitteredDelay := (loadingDelayMillis * 0.5) +
		(loadingDelayMillis * SharedRandom globalGenerator next).
	[	(Delay forMilliseconds: jitteredDelay truncated) wait.
		loadedKeysQueue nextPut: key ] forkAt: Processor activePriority + 1.

	^ tileStates at: key put: #loading
]

{ #category : 'lifecycle' }
SDL3GPUMandelbrotDemoApp >> setUp [

	super setUp.
	DiScope own: (colorTargetInfos := SDL3Array unownedNewType: SDL_GPUColorTargetInfo size: 1).
	colorTargetInfos first beClear: (Color r: 0.02 g: 0.02 b: 0.05).
	DiScope own: (atlasBindings := SDL3Array unownedNewType: SDL3GPUStorageTextureReadWriteBinding size: 1).
	atlasBindings first beUnbound.
	DiScope own: (uniforms := SDL3GPUMandelbrotUniforms unownedNew).
	DiScope own: (shimmerUniforms := SDL3GPUShimmerUniforms unownedNew).
	shimmerUniforms
		baseColor: (SDL3FColor r: 0.1 g: 0.1 b: 0.15 a: 1.0);
		highlightColor: (SDL3FColor r: 0.2 g: 0.2 b: 0.3 a: 1.0);
		effectType: 2; "Angled Sweep"
		cornerRadius: 0.0. "Perfectly square tiles"
	DiScope own: (vertexBufferBindings := SDL3Array unownedNewType: SDL_GPUBufferBinding size: 2).
	DiScope own: (shimmerVertexBufferBindings := SDL3Array unownedNewType: SDL_GPUBufferBinding size: 2).
	DiScope own: (indexBufferBinding := SDL_GPUBufferBinding unownedNew
		beOffset: 0;
		yourself).
	DiScope own: (samplerBindings := SDL3Array unownedNewType: SDL_GPUTextureSamplerBinding size: 1).

	self initializeAtlas.
	self initializeShaders.
	self initializeGeometry
]

{ #category : 'initialization' }
SDL3GPUMandelbrotDemoApp >> setupGeometryBindings [

	vertexBufferBindings first
		buffer: vertexBuffer;
		offset: 0.
	vertexBufferBindings second
		buffer: instanceBuffer;
		offset: 0.

	shimmerVertexBufferBindings first
		buffer: vertexBuffer;
		offset: 0.
	shimmerVertexBufferBindings second
		buffer: shimmerInstanceBuffer;
		offset: 0.

	indexBufferBinding
		buffer: indexBuffer;
		offset: 0.

	samplerBindings first
		texture: atlasTexture;
		sampler: sampler
]

{ #category : 'hooks' }
SDL3GPUMandelbrotDemoApp >> step [

	self updateTiles.
	self computeNewTiles.
	self updateTitle.
	super step
]

{ #category : 'rendering' }
SDL3GPUMandelbrotDemoApp >> updateTiles [
	"Identify visible tiles and sort them by state."

	| visibleKeys |
	visibleKeys := tileManager visibleTileKeys.

	self evictTilesNotIn: visibleKeys.
	self processLoadedKeysQueue.

	visibleReadyKeys := OrderedCollection new.
	visibleFallbackKeys := OrderedCollection new.
	visibleLoadingKeys := OrderedCollection new.

	visibleKeys do: [ :key |
		| state parentKey |
		state := tileStates at: key ifAbsent: [ self requestTile: key ].
		state = #ready
			ifTrue: [ visibleReadyKeys add: key ]
			ifFalse: [
				"Check for fallback parent"
				parentKey := { key first // 2. key second // 2. key third - 1 }.
				(tileStates at: parentKey ifAbsent: [ nil ]) = #ready
					ifTrue: [ visibleFallbackKeys add: { key . parentKey } ]
					ifFalse: [ visibleLoadingKeys add: key ]
			] ]
]

{ #category : 'accessing' }
SDL3GPUMandelbrotDemoApp >> updatedTitle [

	| readyCount loadingCount zoomString |
	readyCount := tileStates values count: [ :each | each = #ready ].
	loadingCount := tileStates values count: [ :each | each = #loading ].
	zoomString := camera zoomLevel printShowingDecimalPlaces: 2.

	^ String streamContents: [ :stream |
		  stream
			  nextPutAll: super updatedTitle;
			  nextPutAll: ' - Latency: ';
			  nextPutAll: loadingDelayMillis printString;
			  nextPutAll: 'ms - Zoom: ';
			  nextPutAll: zoomString;
			  nextPutAll: ' - Tiles: ';
			  nextPutAll: readyCount printString;
			  nextPutAll: ' ready, ';
			  nextPutAll: loadingCount printString;
			  nextPutAll: ' loading' ]
]

{ #category : 'private' }
SDL3GPUMandelbrotDemoApp >> uploadInstanceDataWith: commandBuffer [

	self
		uploadReadyInstanceDataWith: commandBuffer;
		uploadShimmerInstanceDataWith: commandBuffer
]

{ #category : 'private' }
SDL3GPUMandelbrotDemoApp >> uploadReadyInstanceDataWith: commandBuffer [

	| size |
	size := visibleReadyKeys size + visibleFallbackKeys size.
	size = 0 ifTrue: [ ^ self ].

	commandBuffer uploadToGPUDo: [ :uploader |
		uploader
			uploadTo: instanceBuffer
			type: SDL3GPUTileInstance
			count: size
			cycle: false
			fillWith: [ :mapped |
				| idx |
				idx := 1.
				visibleReadyKeys do: [ :key |
					self
						fillInstance: (mapped at: idx)
						forKey: key
						slot: (tileToSlotMap at: key)
						parentKey: nil.
					idx := idx + 1 ].
				visibleFallbackKeys do: [ :pair |
					self
						fillInstance: (mapped at: idx)
						forKey: pair first
						slot: (tileToSlotMap at: pair second)
						parentKey: pair second.
					idx := idx + 1 ] ] ]
]

{ #category : 'private' }
SDL3GPUMandelbrotDemoApp >> uploadShimmerInstanceDataWith: commandBuffer [

	| size |
	size := visibleLoadingKeys size.
	size = 0 ifTrue: [ ^ self ].

	commandBuffer uploadToGPUDo: [ :uploader |
		uploader
			uploadTo: shimmerInstanceBuffer
			type: SDL3GPUTileInstance
			count: size
			cycle: false
			fillWith: [ :mapped |
				| idx |
				idx := 1.
				visibleLoadingKeys do: [ :key |
					self fillInstance: (mapped at: idx) forKey: key slot: 0 parentKey: nil.
					idx := idx + 1 ] ] ]
]

{ #category : 'hooks' }
SDL3GPUMandelbrotDemoApp >> visitKeyboardDownEvent: aKeyboardDownEvent [

	super visitKeyboardDownEvent: aKeyboardDownEvent.

	aKeyboardDownEvent key = SDLK_DOWN asInteger ifTrue: [
		loadingDelayMillis := (loadingDelayMillis - 250) max: 0.
		self updateTitle ].

	aKeyboardDownEvent key = SDLK_UP asInteger ifTrue: [
		loadingDelayMillis := loadingDelayMillis + 250.
		self updateTitle ]
]

{ #category : 'visiting - concrete' }
SDL3GPUMandelbrotDemoApp >> visitMouseMotionEvent: aMouseMotionEvent [

	| winExtent nx ny |
	super visitMouseMotionEvent: aMouseMotionEvent.

	(aMouseMotionEvent state anyMask: SDL_BUTTON_LMASK) ifFalse: [ ^ self ].

	winExtent := window extent.
	nx := aMouseMotionEvent xrel / (winExtent x max: 1) asFloat.
	ny := aMouseMotionEvent yrel / (winExtent y max: 1) asFloat.
	camera panByNormalized: nx @ ny
]

{ #category : 'visiting - concrete' }
SDL3GPUMandelbrotDemoApp >> visitMouseWheelEvent: aMouseWheelEvent [

	| factor winExtent nx ny |
	super visitMouseWheelEvent: aMouseWheelEvent.

	factor := aMouseWheelEvent y > 0 ifTrue: [ 1.25 ] ifFalse: [ 0.8 ].
	winExtent := window extent.
	nx := aMouseWheelEvent mouseX / (winExtent x max: 1) asFloat.
	ny := aMouseWheelEvent mouseY / (winExtent y max: 1) asFloat.
	camera zoomBy: factor aroundNormalizedPoint: (nx @ ny).
	self updateTitle
]

{ #category : 'visiting - concrete' }
SDL3GPUMandelbrotDemoApp >> visitWindowPixelSizeChangedEvent: aWindowPixelSizeChangedEvent [

	super visitWindowPixelSizeChangedEvent: aWindowPixelSizeChangedEvent.

	camera viewportExtent: window pixelExtent.
	self updateTitle
]

{ #category : 'visiting - concrete' }
SDL3GPUMandelbrotDemoApp >> visitWindowResizedEvent: aWindowResizedEvent [

	super visitWindowResizedEvent: aWindowResizedEvent.

	camera viewportExtent: window pixelExtent.
	self updateTitle
]
