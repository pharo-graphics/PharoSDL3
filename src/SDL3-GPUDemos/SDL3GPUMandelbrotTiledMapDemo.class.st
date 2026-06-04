"
I am a specialized demo for a tiled map with latency emulation.

I demonstrate:
- Background GPU fractal generation (compute pipeline).
- Tiled rendering with level-of-detail (LOD) transitions.
- High-quality Mandelbrot visualization (2x2 SSAA, smooth coloring).
- Asynchronous resource loading mockup with 'Shimmer' effect.
"
Class {
	#name : 'SDL3GPUMandelbrotTiledMapDemo',
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
	#category : 'SDL3-GPUDemos-TiledMap',
	#package : 'SDL3-GPUDemos',
	#tag : 'TiledMap'
}

{ #category : 'lifecycle' }
SDL3GPUMandelbrotTiledMapDemo >> close [

	computePipeline ifNotNil: [ gpuDevice releaseGPUComputePipeline: computePipeline. computePipeline := nil ].
	quadPipeline ifNotNil: [ gpuDevice releaseGPUGraphicsPipeline: quadPipeline. quadPipeline := nil ].
	shimmerPipeline ifNotNil: [ gpuDevice releaseGPUGraphicsPipeline: shimmerPipeline. shimmerPipeline := nil ].
	
	atlasTexture ifNotNil: [ gpuDevice releaseGPUTexture: atlasTexture. atlasTexture := nil ].
	sampler ifNotNil: [ gpuDevice releaseGPUSampler: sampler. sampler := nil ].
	
	vertexBuffer ifNotNil: [ gpuDevice releaseGPUBuffer: vertexBuffer. vertexBuffer := nil ].
	indexBuffer ifNotNil: [ gpuDevice releaseGPUBuffer: indexBuffer. indexBuffer := nil ].
	instanceBuffer ifNotNil: [ gpuDevice releaseGPUBuffer: instanceBuffer. instanceBuffer := nil ].
	shimmerInstanceBuffer ifNotNil: [ gpuDevice releaseGPUBuffer: shimmerInstanceBuffer. shimmerInstanceBuffer := nil ].

	super close
]

{ #category : 'rendering' }
SDL3GPUMandelbrotTiledMapDemo >> computeNewTiles [
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
SDL3GPUMandelbrotTiledMapDemo >> doRenderPassesOn: swapchainTexture with: commandBuffer [

	self uploadInstanceDataWith: commandBuffer.

	self 
		executeGraphicsPassOn: swapchainTexture 
		readyCount: visibleReadyKeys size + visibleFallbackKeys size 
		loadingCount: visibleLoadingKeys size 
		with: commandBuffer
]

{ #category : 'private' }
SDL3GPUMandelbrotTiledMapDemo >> evictTilesNotIn: aKeyCollection [
	"Evict tiles that are no longer visible"

	tileStates keys copy do: [ :k |
		(aKeyCollection includes: k) ifFalse: [
			tileStates removeKey: k.
			computedKeys remove: k ifAbsent: [ ].
			tileToSlotMap at: k ifPresent: [ :slot |
				freeSlots addLast: slot.
				tileToSlotMap removeKey: k ] ] ]
]

{ #category : 'private' }
SDL3GPUMandelbrotTiledMapDemo >> executeComputePassFor: aKeyCollection with: aCommandBuffer [

	| computePass |
	atlasBindings first texture: atlasTexture.

	computePass := aCommandBuffer
				  beginGPUComputePassStorageTextureBindings: atlasBindings
				  storageBufferBindings: #().
	computePass bindGPUComputePipeline: computePipeline.

	aKeyCollection do: [ :key | 
		| slot |
		slot := tileToSlotMap at: key ifAbsent: [ 0 ].
		self pushTileUniforms: key slot: slot with: aCommandBuffer.
		computePass
			dispatchWorkgroupCountX: tileSizePixels + 15 // 16
			y: tileSizePixels + 15 // 16
			z: 1 ].

	computePass end
]

{ #category : 'private' }
SDL3GPUMandelbrotTiledMapDemo >> executeGraphicsPassOn: swapchainTexture readyCount: aReadyCount loadingCount: aLoadingCount with: aCommandBuffer [

	| renderPass |
	colorTargetInfos first texture: swapchainTexture.
	renderPass := aCommandBuffer beginGPURenderPassColorTargetInfos: colorTargetInfos depthStencilTargetInfo: nil.

	"Pass A: Ready Tiles (Fractal) - Including Fallbacks"
	aReadyCount > 0 ifTrue: [
		renderPass bindGPUGraphicsPipeline: quadPipeline.
		renderPass bindGPUVertexBuffersFirstSlot: 0 bindings: vertexBufferBindings.

		renderPass bindGPUIndexBufferBinding: indexBufferBinding indexElementSize: SDL_GPU_INDEXELEMENTSIZE_16BIT.
		renderPass bindGPUFragmentSamplersFirstSlot: 0 textureSamplerBindings: samplerBindings.
		renderPass drawGPUIndexedPrimitivesNumIndices: 6 numInstances: aReadyCount firstIndex: 0 vertexOffset: 0 firstInstance: 0 ].

	"Pass B: Loading Tiles (Shimmer)"
	aLoadingCount > 0 ifTrue: [
		shimmerUniforms time: Time millisecondClockValue / 1000.0.
		shimmerUniforms resolutionX: window pixelExtent x; resolutionY: window pixelExtent y.
		aCommandBuffer pushGPUVertexUniformDataSlotIndex: 0 data: shimmerUniforms length: shimmerUniforms class structureSize.
		aCommandBuffer pushGPUFragmentUniformDataSlotIndex: 0 data: shimmerUniforms length: shimmerUniforms class structureSize.
		
		renderPass bindGPUGraphicsPipeline: shimmerPipeline.
		renderPass bindGPUVertexBuffersFirstSlot: 0 bindings: shimmerVertexBufferBindings.
		renderPass bindGPUIndexBufferBinding: indexBufferBinding indexElementSize: SDL_GPU_INDEXELEMENTSIZE_16BIT.
		renderPass drawGPUIndexedPrimitivesNumIndices: 6 numInstances: aLoadingCount firstIndex: 0 vertexOffset: 0 firstInstance: 0 ].

	renderPass end
]

{ #category : 'private' }
SDL3GPUMandelbrotTiledMapDemo >> fillInstance: anInstance forKey: aKey slot: aSlotIndex parentKey: aParentKey [

	| lod fractalTileSize minFractal screenRect atlasRect slotX slotY |
	lod := aKey third.
	fractalTileSize := 4.0 / (2 ** lod).
	minFractal := aKey first * fractalTileSize @ (aKey second * fractalTileSize).
	
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
		subX := aKey first \\ 2.
		subY := aKey second \\ 2.
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
SDL3GPUMandelbrotTiledMapDemo >> initialExtent [

	^ 720 @ 720
]

{ #category : 'initialization' }
SDL3GPUMandelbrotTiledMapDemo >> initialize [

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

	colorTargetInfos := FFIExternalArray
					externalNewType: SDL_GPUColorTargetInfo
					size: 1.
	colorTargetInfos autoRelease.
	colorTargetInfos first
		storeOp: SDL_GPU_STOREOP_STORE;
		loadOp: SDL_GPU_LOADOP_CLEAR;
		updateClearColorFrom: (Color r: 0.02 g: 0.02 b: 0.05).

	atlasBindings := FFIExternalArray
				externalNewType:
				SDL_GPUStorageTextureReadWriteBinding
				size: 1.
	atlasBindings autoRelease.
	atlasBindings first cycle: false.

	uniforms := SDL3GPUMandelbrotUniforms externalNew.
	uniforms autoRelease.
	
	shimmerUniforms := SDL3GPUShimmerUniforms externalNew.
	shimmerUniforms autoRelease.
	shimmerUniforms
		baseColor: (SDL3FColor r: 0.1 g: 0.1 b: 0.15 a: 1.0);
		highlightColor: (SDL3FColor r: 0.2 g: 0.2 b: 0.3 a: 1.0);
		effectType: 2; "Angled Sweep"
		cornerRadius: 0.0. "Perfectly square tiles"
	
	tileToSlotMap := Dictionary new.
	freeSlots := (0 to: (atlasSizeSlots x * atlasSizeSlots y - 1)) asOrderedCollection.
	
	vertexBufferBindings := FFIExternalArray externalNewType: SDL_GPUBufferBinding size: 2.
	vertexBufferBindings autoRelease.

	shimmerVertexBufferBindings := FFIExternalArray externalNewType: SDL_GPUBufferBinding size: 2.
	shimmerVertexBufferBindings autoRelease.
	
	indexBufferBinding := SDL_GPUBufferBinding externalNew.
	indexBufferBinding autoRelease.
	
	samplerBindings := FFIExternalArray externalNewType: SDL_GPUTextureSamplerBinding size: 1.
	samplerBindings autoRelease.
	
	loadingDelayMillis := 250.
	tileStates := Dictionary new.
	loadedKeysQueue := SharedQueue new.
	computedKeys := Set new.
	
	visibleReadyKeys := OrderedCollection new.
	visibleFallbackKeys := OrderedCollection new.
	visibleLoadingKeys := OrderedCollection new
]

{ #category : 'initialization' }
SDL3GPUMandelbrotTiledMapDemo >> initializeAtlas [

	| createInfo |
	createInfo := SDL3GPUTextureCreateInfo externalNew.
	createInfo
		type: SDL_GPU_TEXTURETYPE_2D;
		format: SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM;
		width: atlasSizeSlots x * tileSizePixels;
		height: atlasSizeSlots y * tileSizePixels;
		layerCountOrDepth: 1;
		numLevels: 1;
		usage: SDL_GPU_TEXTUREUSAGE_SAMPLER | SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE.
	
	atlasTexture := gpuDevice newGPUTextureCreateinfo: createInfo.
	createInfo free.

	sampler := gpuDevice newGPUSamplerCreateinfo: (SDL3GPUSamplerCreateInfo externalNew
		minFilter: SDL_GPU_FILTER_LINEAR;
		magFilter: SDL_GPU_FILTER_LINEAR;
		mipmapMode: SDL_GPU_SAMPLERMIPMAPMODE_LINEAR;
		addressModeU: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE;
		addressModeV: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE;
		addressModeW: SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE;
		yourself)
]

{ #category : 'initialization' }
SDL3GPUMandelbrotTiledMapDemo >> initializeGeometry [
	"Upload a standard 1x1 quad (0..1)."

	| vertices indices vTransfer iTransfer mappedAddress vSize iSize copyCommandBuffer |

	vSize := 4 * SDL3GPUQuadVertex structureSize.
	vertexBuffer := gpuDevice newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX size: vSize.
	vTransfer := gpuDevice newUploadTransferBuffer: vSize.
	mappedAddress := gpuDevice mapGPUTransferBuffer: vTransfer cycle: false.
	vertices := FFIArray fromHandle: mappedAddress type: SDL3GPUQuadVertex size: 4.
	(vertices at: 1) x: 0.0; y: 0.0; z: 0.0; u: 0.0; v: 0.0.
	(vertices at: 2) x: 1.0; y: 0.0; z: 0.0; u: 1.0; v: 0.0.
	(vertices at: 3) x: 1.0; y: 1.0; z: 0.0; u: 1.0; v: 1.0.
	(vertices at: 4) x: 0.0; y: 1.0; z: 0.0; u: 0.0; v: 1.0.
	gpuDevice unmapGPUTransferBuffer: vTransfer.

	iSize := 6 * 2.
	indexBuffer := gpuDevice newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_INDEX size: iSize.
	iTransfer := gpuDevice newUploadTransferBuffer: iSize.
	mappedAddress := gpuDevice mapGPUTransferBuffer: iTransfer cycle: false.
	indices := FFIArray fromHandle: mappedAddress type: FFIUInt16 size: 6.
	indices at: 1 put: 0; at: 2 put: 1; at: 3 put: 2; at: 4 put: 0; at: 5 put: 2; at: 6 put: 3.
	gpuDevice unmapGPUTransferBuffer: iTransfer.

	copyCommandBuffer := gpuDevice acquireGPUCommandBuffer.
	copyCommandBuffer beginGPUCopyPass
		uploadToGPUBufferSource: (SDL_GPUTransferBufferLocation new transferBuffer: vTransfer; offset: 0; yourself) destination: (SDL_GPUBufferRegion new buffer: vertexBuffer; offset: 0; size: vSize; yourself) cycle: false;
		uploadToGPUBufferSource: (SDL_GPUTransferBufferLocation new transferBuffer: iTransfer; offset: 0; yourself) destination: (SDL_GPUBufferRegion new buffer: indexBuffer; offset: 0; size: iSize; yourself) cycle: false;
		end.
	copyCommandBuffer submit.
	
	gpuDevice releaseGPUTransferBuffer: vTransfer.
	gpuDevice releaseGPUTransferBuffer: iTransfer.

	"Pre-allocate instance buffers for up to 256 tiles"
	instanceBuffer := gpuDevice 
		newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX 
		size: 256 * SDL3GPUTileInstance structureSize.

	shimmerInstanceBuffer := gpuDevice 
		newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX 
		size: 256 * SDL3GPUTileInstance structureSize.

	vertexBufferBindings first buffer: vertexBuffer; offset: 0.
	vertexBufferBindings second buffer: instanceBuffer; offset: 0.

	shimmerVertexBufferBindings first buffer: vertexBuffer; offset: 0.
	shimmerVertexBufferBindings second buffer: shimmerInstanceBuffer; offset: 0.

	indexBufferBinding buffer: indexBuffer; offset: 0.

	samplerBindings first texture: atlasTexture; sampler: sampler
]

{ #category : 'private' }
SDL3GPUMandelbrotTiledMapDemo >> initializeQuadPipelineWith: formats colorTargets: colorTargets [

	| quadVertexSource quadFragmentSource vertexBindings vertexAttributes pipelineCreateInfo |
	quadVertexSource := SDL3GPUTiledMapVertexShaderSource
							newShaderAmong: formats
							device: gpuDevice.
	quadFragmentSource := SDL3GPUQuadFragmentShaderSource
							 newShaderAmong: formats
							 device: gpuDevice.

	colorTargets first blendState: SDL_GPUColorTargetBlendState new.

	vertexBindings := self newTiledMapVertexBindings.
	vertexAttributes := self newTiledMapVertexAttributes.

	pipelineCreateInfo := SDL3GPUGraphicsPipelineCreateInfo externalNew.
	pipelineCreateInfo autoRelease.
	pipelineCreateInfo
		primitiveType: SDL_GPU_PRIMITIVETYPE_TRIANGLELIST;
		vertexShader: quadVertexSource;
		fragmentShader: quadFragmentSource.
	pipelineCreateInfo targetInfo
		colorTargetDescriptions: colorTargets;
		numColorTargets: 1;
		hasDepthStencilTarget: false.
	pipelineCreateInfo vertexInputState
		vertexAttributes: vertexAttributes;
		numVertexAttributes: 4;
		vertexBufferDescriptions: vertexBindings;
		numVertexBuffers: 2.

	quadPipeline := gpuDevice newGPUGraphicsPipelineCreateinfo:
						pipelineCreateInfo.

	gpuDevice releaseGPUShader: quadVertexSource.
	gpuDevice releaseGPUShader: quadFragmentSource
]

{ #category : 'initialization' }
SDL3GPUMandelbrotTiledMapDemo >> initializeShaders [

	| formats colorTargets |
	formats := gpuDevice gpuShaderFormatsAsArray.

	computePipeline := SDL3GPUMandelbrotComputeShaderSource
						  newComputePipelineAmong: formats
						  device: gpuDevice.

	colorTargets := self newColorTargetDescriptions: 1.
	colorTargets first format:
		(gpuDevice getGPUSwapchainTextureFormatIntoWindow: window).

	self initializeQuadPipelineWith: formats colorTargets: colorTargets.
	self initializeShimmerPipelineWith: formats colorTargets: colorTargets
]

{ #category : 'private' }
SDL3GPUMandelbrotTiledMapDemo >> initializeShimmerPipelineWith: formats colorTargets: colorTargets [

	| shimmerVertexSource shimmerFragmentSource shimmerVertexBindings shimmerVertexAttributes pipelineCreateInfo |
	shimmerVertexSource := SDL3GPUShimmerVertexShaderSource
							  newShaderAmong: formats
							  device: gpuDevice.
	shimmerFragmentSource := SDL3GPUShimmerFragmentShaderSource
								newShaderAmong: formats
								device: gpuDevice.

	colorTargets first blendState: (SDL_GPUColorTargetBlendState new
			enableBlend: true;
			srcColorBlendfactor: SDL_GPU_BLENDFACTOR_SRC_ALPHA;
			dstColorBlendfactor: SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA;
			colorBlendOp: SDL_GPU_BLENDOP_ADD;
			srcAlphaBlendfactor: SDL_GPU_BLENDFACTOR_ONE;
			dstAlphaBlendfactor: SDL_GPU_BLENDFACTOR_ZERO;
			alphaBlendOp: SDL_GPU_BLENDOP_ADD;
			yourself).

	shimmerVertexBindings := self newTiledMapVertexBindings.
	shimmerVertexAttributes := self newTiledMapVertexAttributes.

	pipelineCreateInfo := SDL3GPUGraphicsPipelineCreateInfo externalNew.
	pipelineCreateInfo autoRelease.
	pipelineCreateInfo
		primitiveType: SDL_GPU_PRIMITIVETYPE_TRIANGLELIST;
		vertexShader: shimmerVertexSource;
		fragmentShader: shimmerFragmentSource.
	pipelineCreateInfo targetInfo
		colorTargetDescriptions: colorTargets;
		numColorTargets: 1;
		hasDepthStencilTarget: false.
	pipelineCreateInfo vertexInputState
		vertexAttributes: shimmerVertexAttributes;
		numVertexAttributes: 4;
		vertexBufferDescriptions: shimmerVertexBindings;
		numVertexBuffers: 2.

	shimmerPipeline := gpuDevice newGPUGraphicsPipelineCreateinfo:
						  pipelineCreateInfo.

	gpuDevice releaseGPUShader: shimmerVertexSource.
	gpuDevice releaseGPUShader: shimmerFragmentSource
]

{ #category : 'private' }
SDL3GPUMandelbrotTiledMapDemo >> newTiledMapVertexAttributes [

	| vertexAttributes |
	vertexAttributes := FFIExternalArray
							externalNewType: SDL_GPUVertexAttribute
							size: 4.
	vertexAttributes autoRelease.
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
	(vertexAttributes at: 3)
		bufferSlot: 1;
		format: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT4;
		location: 2;
		offset: 0.
	(vertexAttributes at: 4)
		bufferSlot: 1;
		format: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT4;
		location: 3;
		offset: 4 * FFIFloat32 externalTypeSize.
	^ vertexAttributes
]

{ #category : 'private' }
SDL3GPUMandelbrotTiledMapDemo >> newTiledMapVertexBindings [

	| vertexBindings |
	vertexBindings := FFIExternalArray
						 externalNewType: SDL_GPUVertexBufferDescription
						 size: 2.
	vertexBindings autoRelease.
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
SDL3GPUMandelbrotTiledMapDemo >> prepareToLoop [

	super prepareToLoop.
	self initializeAtlas.
	self initializeShaders.
	self initializeGeometry
]

{ #category : 'private' }
SDL3GPUMandelbrotTiledMapDemo >> processLoadedKeysQueue [
	"Process loaded keys from the background thread"

	| toProcess |
	toProcess := OrderedCollection new.
	[ loadedKeysQueue isEmpty ] whileFalse: [ toProcess add: loadedKeysQueue next ].
	
	toProcess do: [ :loadedKey |
		(tileStates includesKey: loadedKey) ifTrue: [
			freeSlots ifNotEmpty: [
				tileToSlotMap at: loadedKey put: freeSlots removeFirst.
				tileStates at: loadedKey put: #ready.
			] ifEmpty: [
				loadedKeysQueue nextPut: loadedKey.
			].
		].
	]
]

{ #category : 'private' }
SDL3GPUMandelbrotTiledMapDemo >> pushTileUniforms: aKey slot: aSlot with: aCommandBuffer [
	"Push compute uniforms for a specific tile."
	
	| lod fractalTileSize minX minY |
	lod := aKey third.
	fractalTileSize := 4.0 / (2 ** lod).
	
	minX := aKey first * fractalTileSize.
	minY := aKey second * fractalTileSize.
	
	uniforms 
		x1: minX asFloat;
		y1: minY asFloat;
		x2: (minX + fractalTileSize) asFloat;
		y2: (minY + fractalTileSize) asFloat;
		maxIterations: 256;
		atlasSlot: aSlot;
		tileSize: tileSizePixels.
		
	aCommandBuffer pushGPUComputeUniformDataSlotIndex: 0 data: uniforms length: SDL3GPUMandelbrotUniforms structureSize
]

{ #category : 'private' }
SDL3GPUMandelbrotTiledMapDemo >> requestTile: aKey [
	"Emulate loading latency with jitter."
	
	| jitteredDelay |
	loadingDelayMillis = 0 ifTrue: [
		freeSlots ifNotEmpty: [
			tileToSlotMap at: aKey put: freeSlots removeFirst.
			^ tileStates at: aKey put: #ready ] ].
	
	"Emulate latency to load tiles (50% to 150% of the base parameter)"
	jitteredDelay := (loadingDelayMillis * 0.5) +
		(loadingDelayMillis * SharedRandom globalGenerator next).
	[	(Delay forMilliseconds: jitteredDelay truncated) wait.
		loadedKeysQueue nextPut: aKey ] forkAt: Processor activePriority + 1.
	
	^ tileStates at: aKey put: #loading
]

{ #category : 'hooks' }
SDL3GPUMandelbrotTiledMapDemo >> step [

	self updateTiles.
	self computeNewTiles.
	self updateTitle.
	super step
]

{ #category : 'rendering' }
SDL3GPUMandelbrotTiledMapDemo >> updateTiles [
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
SDL3GPUMandelbrotTiledMapDemo >> updatedTitle [

	| readyCount loadingCount |
	readyCount := tileStates values count: [ :each | each = #ready ].
	loadingCount := tileStates values count: [ :each | each = #loading ].

	^ super updatedTitle, (' - Emulated Latency: {1}ms - Zoom: {2} - Tiles: {3} ready, {4} loading' 
		format: { 
			loadingDelayMillis. 
			camera zoomLevel printShowingDecimalPlaces: 2.
			readyCount.
			loadingCount })
]

{ #category : 'private' }
SDL3GPUMandelbrotTiledMapDemo >> uploadInstanceDataWith: aCommandBuffer [

	| transfer mapped size idx |
	
	"1. Ready and Fallback instances (shared buffer)"
	size := visibleReadyKeys size + visibleFallbackKeys size.
	size > 0 ifTrue: [
		transfer := gpuDevice newUploadTransferBuffer: size * SDL3GPUTileInstance structureSize.
		mapped := FFIArray fromHandle: (gpuDevice mapGPUTransferBuffer: transfer cycle: false) type: SDL3GPUTileInstance size: size.
		idx := 1.
		visibleReadyKeys do: [ :key |
			self fillInstance: (mapped at: idx) forKey: key slot: (tileToSlotMap at: key) parentKey: nil.
			idx := idx + 1 ].
		visibleFallbackKeys do: [ :pair |
			self fillInstance: (mapped at: idx) forKey: pair first slot: (tileToSlotMap at: pair second) parentKey: pair second.
			idx := idx + 1 ].
		gpuDevice unmapGPUTransferBuffer: transfer.
		[ :copyPass |
			copyPass uploadToGPUBufferSource: (SDL_GPUTransferBufferLocation new transferBuffer: transfer; offset: 0; yourself) 
				destination: (SDL_GPUBufferRegion new buffer: instanceBuffer; offset: 0; size: size * SDL3GPUTileInstance structureSize; yourself) 
				cycle: false.
			copyPass end.
		] value: aCommandBuffer beginGPUCopyPass.
		gpuDevice releaseGPUTransferBuffer: transfer ].

	"2. Loading (Shimmer) instances"
	size := visibleLoadingKeys size.
	size > 0 ifTrue: [
		transfer := gpuDevice newUploadTransferBuffer: size * SDL3GPUTileInstance structureSize.
		mapped := FFIArray fromHandle: (gpuDevice mapGPUTransferBuffer: transfer cycle: false) type: SDL3GPUTileInstance size: size.
		idx := 1.
		visibleLoadingKeys do: [ :key |
			self fillInstance: (mapped at: idx) forKey: key slot: 0 parentKey: nil.
			idx := idx + 1 ].
		gpuDevice unmapGPUTransferBuffer: transfer.
		[ :copyPass |
			copyPass uploadToGPUBufferSource: (SDL_GPUTransferBufferLocation new transferBuffer: transfer; offset: 0; yourself) 
				destination: (SDL_GPUBufferRegion new buffer: shimmerInstanceBuffer; offset: 0; size: size * SDL3GPUTileInstance structureSize; yourself) 
				cycle: false.
			copyPass end.
		] value: aCommandBuffer beginGPUCopyPass.
		gpuDevice releaseGPUTransferBuffer: transfer ]
]

{ #category : 'hooks' }
SDL3GPUMandelbrotTiledMapDemo >> visitKeyboardDownEvent: aKeyboardDownEvent [

	super visitKeyboardDownEvent: aKeyboardDownEvent.

	aKeyboardDownEvent key = SDLK_DOWN asInteger ifTrue: [
		loadingDelayMillis := (loadingDelayMillis - 250) max: 0.
		self updateTitle ].

	aKeyboardDownEvent key = SDLK_UP asInteger ifTrue: [
		loadingDelayMillis := loadingDelayMillis + 250.
		self updateTitle ]
]

{ #category : 'visiting - concrete' }
SDL3GPUMandelbrotTiledMapDemo >> visitMouseMotionEvent: aMouseMotionEvent [

	| winExtent nx ny |
	super visitMouseMotionEvent: aMouseMotionEvent.

	(aMouseMotionEvent state anyMask: SDL_BUTTON_LMASK) ifFalse: [ ^ self ].

	winExtent := window extent.
	nx := aMouseMotionEvent xrel / (winExtent x max: 1) asFloat.
	ny := aMouseMotionEvent yrel / (winExtent y max: 1) asFloat.
	camera panByNormalized: nx @ ny
]

{ #category : 'visiting - concrete' }
SDL3GPUMandelbrotTiledMapDemo >> visitMouseWheelEvent: aMouseWheelEvent [

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
SDL3GPUMandelbrotTiledMapDemo >> visitWindowPixelSizeChangedEvent: aWindowPixelSizeChangedEvent [

	super visitWindowPixelSizeChangedEvent: aWindowPixelSizeChangedEvent.

	camera viewportExtent: window pixelExtent.
	self updateTitle
]

{ #category : 'visiting - concrete' }
SDL3GPUMandelbrotTiledMapDemo >> visitWindowResizedEvent: aWindowResizedEvent [

	super visitWindowResizedEvent: aWindowResizedEvent.

	camera viewportExtent: window pixelExtent.
	self updateTitle
]
