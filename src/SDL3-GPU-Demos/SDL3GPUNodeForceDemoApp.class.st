"
This demo shows a force-directed node graph simulation.
A compute shader calculates N-body physics and writes positions to a vertex buffer.
Drag nodes with the left mouse button to move them.
"
Class {
	#name : 'SDL3GPUNodeForceDemoApp',
	#superclass : 'SDL3GPUDemoApp',
	#instVars : [
		'currentNodesBuffer',
		'numNodes',
		'numEdges',
		'selectedNodeIndex',
		'isDragging',
		'nodeArray',
		'edgeArray',
		'nodesBufferPing',
		'nodesBufferPong',
		'edgesBuffer',
		'vertexBuffer',
		'indexBuffer',
		'computePipeline',
		'nodePipeline',
		'edgePipeline',
		'storageBuffers',
		'storageBufferBindings',
		'vertexBufferBindings',
		'uniforms',
		'indexBufferBinding',
		'colorTargetInfos'
	],
	#category : 'SDL3-GPU-Demos-NodeGraph',
	#package : 'SDL3-GPU-Demos',
	#tag : 'NodeGraph'
}

{ #category : 'private' }
SDL3GPUNodeForceDemoApp >> bindSharedGraphicsResourcesTo: renderPass with: commandBuffer [

	| windowExtent |
	renderPass
		vertexBuffers: vertexBufferBindings slot: 0;
		vertexStorageBuffers: storageBuffers slot: 0;
		indexBuffer16Bit: indexBufferBinding.

	windowExtent := window extent.
	uniforms
		aspectRatio: windowExtent x asFloat / windowExtent y asFloat;
		selectedNodeIndex: selectedNodeIndex.
	commandBuffer pushVertexUniform: uniforms slot: 0
]

{ #category : 'rendering' }
SDL3GPUNodeForceDemoApp >> computeSimulation [

	| nextBuffer commandBuffer |
	commandBuffer := gpuDevice acquireGPUCommandBuffer.

	"Ping-pong"
	nextBuffer :=
		currentNodesBuffer == nodesBufferPing
			ifTrue: [ nodesBufferPong ]
			ifFalse: [ nodesBufferPing ].

	self
		pushSimulationUniformsTo: commandBuffer;
		executeSimulationComputePassWith: commandBuffer
			input: currentNodesBuffer
			output: nextBuffer.

	commandBuffer submit.

	"Prepare for next compute"
	currentNodesBuffer := nextBuffer
]

{ #category : 'rendering' }
SDL3GPUNodeForceDemoApp >> doRenderPassesOn: swapchainTexture with: commandBuffer [

	colorTargetInfos first beClearTexture: swapchainTexture color: Color black.

	commandBuffer renderPassTargets: colorTargetInfos do: [ :renderPass |
			self bindSharedGraphicsResourcesTo: renderPass with: commandBuffer.
			self drawEdgesOn: renderPass.
			self drawNodesOn: renderPass ]
]

{ #category : 'private' }
SDL3GPUNodeForceDemoApp >> drawEdgesOn: renderPass [

	renderPass pipeline: edgePipeline.
	renderPass
		drawIndexedPrimitives: 6
		instances: numEdges
		firstIndex: 0
		vertexOffset: 0
		firstInstance: 0
]

{ #category : 'private' }
SDL3GPUNodeForceDemoApp >> drawNodesOn: renderPass [

	renderPass pipeline: nodePipeline.
	renderPass
		drawIndexedPrimitives: 6
		instances: numNodes
		firstIndex: 0
		vertexOffset: 0
		firstInstance: 0
]

{ #category : 'private' }
SDL3GPUNodeForceDemoApp >> executeSimulationComputePassWith: commandBuffer input: inputBuffer output: outputBuffer [

	storageBufferBindings first
		buffer: outputBuffer;
		cycle: false.

	commandBuffer computePassTextures: #() computeStorageBuffers: storageBufferBindings do: [ :computePass |
		storageBuffers
			at: 1 put: inputBuffer getHandle;
			at: 2 put: edgesBuffer getHandle.

		computePass
			pipeline: computePipeline;
			computeStorageBuffers: storageBuffers slot: 0;
			dispatchX: numNodes ]
]

{ #category : 'private' }
SDL3GPUNodeForceDemoApp >> findNodeAtSimulationPosition: point among: nodes [

	nodes withIndexDo: [ :node :i |
		| distance |
		distance := (node x @ node y) distanceTo: point.
		distance < node radius ifTrue: [ ^ i - 1 ] ].

	^ -1
]

{ #category : 'initialization' }
SDL3GPUNodeForceDemoApp >> initialize [

	super initialize.

	numNodes := 64.
	numEdges := 128.
	selectedNodeIndex := -1.
	isDragging := false
]

{ #category : 'initialization' }
SDL3GPUNodeForceDemoApp >> initializeBuffers [

	| nodesSize edgesSize |
	nodesSize := numNodes * SDL3GPUNode structureSize.
	DiScope own: (nodesBufferPing := gpuDevice
		unownedNewGPUBufferUsage:
			SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ | SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE
			| SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ
		size: nodesSize).
	DiScope own: (nodesBufferPong := gpuDevice
		unownedNewGPUBufferUsage:
			SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ | SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE
			| SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ
		size: nodesSize).

	currentNodesBuffer := nodesBufferPing.

	edgesSize := numEdges * SDL3GPUEdge structureSize.
	DiScope own: (edgesBuffer := gpuDevice
		unownedNewGPUBufferUsage: SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ | SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ
		size: edgesSize)
]

{ #category : 'initialization' }
SDL3GPUNodeForceDemoApp >> initializeGeometry [

	self
		initializeQuadBuffers;
		setupGeometryBindings
]

{ #category : 'initialization' }
SDL3GPUNodeForceDemoApp >> initializeGraph [

	| random |
	random := Random seed: 17.

	nodeArray := SDL3Array newType: SDL3GPUNode size: numNodes.
	nodeArray do: [ :node |
			node
				x: random next * 1.0 - 0.5;
				y: random next * 1.0 - 0.5.
			node
				vx: 0.0;
				vy: 0.0.
			node radius: 0.02 + (random next * 0.03).
			node hue: random next.
			node isSelected: 0 ].

	edgeArray := SDL3Array newType: SDL3GPUEdge size: numEdges.
	edgeArray do: [ :edge |
			edge nodeA: (random nextInteger: numNodes) - 1.
			edge nodeB: (random nextInteger: numNodes) - 1.
			edge weight: 0.5 + random next.
			"Avoid self-loops for simplicity"
			[ edge nodeA = edge nodeB ] whileTrue: [ edge nodeB: (random nextInteger: numNodes) - 1 ] ]
]

{ #category : 'initialization' }
SDL3GPUNodeForceDemoApp >> initializeKeybindings [

	self
		bindKey: SDLK_UP
		description: 'Increase spring stiffness (+0.5)'
		action: [ uniforms springStiffness: uniforms springStiffness + 0.5 ];
		bindKey: SDLK_DOWN
		description: 'Decrease spring stiffness (-0.5)'
		action: [ uniforms springStiffness: ((uniforms springStiffness - 0.5) max: 0.0) ];
		bindKey: SDLK_RIGHT
		description: 'Increase repulsion weight (+0.1)'
		action: [ uniforms repulsionWeight: uniforms repulsionWeight + 0.1 ];
		bindKey: SDLK_LEFT
		description: 'Decrease repulsion weight (-0.1)'
		action: [ uniforms repulsionWeight: ((uniforms repulsionWeight - 0.1) max: 0.0) ];
		bindKey: SDLK_PAGEUP
		description: 'Increase damping (*1.5)'
		action: [ uniforms damping: ((uniforms damping * 1.5) min: 0.99) ];
		bindKey: SDLK_PAGEDOWN
		description: 'Decrease damping (/1.5)'
		action: [ uniforms damping: ((uniforms damping / 1.5) max: 0.00001) ].
	super initializeKeybindings
]

{ #category : 'initialization' }
SDL3GPUNodeForceDemoApp >> initializeQuadBuffers [

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
				#( (0 0) (1 0) (1 1) (0 1) ) withIndexDo: [ :uv :idx |
					| v |
					v := vertices at: idx.
					v
						x: uv first asFloat;
						y: uv second asFloat;
						z: 0.0;
						u: uv first asFloat;
						v: uv second asFloat ] ].

		uploader
			uploadTo: indexBuffer
			type: FFIUInt16
			count: 6
			cycle: false
			fillWith: [ :indices |
				#( 0 1 2 0 2 3 ) withIndexDo: [ :val :idx |
					indices at: idx put: val ] ] ]
]

{ #category : 'initialization' }
SDL3GPUNodeForceDemoApp >> initializeShaders [

	DiScope own: (computePipeline := SDL3GPUNodeForceComputeShaderSource unownedNewComputePipelineForDevice: gpuDevice).

	nodePipeline := gpuDevice newGraphicsPipelineBuilder
		vertexShader: SDL3GPUNodeVertexShaderSource;
		fragmentShader: SDL3GPUNodeFragmentShaderSource;
		addVertexBufferFor: SDL3GPUQuadVertex;
		targetWindow: window;
		enableAlphaBlending;
		unownedNewPipeline.
	DiScope own: nodePipeline.

	edgePipeline := gpuDevice newGraphicsPipelineBuilder
		vertexShader: SDL3GPUEdgeVertexShaderSource;
		fragmentShader: SDL3GPUEdgeFragmentShaderSource;
		addVertexBufferFor: SDL3GPUQuadVertex;
		targetWindow: window;
		enableAlphaBlending;
		unownedNewPipeline.
	DiScope own: edgePipeline
]

{ #category : 'private' }
SDL3GPUNodeForceDemoApp >> pushSimulationUniformsTo: commandBuffer [

	| windowExtent aspect |
	windowExtent := self windowExtent.
	aspect := windowExtent x asFloat / windowExtent y asFloat.

	uniforms
		time: Time millisecondClockValue / 1000.0;
		aspectRatio: aspect;
		selectedNodeIndex: selectedNodeIndex;
		isDragging: (isDragging ifTrue: [ 1 ] ifFalse: [ 0 ]).

	commandBuffer pushComputeUniform: uniforms slot: 0
]

{ #category : 'actions' }
SDL3GPUNodeForceDemoApp >> selectNodeAtSimulationPosition: point [

	gpuDevice
		downloadFrom: currentNodesBuffer
		type: SDL3GPUNode
		count: numNodes
		do: [ :mappedNodes |
			selectedNodeIndex := self
				                     findNodeAtSimulationPosition: point
				                     among: mappedNodes ].

	self updateTitle
]

{ #category : 'lifecycle' }
SDL3GPUNodeForceDemoApp >> setUp [

	DiScope own: (uniforms := SDL3GPUNodeForceUniforms unownedNew).
	uniforms
		numNodes: numNodes;
		numEdges: numEdges;
		deltaTime: loop periodAsSeconds;
		springStiffness: 2.0;
		repulsionWeight: 6.0;
		repulsionRadius: 0.5;
		centerGravityWeight: 0.5;
		damping: 0.01;
		maxVelocity: 2.0;
		aspectRatio: 1.0;
		hoverX: -10.0;
		hoverY: -10.0;
		isDragging: 0.

	super setUp.
	DiScope own: (storageBuffers := SDL3Array unownedNewType: ExternalAddress size: 2).
	DiScope own: (storageBufferBindings := SDL3Array unownedNewType: SDL3GPUStorageBufferReadWriteBinding size: 1).
	DiScope own: (vertexBufferBindings := SDL3Array unownedNewType: SDL_GPUBufferBinding size: 1).
	DiScope own: (colorTargetInfos := SDL3Array unownedNewType: SDL_GPUColorTargetInfo size: 1).

	self initializeBuffers.
	self initializeGraph.
	self uploadNodes.
	self uploadEdges.
	self initializeGeometry.
	self initializeShaders
]

{ #category : 'initialization' }
SDL3GPUNodeForceDemoApp >> setupGeometryBindings [

	vertexBufferBindings first
		buffer: vertexBuffer;
		offset: 0.
	DiScope own: (indexBufferBinding := SDL_GPUBufferBinding unownedNew
		beBuffer: indexBuffer offset: 0;
		yourself)
]

{ #category : 'private' }
SDL3GPUNodeForceDemoApp >> simulationPositionFromWindowPoint: point [

	| normalizedX normalizedY windowExtent aspect boundX boundY |
	windowExtent := self windowExtent.
	normalizedX := point x / windowExtent x asFloat.
	normalizedY := point y / windowExtent y asFloat.

	aspect := windowExtent x asFloat / windowExtent y asFloat.
	boundX := 1.0 max: aspect.
	boundY := 1.0 max: 1.0 / aspect.

	"Map NDC point back to simulation space (Flip Y: top 1, bottom -1)"
	^ ((normalizedX * 2.0 - 1.0) * boundX) @ ((1.0 - (normalizedY * 2.0)) * boundY)
]

{ #category : 'hooks' }
SDL3GPUNodeForceDemoApp >> step: deltaSeconds [

	uniforms deltaTime: deltaSeconds.
	self computeSimulation.
	super step: deltaSeconds
]

{ #category : 'accessing' }
SDL3GPUNodeForceDemoApp >> updatedTitle [

	| selectionInfo dragInfo |
	uniforms ifNil: [ ^ super updatedTitle ].

	selectionInfo := selectedNodeIndex >= 0
		ifTrue: [ ' | Selected: {1}' format: { selectedNodeIndex } ]
		ifFalse: [ '' ].
	dragInfo := isDragging ifTrue: [ ' [DRAGGING]' ] ifFalse: [ '' ].

	^ super updatedTitle, (' - Nodes: {1} Edges: {2} (Spring: {3} Repel: {4} Damp: {5}){6}{7}' format: {
		numNodes.
		numEdges.
		uniforms springStiffness printShowingDecimalPlaces: 1.
		uniforms repulsionWeight printShowingDecimalPlaces: 1.
		uniforms damping printShowingDecimalPlaces: 4.
		selectionInfo.
		dragInfo })
]

{ #category : 'private' }
SDL3GPUNodeForceDemoApp >> uploadEdges [

	gpuDevice uploadToGPUDo: [ :uploader |
		uploader
			uploadTo: edgesBuffer
			type: SDL3GPUEdge
			count: numEdges
			cycle: false
			fromPointer: edgeArray getHandle ]
]

{ #category : 'private' }
SDL3GPUNodeForceDemoApp >> uploadNodes [

	gpuDevice uploadToGPUDo: [ :uploader |
		uploader
			uploadTo: nodesBufferPing
			type: SDL3GPUNode
			count: numNodes
			cycle: false
			fromPointer: nodeArray getHandle ]
]

{ #category : 'visiting - concrete' }
SDL3GPUNodeForceDemoApp >> visitMouseButtonDownEvent: aMouseButtonDownEvent [

	| position |
	super visitMouseButtonDownEvent: aMouseButtonDownEvent.

	position := self simulationPositionFromWindowPoint: aMouseButtonDownEvent position.
	self selectNodeAtSimulationPosition: position.

	selectedNodeIndex >= 0 ifFalse: [ ^ self ].
	isDragging := true.
	self updateTitle
]

{ #category : 'visiting - concrete' }
SDL3GPUNodeForceDemoApp >> visitMouseButtonUpEvent: aMouseButtonUpEvent [

	super visitMouseButtonUpEvent: aMouseButtonUpEvent.

	isDragging := false.
	self updateTitle
]

{ #category : 'visiting - concrete' }
SDL3GPUNodeForceDemoApp >> visitMouseMotionEvent: aMouseMotionEvent [

	| simPosition |
	super visitMouseMotionEvent: aMouseMotionEvent.

	simPosition := self simulationPositionFromWindowPoint: aMouseMotionEvent position.
	uniforms hoverX: simPosition x.
	uniforms hoverY: simPosition y
]
