"
I demonstrate boids flocking using a compute-to-vertex-buffer architecture.
"
Class {
	#name : 'SDL3GPUBoidsDemo',
	#superclass : 'SDL3GPUClearDemo',
	#instVars : [
		'boidsBufferPing',
		'boidsBufferPong',
		'currentBoidsBuffer',
		'vertexBuffer',
		'indexBuffer',
		'geometryComputePipeline',
		'renderPipeline',
		'numBoids',
		'vertexBufferBindings',
		'storageBufferBinding',
		'boidsComputePipeline',
		'storageBuffers',
		'indexBufferBinding',
		'colorTargetInfo',
		'boidsUniforms',
		'geometryUniforms',
		'frameCount',
		'lastFpsTime',
		'currentFps',
		'huesBuffer'
	],
	#category : 'SDL3-GPUDemos-Boids',
	#package : 'SDL3-GPUDemos',
	#tag : 'Boids'
}

{ #category : 'lifecycle' }
SDL3GPUBoidsDemo >> close [

	boidsBufferPing ifNotNil: [
		gpuDevice releaseGPUBuffer: boidsBufferPing.
		boidsBufferPing := nil ].
	
	boidsBufferPong ifNotNil: [
		gpuDevice releaseGPUBuffer: boidsBufferPong.
		boidsBufferPong := nil ].

	huesBuffer ifNotNil: [
		gpuDevice releaseGPUBuffer: huesBuffer.
		huesBuffer := nil ].

	vertexBuffer ifNotNil: [
		gpuDevice releaseGPUBuffer: vertexBuffer.
		vertexBuffer := nil ].

	indexBuffer ifNotNil: [
		gpuDevice releaseGPUBuffer: indexBuffer.
		indexBuffer := nil ].

	boidsComputePipeline ifNotNil: [
		gpuDevice releaseGPUComputePipeline: boidsComputePipeline.
		boidsComputePipeline := nil ].

	geometryComputePipeline ifNotNil: [
		gpuDevice releaseGPUComputePipeline: geometryComputePipeline.
		geometryComputePipeline := nil ].

	renderPipeline ifNotNil: [
		gpuDevice releaseGPUGraphicsPipeline: renderPipeline.
		renderPipeline := nil ].

	super close
]

{ #category : 'rendering' }
SDL3GPUBoidsDemo >> doGeometryPassWith: aCommandBuffer input: inputBuffer [

	| computePass extent |
	extent := window extent.
	
	"Aspect ratio bounds calculation: keep the minimum dimension mapped to [-1, 1]"
	extent x > extent y 
		ifTrue: [
			geometryUniforms boundX: (extent x asFloat / extent y asFloat).
			geometryUniforms boundY: 1.0 ]
		ifFalse: [
			geometryUniforms boundX: 1.0.
			geometryUniforms boundY: (extent y asFloat / extent x asFloat) ].

	geometryUniforms
		numBoids: numBoids;
		boidRadius: 0.05.

	aCommandBuffer
		pushGPUComputeUniformDataSlotIndex: 0
		data: geometryUniforms
		length: geometryUniforms class structureSize.

	storageBufferBinding first 
		buffer: vertexBuffer; 
		cycle: false.

	computePass := aCommandBuffer
		beginGPUComputePassStorageTextureBindings: nil
		numStorageTextureBindings: 0
		storageBufferBindings: storageBufferBinding
		numStorageBufferBindings: 1.

	storageBuffers at: 1 put: inputBuffer getHandle.
	storageBuffers at: 2 put: huesBuffer getHandle.

	computePass
		bindGPUComputePipeline: geometryComputePipeline;
		bindGPUComputeStorageBuffersFirstSlot: 0 
		storageBuffers: storageBuffers
		numBindings: 2;
		dispatchWorkgroupCountX: ((numBoids + 63) // 64) y: 1 z: 1;
		end
]

{ #category : 'rendering' }
SDL3GPUBoidsDemo >> doPhysicsPassWith: aCommandBuffer input: inputBuffer output: outputBuffer [

	| extent |
	extent := window extent.
	
	"Aspect ratio bounds calculation: keep the minimum dimension mapped to [-1, 1]"
	extent x > extent y 
		ifTrue: [
			boidsUniforms boundX: (extent x asFloat / extent y asFloat).
			boidsUniforms boundY: 1.0 ]
		ifFalse: [
			boidsUniforms boundX: 1.0.
			boidsUniforms boundY: (extent y asFloat / extent x asFloat) ].

	boidsUniforms time: Time millisecondClockValue / 1000.0.

	aCommandBuffer
		pushGPUComputeUniformDataSlotIndex: 0
		data: boidsUniforms
		length: boidsUniforms class structureSize.

	storageBuffers at: 1 put: inputBuffer getHandle.

	storageBufferBinding first
		buffer: outputBuffer; 
		cycle: false.

	(aCommandBuffer
		beginGPUComputePassStorageTextureBindings: nil
		numStorageTextureBindings: 0
		storageBufferBindings: storageBufferBinding
		numStorageBufferBindings: 1)
			bindGPUComputePipeline: boidsComputePipeline;
			bindGPUComputeStorageBuffersFirstSlot: 0 
				storageBuffers: storageBuffers
				numBindings: 1;
			dispatchWorkgroupCountX: ((numBoids + 63) // 64) y: 1 z: 1;
			end
]

{ #category : 'rendering' }
SDL3GPUBoidsDemo >> doRenderPassesOn: swapchainTexture with: aCommandBuffer [

	| renderPass |
	colorTargetInfo texture: swapchainTexture.

	renderPass := aCommandBuffer
		beginGPURenderPassColorTargetInfos: colorTargetInfo
		numColorTargets: 1
		depthStencilTargetInfo: nil.
	renderPass assertNotNullReturn.

	renderPass bindGPUGraphicsPipeline: renderPipeline.
	
	renderPass
		bindGPUVertexBuffersFirstSlot: 0 
		bindings: vertexBufferBindings 
		numBindings: vertexBufferBindings size.

	renderPass
		bindGPUIndexBufferBinding: indexBufferBinding 
		indexElementSize: SDL_GPU_INDEXELEMENTSIZE_16BIT.

	renderPass
		drawGPUIndexedPrimitivesNumIndices: numBoids * 3
		numInstances: 1
		firstIndex: 0
		vertexOffset: 0
		firstInstance: 0.

	renderPass end
]

{ #category : 'events' }
SDL3GPUBoidsDemo >> handleKeyDown: aKeyboardEvent [

	| key |
	key := aKeyboardEvent key.
	
	"Weights"
	key = SDLK_Q asInteger ifTrue: [ ^ boidsUniforms separationWeight: boidsUniforms separationWeight + 0.1 ].
	key = SDLK_A asInteger ifTrue: [ ^ boidsUniforms separationWeight: ((boidsUniforms separationWeight - 0.1) max: 0) ].
	key = SDLK_W asInteger ifTrue: [ ^ boidsUniforms alignmentWeight: boidsUniforms alignmentWeight + 0.1 ].
	key = SDLK_S asInteger ifTrue: [ ^ boidsUniforms alignmentWeight: ((boidsUniforms alignmentWeight - 0.1) max: 0) ].
	key = SDLK_E asInteger ifTrue: [ ^ boidsUniforms cohesionWeight: boidsUniforms cohesionWeight + 0.1 ].
	key = SDLK_D asInteger ifTrue: [ ^ boidsUniforms cohesionWeight: ((boidsUniforms cohesionWeight - 0.1) max: 0) ].
	
	"Radii"
	key = SDLK_T asInteger ifTrue: [ ^ boidsUniforms neighborRadius: boidsUniforms neighborRadius + 0.01 ].
	key = SDLK_G asInteger ifTrue: [ ^ boidsUniforms neighborRadius: ((boidsUniforms neighborRadius - 0.01) max: 0.01) ].
	key = SDLK_R asInteger ifTrue: [ ^ boidsUniforms separationRadius: boidsUniforms separationRadius + 0.01 ].
	key = SDLK_F asInteger ifTrue: [ ^ boidsUniforms separationRadius: ((boidsUniforms separationRadius - 0.01) max: 0.01) ].

	"Speed"
	key = SDLK_Z asInteger ifTrue: [ ^ boidsUniforms maxVelocity: boidsUniforms maxVelocity + 0.05 ].
	key = SDLK_X asInteger ifTrue: [ ^ boidsUniforms maxVelocity: ((boidsUniforms maxVelocity - 0.05) max: 0.05) ]
]

{ #category : 'initialization' }
SDL3GPUBoidsDemo >> initialize [
	super initialize.

	initialExtent := 720 @ 720.
	initialWindowFlags := SDL3WindowFlags inputFocus | SDL3WindowFlags resizable.

	numBoids := 1000.

	vertexBufferBindings := FFIArray newType: SDL_GPUBufferBinding size: 1.

	storageBuffers := FFIArray newType: ExternalAddress size: 2.

	storageBufferBinding := FFIArray newType: SDL_GPUStorageBufferReadWriteBinding size: 1.

	colorTargetInfo := SDL_GPUColorTargetInfo new.
	colorTargetInfo
		storeOp: SDL_GPU_STOREOP_STORE;
		loadOp: SDL_GPU_LOADOP_CLEAR.
	colorTargetInfo clearColor r: 0.0; g: 0.0; b: 0.2; a: 1.0.

	"Simulation defaults"
	boidsUniforms := SDL3GPUBoidsUniforms new.
	boidsUniforms
		numBoids: numBoids;
		separationWeight: 1.5;
		alignmentWeight: 1.0;
		cohesionWeight: 1.0;
		separationRadius: 0.05;
		neighborRadius: 0.2;
		maxVelocity: 2.0;
		minVelocity: 0.5;
		damping: 0.99;
		deltaTime: 0.016.

	geometryUniforms := SDL3GPUBoidsGeometryUniforms new.

	frameCount := 0.
	lastFpsTime := Time millisecondClockValue.
	currentFps := 0
]

{ #category : 'initialization' }
SDL3GPUBoidsDemo >> initializeBuffers [

	"Boids Buffers (Physics Ping-Pong)"
	boidsBufferPing := gpuDevice
		newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE | SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ
		size: numBoids * SDL3GPUBoidsBoid structureSize.

	boidsBufferPong := gpuDevice
		newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE | SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ
		size: numBoids * SDL3GPUBoidsBoid structureSize.

	currentBoidsBuffer := boidsBufferPing.

	"Hues Buffer (Static)"
	huesBuffer := gpuDevice
		newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ
		size: numBoids * FFIFloat32 externalTypeSize. "4 bytes per float"

	"Vertex Buffer (Geometry Output)"
	"3 vertices per boid"
	vertexBuffer := gpuDevice
		newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX | SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE
		size: numBoids * 3 * SDL3GPUBoidsVertex structureSize.

	vertexBufferBindings first 
		buffer: vertexBuffer;
		offset: 0.

	storageBufferBinding first 
		buffer: vertexBuffer; 
		cycle: false.

	"Index Buffer"
	"3 indices per boid"
	indexBuffer := gpuDevice
		newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_INDEX
		size: numBoids * 3 * 2. "16-bit"

	indexBufferBinding := SDL_GPUBufferBinding new buffer: indexBuffer; yourself.
]

{ #category : 'initialization' }
SDL3GPUBoidsDemo >> initializeComputeResources [

	boidsComputePipeline := SDL3GPUBoidsComputeShaderSource
		newComputePipelineAmong: shaderFormats
		device: gpuDevice.

	geometryComputePipeline := SDL3GPUBoidsGeometryComputeShaderSource
		newComputePipelineAmong: shaderFormats
		device: gpuDevice
]

{ #category : 'initialization' }
SDL3GPUBoidsDemo >> initializeRenderPipeline [

	| vertexShader fragmentShader vertexBindings vertexAttributes colorTargets pipelineCreateInfo |
	vertexShader :=
		SDL3GPUBoidsVertexShaderSource
			newShaderAmong: shaderFormats
			device: gpuDevice.
	fragmentShader :=
		SDL3GPUBoidsFragmentShaderSource
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
		pitch: 16. "float2 + float + float pad = 16 bytes"

	vertexAttributes :=
		FFIExternalArray
			externalNewType: SDL_GPUVertexAttribute
			size: 2.
	vertexAttributes first
		bufferSlot: 0;
		format: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT2;
		location: 0;
		offset: 0.
	vertexAttributes second
		bufferSlot: 0;
		format: SDL_GPU_VERTEXELEMENTFORMAT_FLOAT;
		location: 1;
		offset: 8.

	colorTargets :=
		FFIExternalArray
			externalNewType: SDL_GPUColorTargetDescription
			size: 1.
	colorTargets first 
		format: (gpuDevice getGPUSwapchainTextureFormatIntoWindow: window);
		blendState:
			(SDL_GPUColorTargetBlendState new
				enableBlend: true;
				srcColorBlendfactor: SDL_GPU_BLENDFACTOR_SRC_ALPHA;
				dstColorBlendfactor: SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA;
				colorBlendOp: SDL_GPU_BLENDOP_ADD;
				srcAlphaBlendfactor: SDL_GPU_BLENDFACTOR_SRC_ALPHA;
				dstAlphaBlendfactor: SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA;
				alphaBlendOp: SDL_GPU_BLENDOP_ADD;
				yourself).

	pipelineCreateInfo := SDL3GPUGraphicsPipelineCreateInfo new.
	pipelineCreateInfo
		primitiveType: SDL_GPU_PRIMITIVETYPE_TRIANGLELIST;
		vertexShader: vertexShader;
		fragmentShader: fragmentShader.
	pipelineCreateInfo targetInfo
		colorTargetDescriptions: colorTargets;
		numColorTargets: colorTargets size.
	pipelineCreateInfo vertexInputState
		vertexBufferDescriptions: vertexBindings;
		numVertexBuffers: 1;
		vertexAttributes: vertexAttributes;
		numVertexAttributes: 2;
		yourself.

	renderPipeline := gpuDevice newGPUGraphicsPipelineCreateinfo: pipelineCreateInfo.
	renderPipeline assertNotNullReturn.

	gpuDevice releaseGPUShader: vertexShader.
	gpuDevice releaseGPUShader: fragmentShader.	
	vertexBindings free.
	vertexAttributes free.
	colorTargets free
]

{ #category : 'running' }
SDL3GPUBoidsDemo >> iterateUntilQuit [

	| quit |
	quit := false.

	[ quit ] whileFalse: [

		self pollEventsDo: [ :evt |
			evt type = SDL_EVENT_QUIT ifTrue: [ quit := true ].
			evt type = SDL_EVENT_KEY_DOWN ifTrue: [
				evt key = SDLK_ESCAPE asInteger ifTrue: [ quit := true ].
				self handleKeyDown: evt.
				self updateTitle ] ].

		self render.

		frameCount := frameCount + 1.
		(Time millisecondClockValue - lastFpsTime >= 1000) ifTrue: [
			currentFps := frameCount.
			frameCount := 0.
			lastFpsTime := Time millisecondClockValue.
			self updateTitle
		].

		16.6 milliSeconds wait ]
]

{ #category : 'lifecycle' }
SDL3GPUBoidsDemo >> open [
	"Run headless with:
	./pharo Pharo.image eval 'SDL3GPUBoidsDemo new run'
	"

	super open.
	self initializeBuffers.
	self uploadInitialData.
	self initializeComputeResources.
	self initializeRenderPipeline.
	self updateTitle
]

{ #category : 'rendering' }
SDL3GPUBoidsDemo >> render [

	| commandBuffer nextBoidsBuffer |
	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer assertNotNullReturn.

	"1. Physics Pass (Ping-Pong)"
	nextBoidsBuffer :=
		currentBoidsBuffer == boidsBufferPing
			ifTrue: [ boidsBufferPong ]
			ifFalse: [ boidsBufferPing ].

	self
		doPhysicsPassWith: commandBuffer
		input: currentBoidsBuffer
		output: nextBoidsBuffer.
	currentBoidsBuffer := nextBoidsBuffer.

	"2. Geometry Pass"
	self doGeometryPassWith: commandBuffer input: currentBoidsBuffer.
	
	"3. Render Pass"
	sdl assertSuccess:
		(commandBuffer
			 waitAndAcquireGPUSwapchainTextureForWindow: window
			 into: swapchainTextureHolder
			 width: nil
			 height: nil).

	swapchainTextureHolder value isNull ifTrue: [ ^ commandBuffer cancel ].

	self doRenderPassesOn: swapchainTextureHolder value with: commandBuffer.

	sdl assertSuccess: commandBuffer submit
]

{ #category : 'actions' }
SDL3GPUBoidsDemo >> updateTitle [

	window title: ('Boids: {1} | Sep: {2} Ali: {3} Coh: {4} | Rad: {5}/{6} | MaxV: {7}' format: {
		numBoids. 
		boidsUniforms separationWeight printShowingDecimalPlaces: 1.
		boidsUniforms alignmentWeight printShowingDecimalPlaces: 1.
		boidsUniforms cohesionWeight printShowingDecimalPlaces: 1.
		boidsUniforms separationRadius printShowingDecimalPlaces: 2.
		boidsUniforms neighborRadius printShowingDecimalPlaces: 2.
		boidsUniforms maxVelocity printShowingDecimalPlaces: 2
	})
]

{ #category : 'initialization' }
SDL3GPUBoidsDemo >> uploadInitialData [
	"Upload initial nodes, hues, and static index buffer to GPU"

	| boids bTransfer mappedAddress bSize random iTransfer iSize indices hTransfer hSize hues |
	
	"1. Boids (Positions & Velocities)"
	random := Random seed: 7.
	boids := FFIArray newType: SDL3GPUBoidsBoid size: numBoids.
	hues := FFIArray newType: FFIFloat32 size: numBoids.
	
	1 to: numBoids do: [ :i |
		| boid |
		boid := boids at: i.
		boid x: (random next * 2.0 - 1.0); y: (random next * 2.0 - 1.0).
		boid
			vx: (random next * boidsUniforms maxVelocity) - (boidsUniforms maxVelocity/2.0);
			vy: (random next * boidsUniforms maxVelocity) - (boidsUniforms maxVelocity/2.0).
		hues at: i put: random next ].

	bSize := numBoids * SDL3GPUBoidsBoid structureSize.
	bTransfer := gpuDevice newUploadTransferBuffer: bSize.
	mappedAddress := gpuDevice mapGPUTransferBuffer: bTransfer cycle: false.
	mappedAddress isNull ifTrue: [ SDL3Error signalFromLibraryErrorMessage ].
	LibC memCopy: boids getHandle to: mappedAddress size: bSize.
	gpuDevice unmapGPUTransferBuffer: bTransfer.
	
	"2. Hues (Colors)"
	hSize := numBoids * FFIFloat32 externalTypeSize.
	hTransfer := gpuDevice newUploadTransferBuffer: hSize.
	mappedAddress := gpuDevice mapGPUTransferBuffer: hTransfer cycle: false.
	mappedAddress isNull ifTrue: [ SDL3Error signalFromLibraryErrorMessage ].
	LibC memCopy: hues getHandle to: mappedAddress size: hSize.
	gpuDevice unmapGPUTransferBuffer: hTransfer.

	"3. Indices"
	iSize := numBoids * 3 * 2.
	iTransfer := gpuDevice newUploadTransferBuffer: iSize.
	mappedAddress := gpuDevice mapGPUTransferBuffer: iTransfer cycle: false.
	indices := FFIArray fromHandle: mappedAddress type: FFIUInt16 size: numBoids * 3.
	1 to: numBoids do: [ :i |
		| baseVertex baseIndex |
		baseVertex := (i - 1) * 3.
		baseIndex := (i - 1) * 3.
		indices at: baseIndex + 1 put: baseVertex + 0.
		indices at: baseIndex + 2 put: baseVertex + 1.
		indices at: baseIndex + 3 put: baseVertex + 2.
	].
	gpuDevice unmapGPUTransferBuffer: iTransfer.

	gpuDevice acquireGPUCommandBuffer in: [ :commandBuffer |
		| copyPass |
		commandBuffer assertNotNullReturn.
		copyPass := commandBuffer beginGPUCopyPass.
		"Initialize the input ping-pong buffer with starting state"
		copyPass
			uploadToGPUBufferSource: (SDL_GPUTransferBufferLocation new transferBuffer: bTransfer; offset: 0; yourself)
			destination: (SDL_GPUBufferRegion new buffer: boidsBufferPing; offset: 0; size: bSize; yourself) cycle: false.
		copyPass
			uploadToGPUBufferSource: (SDL_GPUTransferBufferLocation new transferBuffer: hTransfer; offset: 0; yourself)
			destination: (SDL_GPUBufferRegion new buffer: huesBuffer; offset: 0; size: hSize; yourself) cycle: false.
		copyPass
			uploadToGPUBufferSource: (SDL_GPUTransferBufferLocation new transferBuffer: iTransfer; offset: 0; yourself)
			destination: (SDL_GPUBufferRegion new buffer: indexBuffer; offset: 0; size: iSize; yourself) cycle: false.
		copyPass end.
		sdl assertSuccess: commandBuffer submit ].

	gpuDevice releaseGPUTransferBuffer: bTransfer.
	gpuDevice releaseGPUTransferBuffer: hTransfer.
	gpuDevice releaseGPUTransferBuffer: iTransfer.
	boids free.
	hues free
]
