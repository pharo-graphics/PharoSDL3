"
I demonstrate boids flocking using a compute-to-vertex-buffer architecture.
"
Class {
	#name : 'SDL3GPUBoidsDemoApp',
	#superclass : 'SDL3GPUDemoApp',
	#instVars : [
		'currentBoidsBuffer',
		'numBoids',
		'boidsBufferPing',
		'boidsBufferPong',
		'huesBuffer',
		'vertexBuffer',
		'indexBuffer',
		'boidsComputePipeline',
		'geometryComputePipeline',
		'renderPipeline',
		'vertexBufferBindings',
		'storageBuffers',
		'storageBufferBinding',
		'physicsStorageBuffers',
		'renderColorTargetInfos',
		'boidsUniforms',
		'geometryUniforms',
		'indexBufferBinding'
	],
	#category : 'SDL3-GPU-Demos-Boids',
	#package : 'SDL3-GPU-Demos',
	#tag : 'Boids'
}

{ #category : 'rendering' }
SDL3GPUBoidsDemoApp >> computeSimulation [

	| commandBuffer nextBoidsBuffer |
	commandBuffer := gpuDevice acquireGPUCommandBuffer.

	"Ping-Pong"
	nextBoidsBuffer :=
		currentBoidsBuffer == boidsBufferPing
			ifTrue: [ boidsBufferPong ]
			ifFalse: [ boidsBufferPing ].

	"Physics Pass"
	self
		doPhysicsPassWith: commandBuffer
		input: currentBoidsBuffer
		output: nextBoidsBuffer.
	currentBoidsBuffer := nextBoidsBuffer.

	"Geometry Pass"
	self doGeometryPassWith: commandBuffer input: currentBoidsBuffer.

	commandBuffer submit
]

{ #category : 'rendering' }
SDL3GPUBoidsDemoApp >> doGeometryPassWith: commandBuffer input: inputBuffer [

	self pushGeometryUniformsTo: commandBuffer.

	storageBufferBinding first buffer: vertexBuffer.

	commandBuffer computePassTextures: #() computeStorageBuffers: storageBufferBinding do: [ :computePass |
		storageBuffers
			at: 1 put: inputBuffer getHandle;
			at: 2 put: huesBuffer getHandle.

		computePass
			pipeline: geometryComputePipeline;
			computeStorageBuffers: storageBuffers slot: 0;
			dispatchX: numBoids ]
]

{ #category : 'rendering' }
SDL3GPUBoidsDemoApp >> doPhysicsPassWith: commandBuffer input: inputBuffer output: outputBuffer [

	| extent |
	extent := window pixelExtent.

	"Aspect ratio bounds calculation: keep the minimum dimension mapped to [-1, 1]"
	extent x > extent y
		ifTrue: [
			boidsUniforms boundX: extent x asFloat / extent y asFloat.
			boidsUniforms boundY: 1.0 ]
		ifFalse: [
			boidsUniforms boundX: 1.0.
			boidsUniforms boundY: extent y asFloat / extent x asFloat ].

	boidsUniforms time: Time millisecondClockValue / 1000.0.

	commandBuffer
		pushComputeUniform: boidsUniforms slot: 0.

	storageBuffers at: 1 put: inputBuffer getHandle.

	storageBufferBinding first
		buffer: outputBuffer;
		cycle: false.

	commandBuffer computePassTextures: #() computeStorageBuffers: storageBufferBinding do: [ :computePass |
		physicsStorageBuffers at: 1 put: inputBuffer getHandle.

		computePass
			pipeline: boidsComputePipeline;
			computeStorageBuffers: physicsStorageBuffers slot: 0;
			dispatchX: numBoids ]
]

{ #category : 'rendering' }
SDL3GPUBoidsDemoApp >> doRenderPassesOn: swapchainTexture with: commandBuffer [

	renderColorTargetInfos first texture: swapchainTexture.

	commandBuffer renderPassTargets: renderColorTargetInfos do: [ :renderPass |
		renderPass
			pipeline: renderPipeline;
			vertexBuffers: vertexBufferBindings slot: 0;
			indexBuffer16Bit: indexBufferBinding;
			drawIndexedPrimitives: numBoids * 3
			instances: 1
			firstIndex: 0
			vertexOffset: 0
			firstInstance: 0 ]
]

{ #category : 'private' }
SDL3GPUBoidsDemoApp >> generateInitialBoids [

	| random boids |
	random := Random seed: 7.
	boids := SDL3Array newType: SDL3GPUBoidsBoid size: numBoids.
	1 to: numBoids do: [ :i |
			| boid |
			boid := boids at: i.
			boid
				x: random next * 2.0 - 1.0;
				y: random next * 2.0 - 1.0.
			boid
				vx: random next * boidsUniforms maxVelocity - (boidsUniforms maxVelocity / 2.0);
				vy: random next * boidsUniforms maxVelocity - (boidsUniforms maxVelocity / 2.0) ].
	^ boids
]

{ #category : 'private' }
SDL3GPUBoidsDemoApp >> generateInitialHues [

	| random |
	random := Random seed: 7.
	^ SDL3Array newType: FFIFloat32 size: numBoids collect: [ :i | random next ]
]

{ #category : 'events' }
SDL3GPUBoidsDemoApp >> handleKeyDown: aKeyboardEvent [

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
SDL3GPUBoidsDemoApp >> initialize [

	super initialize.

	numBoids := 1000
]

{ #category : 'initialization' }
SDL3GPUBoidsDemoApp >> initializeBoidsBuffers [

	| boidsSize |
	boidsSize := numBoids * SDL3GPUBoidsBoid structureSize.
	DiScope own: (boidsBufferPing := gpuDevice
		unownedNewGPUBufferUsage: SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE | SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ
		size: boidsSize).
	DiScope own: (boidsBufferPong := gpuDevice
		unownedNewGPUBufferUsage: SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE | SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ
		size: boidsSize).

	currentBoidsBuffer := boidsBufferPing
]

{ #category : 'initialization' }
SDL3GPUBoidsDemoApp >> initializeBuffers [

	self
		initializeBoidsBuffers;
		initializeHuesBuffer;
		initializeVertexBuffers;
		initializeIndexBuffer
]

{ #category : 'initialization' }
SDL3GPUBoidsDemoApp >> initializeComputeResources [

	DiScope own: (boidsComputePipeline := SDL3GPUBoidsComputeShaderSource
		unownedNewComputePipelineForDevice: gpuDevice).

	DiScope own: (geometryComputePipeline := SDL3GPUBoidsGeometryComputeShaderSource
		unownedNewComputePipelineForDevice: gpuDevice)
]

{ #category : 'initialization' }
SDL3GPUBoidsDemoApp >> initializeHuesBuffer [

	DiScope own: (huesBuffer := gpuDevice
		unownedNewGPUBufferUsage: SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ
		size: numBoids * FFIFloat32 externalTypeSize)
]

{ #category : 'initialization' }
SDL3GPUBoidsDemoApp >> initializeIndexBuffer [

	DiScope own: (indexBuffer := gpuDevice unownedNewGPUBufferUsage: SDL_GPU_BUFFERUSAGE_INDEX size: numBoids * 3 * 2). "16-bit"
	DiScope own: (indexBufferBinding := SDL_GPUBufferBinding unownedNew
		beBuffer: indexBuffer offset: 0;
		yourself)
]

{ #category : 'initialization' }
SDL3GPUBoidsDemoApp >> initializeRenderPipeline [

	renderPipeline := gpuDevice newGraphicsPipelineBuilder
		vertexShader: SDL3GPUBoidsVertexShaderSource;
		fragmentShader: SDL3GPUBoidsFragmentShaderSource;
		addVertexBufferFor: SDL3GPUBoidsVertex;
		targetWindow: window;
		enableAlphaBlending;
		unownedNewPipeline.
	DiScope own: renderPipeline
]

{ #category : 'initialization' }
SDL3GPUBoidsDemoApp >> initializeVertexBuffers [

	DiScope own: (vertexBuffer := gpuDevice
		unownedNewGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX | SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE
		size: numBoids * 3 * SDL3GPUBoidsVertex structureSize).

	vertexBufferBindings first
		buffer: vertexBuffer;
		offset: 0.

	storageBufferBinding first
		buffer: vertexBuffer;
		cycle: false
]

{ #category : 'private' }
SDL3GPUBoidsDemoApp >> pushGeometryUniformsTo: commandBuffer [

	| extent |
	extent := window extent.

	"Aspect ratio bounds calculation: keep the minimum dimension mapped to [-1, 1]"
	extent x > extent y
		ifTrue: [
			geometryUniforms boundX: extent x asFloat / extent y asFloat.
			geometryUniforms boundY: 1.0 ]
		ifFalse: [
			geometryUniforms boundX: 1.0.
			geometryUniforms boundY: extent y asFloat / extent x asFloat ].

	geometryUniforms
		numBoids: numBoids;
		boidRadius: 0.05.

	commandBuffer
		pushComputeUniform: geometryUniforms slot: 0
]

{ #category : 'lifecycle' }
SDL3GPUBoidsDemoApp >> setUp [
	"Run headless with:
	./pharo Pharo.image eval 'SDL3GPUBoidsDemoApp new run'
	"

	"Simulation defaults"

	DiScope own: (boidsUniforms := SDL3GPUBoidsUniforms unownedNew).
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
		deltaTime: loop periodAsSeconds.

	super setUp.
	DiScope own: (vertexBufferBindings := SDL3Array unownedNewType: SDL_GPUBufferBinding size: 1).
	DiScope own: (storageBuffers := SDL3Array unownedNewType: ExternalAddress size: 2).
	DiScope own: (storageBufferBinding := SDL3Array unownedNewType: SDL3GPUStorageBufferReadWriteBinding size: 1).
	DiScope own: (geometryUniforms := SDL3GPUBoidsGeometryUniforms unownedNew).
	DiScope own: (physicsStorageBuffers := SDL3Array unownedNewType: ExternalAddress size: 1).
	DiScope own: (renderColorTargetInfos := SDL3Array unownedNewType: SDL_GPUColorTargetInfo size: 1).
	renderColorTargetInfos first beClear: Color black.

	self initializeBuffers.
	self uploadInitialData.
	self initializeComputeResources.
	self initializeRenderPipeline
]

{ #category : 'hooks' }
SDL3GPUBoidsDemoApp >> step [

	self computeSimulation.
	super step
]

{ #category : 'accessing' }
SDL3GPUBoidsDemoApp >> updatedTitle [

	boidsUniforms ifNil: [ ^ super updatedTitle ].

	^ super updatedTitle, (' - Count: {1} | Sep: {2} Ali: {3} Coh: {4} | Rad: {5}/{6} | MaxV: {7}' format: {
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
SDL3GPUBoidsDemoApp >> uploadInitialData [
	"Upload initial nodes, hues, and static index buffer to GPU"

	| boids hues |
	"1. Generate Data"
	boids := self generateInitialBoids.
	hues := self generateInitialHues.

	"2. Upload to GPU"
	gpuDevice uploadToGPUDo: [ :uploader |
		uploader
			uploadTo: boidsBufferPing
			type: SDL3GPUBoidsBoid
			count: numBoids
			cycle: false
			fromPointer: boids getHandle.

		uploader
			uploadTo: huesBuffer
			type: FFIFloat32
			count: numBoids
			cycle: false
			fromPointer: hues getHandle.

		uploader
			uploadTo: indexBuffer
			type: FFIUInt16
			count: numBoids * 3
			cycle: false
			fillWith: [ :indices |
				1 to: numBoids do: [ :i |
					| baseVertex baseIndex |
					baseVertex := (i - 1) * 3.
					baseIndex := (i - 1) * 3.
					indices at: baseIndex + 1 put: baseVertex + 0.
					indices at: baseIndex + 2 put: baseVertex + 1.
					indices at: baseIndex + 3 put: baseVertex + 2 ] ] ].

	boids free.
	hues free
]

{ #category : 'hooks' }
SDL3GPUBoidsDemoApp >> visitKeyboardDownEvent: aKeyboardDownEvent [

	super visitKeyboardDownEvent: aKeyboardDownEvent.

	self handleKeyDown: aKeyboardDownEvent.
	self updateTitle
]
