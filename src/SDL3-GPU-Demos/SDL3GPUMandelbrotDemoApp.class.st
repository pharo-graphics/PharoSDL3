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
		'atlasTexture',
		'computePipeline',
		'quadPipeline',
		'shimmerPipeline',
		'shimmerUniforms',
		'atlasSizeSlots',
		'tileSizePixels',
		'vertexBuffer',
		'indexBuffer',
		'colorTargetInfos',
		'uniforms',
		'sampler',
		'tileToSlotMap',
		'freeSlots',
		'instanceBuffer',
		'shimmerInstanceBuffer',
		'vertexBufferBindings',
		'shimmerVertexBufferBindings',
		'indexBufferBinding',
		'samplerBindings',
		'loadingDelayMillis',
		'tileStates',
		'loadedKeysQueue',
		'computedKeys',
		'visibleReadyKeys',
		'visibleFallbackKeys',
		'visibleLoadingKeys',
		'atlasBindings'
	],
	#category : 'SDL3-GPU-Demos-TiledMap',
	#package : 'SDL3-GPU-Demos',
	#tag : 'TiledMap'
}

{ #category : 'lifecycle' }
SDL3GPUMandelbrotDemoApp >> close [

	computePipeline ifNotNil: [ computePipeline release. computePipeline := nil ].
	quadPipeline ifNotNil: [ quadPipeline release. quadPipeline := nil ].
	shimmerPipeline ifNotNil: [ shimmerPipeline release. shimmerPipeline := nil ].

	atlasTexture ifNotNil: [ atlasTexture release. atlasTexture := nil ].
	sampler ifNotNil: [ sampler release. sampler := nil ].

	vertexBuffer ifNotNil: [ vertexBuffer release. vertexBuffer := nil ].
	indexBuffer ifNotNil: [ indexBuffer release. indexBuffer := nil ].
	instanceBuffer ifNotNil: [ instanceBuffer release. instanceBuffer := nil ].
	shimmerInstanceBuffer ifNotNil: [ shimmerInstanceBuffer release. shimmerInstanceBuffer := nil ].

	super close
]

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

	colorTargetInfos := SDL_GPUColorTargetInfo safeNewArray: 1.
	colorTargetInfos first
		beClear: (Color r: 0.02 g: 0.02 b: 0.05).

	atlasBindings := SDL3GPUStorageTextureReadWriteBinding safeNewArray: 1.
	atlasBindings first beUnbound.

	uniforms := SDL3GPUMandelbrotUniforms safeNew.

	shimmerUniforms := SDL3GPUShimmerUniforms safeNew.
	shimmerUniforms
		baseColor: (SDL3FColor r: 0.1 g: 0.1 b: 0.15 a: 1.0);
		highlightColor: (SDL3FColor r: 0.2 g: 0.2 b: 0.3 a: 1.0);
		effectType: 2; "Angled Sweep"
		cornerRadius: 0.0. "Perfectly square tiles"

	tileToSlotMap := Dictionary new.
	freeSlots := (0 to: (atlasSizeSlots x * atlasSizeSlots y - 1)) asOrderedCollection.

	vertexBufferBindings := SDL_GPUBufferBinding safeNewArray: 2.

	shimmerVertexBufferBindings := SDL_GPUBufferBinding safeNewArray: 2.

	indexBufferBinding := SDL_GPUBufferBinding offset: 0.

	samplerBindings := SDL_GPUTextureSamplerBinding safeNewArray: 1.

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

	atlasTexture := gpuDevice newTexture: [ :info |
		info
			type: SDL_GPU_TEXTURETYPE_2D;
			format: SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM;
			width: atlasSizeSlots x * tileSizePixels;
			height: atlasSizeSlots y * tileSizePixels;
			layerCountOrDepth: 1;
			numLevels: 1;
			usage: SDL_GPU_TEXTUREUSAGE_SAMPLER | SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE ].

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
	instanceBuffer := gpuDevice
		                  newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX
		                  size: 256 * SDL3GPUTileInstance structureSize.

	shimmerInstanceBuffer := gpuDevice
		                         newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX
		                         size: 256 * SDL3GPUTileInstance structureSize
]

{ #category : 'initialization' }
SDL3GPUMandelbrotDemoApp >> initializeQuadBuffers [

	vertexBuffer := gpuDevice
		                newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX
		                size: 4 * SDL3GPUQuadVertex structureSize.

	indexBuffer := gpuDevice
		               newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_INDEX
		               size: 6 * 2.

	gpuDevice uploadToGPUDo: [ :uploader |
		uploader
			uploadTo: vertexBuffer
			type: SDL3GPUQuadVertex
			count: 4
			cycle: false
			fillWith: [ :vertices |
				vertices first
					x: 0.0;
					y: 0.0;
					z: 0.0;
					u: 0.0;
					v: 0.0.
				vertices second
					x: 1.0;
					y: 0.0;
					z: 0.0;
					u: 1.0;
					v: 0.0.
				vertices third
					x: 1.0;
					y: 1.0;
					z: 0.0;
					u: 1.0;
					v: 1.0.
				vertices fourth
					x: 0.0;
					y: 1.0;
					z: 0.0;
					u: 0.0;
					v: 1.0 ].

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

{ #category : 'private' }
SDL3GPUMandelbrotDemoApp >> initializeQuadPipelineWith: formats colorTargets: colorTargets [

	| quadVertexSource quadFragmentSource vertexBindings vertexAttributes |

	quadVertexSource := SDL3GPUTiledMapVertexShaderSource
							newShaderAmong: formats
							device: gpuDevice.
	quadFragmentSource := SDL3GPUQuadFragmentShaderSource
							 newShaderAmong: formats
							 device: gpuDevice.

	colorTargets first blendState: SDL_GPUColorTargetBlendState new.

	vertexBindings := self newTiledMapVertexBindings.
	vertexAttributes := self newTiledMapVertexAttributes.

	quadPipeline := gpuDevice newGraphicsPipeline: [ :info |
		info
			vertex: quadVertexSource
			fragment: quadFragmentSource
			targets: colorTargets.
		info vertexInputState
			attributes: vertexAttributes
			bindings: vertexBindings ].

	quadVertexSource release.
	quadFragmentSource release
]

{ #category : 'initialization' }
SDL3GPUMandelbrotDemoApp >> initializeShaders [

	| colorTargets |
	computePipeline := SDL3GPUMandelbrotComputeShaderSource
						  newComputePipelineAmong: shaderFormats
						  device: gpuDevice.

	colorTargets := SDL_GPUColorTargetDescription safeNewArray: 1.
	colorTargets first format:
		(gpuDevice getGPUSwapchainTextureFormatIntoWindow: window).

	self initializeQuadPipelineWith: shaderFormats colorTargets: colorTargets.
	self initializeShimmerPipelineWith: shaderFormats colorTargets: colorTargets
]

{ #category : 'private' }
SDL3GPUMandelbrotDemoApp >> initializeShimmerPipelineWith: formats colorTargets: colorTargets [

	| shimmerVertexSource shimmerFragmentSource shimmerVertexBindings shimmerVertexAttributes |

	shimmerVertexSource := SDL3GPUShimmerVertexShaderSource
							  newShaderAmong: formats
							  device: gpuDevice.
	shimmerFragmentSource := SDL3GPUShimmerFragmentShaderSource
								newShaderAmong: formats
								device: gpuDevice.

	colorTargets first blendState: SDL_GPUColorTargetBlendState newAlphaBlend.

	shimmerVertexBindings := self newTiledMapVertexBindings.
	shimmerVertexAttributes := self newTiledMapVertexAttributes.

	shimmerPipeline := gpuDevice newGraphicsPipeline: [ :info |
		info
			vertex: shimmerVertexSource
			fragment: shimmerFragmentSource
			targets: colorTargets.
		info vertexInputState
			attributes: shimmerVertexAttributes
			bindings: shimmerVertexBindings ].

	shimmerVertexSource release.
	shimmerFragmentSource release
]

{ #category : 'private' }
SDL3GPUMandelbrotDemoApp >> newTiledMapVertexAttributes [

	| vertexAttributes |
	vertexAttributes := SDL_GPUVertexAttribute safeNewArray: 4.

	vertexAttributes first
		bufferSlot: 0;
		format: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT3;
		location: 0;
		offset: 0.
	vertexAttributes second
		bufferSlot: 0;
		format: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT2;
		location: 1;
		offset: 3 * FFIFloat32 externalTypeSize.
	vertexAttributes third
		bufferSlot: 1;
		format: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT4;
		location: 2;
		offset: 0.
	vertexAttributes fourth
		bufferSlot: 1;
		format: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT4;
		location: 3;
		offset: 4 * FFIFloat32 externalTypeSize.

	^ vertexAttributes
]

{ #category : 'private' }
SDL3GPUMandelbrotDemoApp >> newTiledMapVertexBindings [

	| vertexBindings |
	vertexBindings := SDL_GPUVertexBufferDescription safeNewArray: 2.

	vertexBindings first
		slot: 0;
		pitch: SDL3GPUQuadVertex structureSize;
		inputRate: SDL_GPU_VERTEXINPUTRATE_VERTEX;
		instanceStepRate: 0.

	vertexBindings second
		slot: 1;
		pitch: SDL3GPUTileInstance structureSize;
		inputRate: SDL_GPU_VERTEXINPUTRATE_INSTANCE;
		instanceStepRate: 0.

	^ vertexBindings
]

{ #category : 'lifecycle' }
SDL3GPUMandelbrotDemoApp >> prepareToLoop [

	super prepareToLoop.
	self initializeAtlas.
	self initializeShaders.
	self initializeGeometry
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
