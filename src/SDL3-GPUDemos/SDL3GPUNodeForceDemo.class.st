"
I demonstrate a force-directed node graph using a compute-to-vertex-buffer architecture.
"
Class {
	#name : 'SDL3GPUNodeForceDemo',
	#superclass : 'SDL3GPUDemoApp',
	#instVars : [
		'nodesBufferPing',
		'nodesBufferPong',
		'edgesBuffer',
		'currentNodesBuffer',
		'computePipeline',
		'uniforms',
		'numNodes',
		'numEdges',
		'storageBuffers',
		'storageBufferBindings',
		'nodePipeline',
		'edgePipeline',
		'vertexBuffer',
		'indexBuffer',
		'vertexBufferBindings',
		'indexBufferBinding',
		'selectedNodeIndex',
		'isDragging',
		'nodeArray',
		'edgeArray'
	],
	#pools : [
		'SDL3AllEnumerations'
	],
	#category : 'SDL3-GPUDemos-NodeGraph',
	#package : 'SDL3-GPUDemos',
	#tag : 'NodeGraph'
}

{ #category : 'private' }
SDL3GPUNodeForceDemo >> bindSharedGraphicsResourcesTo: renderPass with: commandBuffer [

	renderPass
		vertexBuffers: vertexBufferBindings slot: 0;
		vertexStorageBuffers: storageBuffers slot: 0;
		indexBuffer16Bit: indexBufferBinding.

	uniforms
		aspectRatio: window extent x asFloat / (window extent y max: 1);
		selectedNodeIndex: selectedNodeIndex.
	commandBuffer
		pushVertexUniform: uniforms slot: 0
]

{ #category : 'lifecycle' }
SDL3GPUNodeForceDemo >> close [

	nodesBufferPing ifNotNil: [
		nodesBufferPing release.
		nodesBufferPing := nil ].
	nodesBufferPong ifNotNil: [
		nodesBufferPong release.
		nodesBufferPong := nil ].
	edgesBuffer ifNotNil: [
		edgesBuffer release.
		edgesBuffer := nil ].

	vertexBuffer ifNotNil: [
		vertexBuffer release.
		vertexBuffer := nil ].
	indexBuffer ifNotNil: [
		indexBuffer release.
		indexBuffer := nil ].

	computePipeline ifNotNil: [
		computePipeline release.
		computePipeline := nil ].
	nodePipeline ifNotNil: [
		nodePipeline release.
		nodePipeline := nil ].
	edgePipeline ifNotNil: [
		edgePipeline release.
		edgePipeline := nil ].

	super close
]

{ #category : 'rendering' }
SDL3GPUNodeForceDemo >> computeSimulation [

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
SDL3GPUNodeForceDemo >> doRenderPassesOn: swapchainTexture with: commandBuffer [

	| colorTargetInfos |
	colorTargetInfos := SDL_GPUColorTargetInfo safeNewArray: 1.
	colorTargetInfos first
		beClearTexture: swapchainTexture
		color: Color black.

	commandBuffer renderPassTargets: colorTargetInfos do: [ :renderPass |
		self bindSharedGraphicsResourcesTo: renderPass with: commandBuffer.
		self drawEdgesOn: renderPass.
		self drawNodesOn: renderPass ]
]

{ #category : 'private' }
SDL3GPUNodeForceDemo >> drawEdgesOn: renderPass [

	renderPass pipeline: edgePipeline.
	renderPass
		drawIndexedPrimitives: 6
		instances: numEdges
		firstIndex: 0
		vertexOffset: 0
		firstInstance: 0
]

{ #category : 'private' }
SDL3GPUNodeForceDemo >> drawNodesOn: renderPass [

	renderPass pipeline: nodePipeline.
	renderPass
		drawIndexedPrimitives: 6
		instances: numNodes
		firstIndex: 0
		vertexOffset: 0
		firstInstance: 0
]

{ #category : 'private' }
SDL3GPUNodeForceDemo >> executeSimulationComputePassWith: commandBuffer input: inputBuffer output: outputBuffer [

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
			dispatchX: numNodes + 63 // 64
			y: 1
			z: 1 ]
]

{ #category : 'private' }
SDL3GPUNodeForceDemo >> findNodeAtSimulationPosition: point among: nodes [

	nodes withIndexDo: [ :node :i |
		| distance |
		distance := (node x @ node y) distanceTo: point.
		distance < node radius ifTrue: [ ^ i - 1 ] ].

	^ -1
]

{ #category : 'initialization' }
SDL3GPUNodeForceDemo >> initialize [

	super initialize.

	numNodes := 64.
	numEdges := 128.

	self initializeUniforms.
	self initializeGPUStateContainers
]

{ #category : 'initialization' }
SDL3GPUNodeForceDemo >> initializeBuffers [

	| nodesSize edgesSize |
	nodesSize := numNodes * SDL3GPUNode structureSize.

	nodesBufferPing := gpuDevice
						  newGPUBufferUsage:
							  SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ
							  | SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE
							  | SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ
						  size: nodesSize.
	nodesBufferPong := gpuDevice
						  newGPUBufferUsage:
							  SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ
							  | SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE
							  | SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ
						  size: nodesSize.

	currentNodesBuffer := nodesBufferPing.

	edgesSize := numEdges * SDL3GPUEdge structureSize.
	edgesBuffer := gpuDevice
					  newGPUBufferUsage:
						  SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ
						  | SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ
					  size: edgesSize
]

{ #category : 'initialization' }
SDL3GPUNodeForceDemo >> initializeGPUStateContainers [

	storageBuffers := ExternalAddress safeNewArray: 2.


	storageBufferBindings := SDL3GPUStorageBufferReadWriteBinding safeNewArray: 1.

	vertexBufferBindings := SDL_GPUBufferBinding safeNewArray: 1.

	selectedNodeIndex := -1.

	isDragging := false
]

{ #category : 'initialization' }
SDL3GPUNodeForceDemo >> initializeGeometry [

	self
		initializeQuadBuffers;
		setupGeometryBindings
]

{ #category : 'initialization' }
SDL3GPUNodeForceDemo >> initializeGraph [

	| random |
	random := Random seed: 17.

	nodeArray := FFIArray newType: SDL3GPUNode size: numNodes.
	nodeArray do: [ :node |
		node x: (random next * 1.0 - 0.5); y: (random next * 1.0 - 0.5).
		node vx: 0.0; vy: 0.0.
		node radius: 0.02 + (random next * 0.03).
		node hue: random next.
		node isSelected: 0 ].

	edgeArray := FFIArray newType: SDL3GPUEdge size: numEdges.
	edgeArray do: [ :edge |
		edge nodeA: (random nextInteger: numNodes) - 1.
		edge nodeB: (random nextInteger: numNodes) - 1.
		edge weight: 0.5 + random next.
		"Avoid self-loops for simplicity"
		[ edge nodeA = edge nodeB ] whileTrue: [
			edge nodeB: (random nextInteger: numNodes) - 1 ] ]
]

{ #category : 'initialization' }
SDL3GPUNodeForceDemo >> initializeQuadBuffers [

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
				#( (0 0) (1 0) (1 1) (0 1) ) withIndexDo: [ :uv :idx |
					| v |
					v := vertices at: idx.
					v x: uv first asFloat;
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
SDL3GPUNodeForceDemo >> initializeShaders [

	| formats colorTargets |
	formats := gpuDevice gpuShaderFormatsAsArray.
	computePipeline := SDL3GPUNodeForceComputeShaderSource
						  newComputePipelineAmong: formats
						  device: gpuDevice.

	colorTargets := SDL_GPUColorTargetDescription safeNewArray: 1.
	colorTargets first format:
		(gpuDevice getGPUSwapchainTextureFormatIntoWindow: window).

	self newNodePipelineWith: formats colorTargets: colorTargets.
	self newEdgePipelineWith: formats colorTargets: colorTargets
]

{ #category : 'initialization' }
SDL3GPUNodeForceDemo >> initializeUniforms [

	uniforms := SDL3GPUNodeForceUniforms safeNew.
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
		isDragging: 0
]

{ #category : 'private' }
SDL3GPUNodeForceDemo >> newEdgePipelineWith: aFormatArray colorTargets: colorTargets [

	| vertexShader fragmentShader vertexBindings vertexAttributes |
	vertexShader := SDL3GPUEdgeVertexShaderSource
						newShaderAmong: aFormatArray
						device: gpuDevice.
	fragmentShader := SDL3GPUEdgeFragmentShaderSource
						 newShaderAmong: aFormatArray
						 device: gpuDevice.

	colorTargets first blendState: SDL_GPUColorTargetBlendState newAlphaBlend.

	vertexBindings := self newNodeVertexBindings.
	vertexAttributes := self newNodeVertexAttributes.

	edgePipeline := gpuDevice newGraphicsPipeline: [ :info |
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

{ #category : 'private' }
SDL3GPUNodeForceDemo >> newNodePipelineWith: aFormatArray colorTargets: colorTargets [

	| vertexShader fragmentShader vertexBindings vertexAttributes |
	vertexShader := SDL3GPUNodeVertexShaderSource
						newShaderAmong: aFormatArray
						device: gpuDevice.
	fragmentShader := SDL3GPUNodeFragmentShaderSource
						 newShaderAmong: aFormatArray
						 device: gpuDevice.

	colorTargets first blendState: SDL_GPUColorTargetBlendState newAlphaBlend.

	vertexBindings := self newNodeVertexBindings.
	vertexAttributes := self newNodeVertexAttributes.

	nodePipeline := gpuDevice newGraphicsPipeline: [ :info |
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

{ #category : 'private' }
SDL3GPUNodeForceDemo >> newNodeVertexAttributes [

	| vertexAttributes |
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
		offset: 3 * FFIFloat32 externalTypeSize.

	^ vertexAttributes
]

{ #category : 'private' }
SDL3GPUNodeForceDemo >> newNodeVertexBindings [

	| vertexBindings |
	vertexBindings := SDL_GPUVertexBufferDescription safeNewArray: 1.

	vertexBindings first
		slot: 0;
		pitch: SDL3GPUQuadVertex structureSize;
		inputRate: SDL_GPU_VERTEXINPUTRATE_VERTEX;
		instanceStepRate: 0.

	^ vertexBindings
]

{ #category : 'lifecycle' }
SDL3GPUNodeForceDemo >> prepareToLoop [

	super prepareToLoop.
	self initializeBuffers.
	self initializeGraph.
	self uploadNodes.
	self uploadEdges.
	self initializeGeometry.
	self initializeShaders
]

{ #category : 'private' }
SDL3GPUNodeForceDemo >> pushSimulationUniformsTo: commandBuffer [

	| aspect |
	aspect := window extent x asFloat / (window extent y max: 1).

	uniforms
		time: Time millisecondClockValue / 1000.0;
		aspectRatio: aspect;
		selectedNodeIndex: selectedNodeIndex;
		isDragging: (isDragging ifTrue: [ 1 ] ifFalse: [ 0 ]).

	commandBuffer
		pushComputeUniform: uniforms slot: 0
]

{ #category : 'actions' }
SDL3GPUNodeForceDemo >> selectNodeAtSimulationPosition: point [

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

{ #category : 'initialization' }
SDL3GPUNodeForceDemo >> setupGeometryBindings [

	vertexBufferBindings first
		buffer: vertexBuffer;
		offset: 0.
	indexBufferBinding := SDL_GPUBufferBinding
		                      buffer: indexBuffer
		                      offset: 0
]

{ #category : 'private' }
SDL3GPUNodeForceDemo >> simulationPositionFromWindowPoint: point [

	| nx ny winExtent aspect bx by |
	winExtent := window extent.
	nx := point x / (winExtent x max: 1) asFloat.
	ny := point y / (winExtent y max: 1) asFloat.

	aspect := winExtent x asFloat / (winExtent y max: 1).
	bx := 1.0 max: aspect.
	by := 1.0 max: (1.0 / aspect).

	"Map NDC point back to simulation space (Flip Y: top 1, bottom -1)"
	^ ((nx * 2.0 - 1.0) * bx) @ ((1.0 - (ny * 2.0)) * by)
]

{ #category : 'hooks' }
SDL3GPUNodeForceDemo >> step [

	self computeSimulation.
	super step
]

{ #category : 'accessing' }
SDL3GPUNodeForceDemo >> updatedTitle [

	| selectionInfo dragInfo |
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
SDL3GPUNodeForceDemo >> uploadEdges [

	gpuDevice uploadToGPUDo: [ :uploader |
		uploader
			uploadTo: edgesBuffer
			type: SDL3GPUEdge
			count: numEdges
			cycle: false
			fromPointer: edgeArray getHandle ]
]

{ #category : 'private' }
SDL3GPUNodeForceDemo >> uploadNodes [

	gpuDevice uploadToGPUDo: [ :uploader |
		uploader
			uploadTo: nodesBufferPing
			type: SDL3GPUNode
			count: numNodes
			cycle: false
			fromPointer: nodeArray getHandle ]
]

{ #category : 'hooks' }
SDL3GPUNodeForceDemo >> visitKeyboardDownEvent: aKeyboardDownEvent [

	| key |
	super visitKeyboardDownEvent: aKeyboardDownEvent.

	key := aKeyboardDownEvent key.
	key = SDLK_UP asInteger ifTrue: [ uniforms springStiffness: uniforms springStiffness + 0.5 ].
	key = SDLK_DOWN asInteger ifTrue: [ uniforms springStiffness: (uniforms springStiffness - 0.5 max: 0.0) ].
	key = SDLK_RIGHT asInteger ifTrue: [ uniforms repulsionWeight: uniforms repulsionWeight + 0.1 ].
	key = SDLK_LEFT asInteger ifTrue: [ uniforms repulsionWeight: (uniforms repulsionWeight - 0.1 max: 0.0) ].
	key = SDLK_PAGEUP asInteger ifTrue: [ uniforms damping: (uniforms damping * 1.5 min: 0.99) ].
	key = SDLK_PAGEDOWN asInteger ifTrue: [ uniforms damping: (uniforms damping / 1.5 max: 0.00001) ].

	self updateTitle
]

{ #category : 'visiting - concrete' }
SDL3GPUNodeForceDemo >> visitMouseButtonDownEvent: aMouseButtonDownEvent [

	| position |
	super visitMouseButtonDownEvent: aMouseButtonDownEvent.

	position := self simulationPositionFromWindowPoint: aMouseButtonDownEvent position.
	self selectNodeAtSimulationPosition: position.

	selectedNodeIndex >= 0 ifFalse: [ ^ self ].
	isDragging := true.
	self updateTitle
]

{ #category : 'visiting - concrete' }
SDL3GPUNodeForceDemo >> visitMouseButtonUpEvent: aMouseButtonUpEvent [

	super visitMouseButtonUpEvent: aMouseButtonUpEvent.

	isDragging := false.
	self updateTitle
]

{ #category : 'visiting - concrete' }
SDL3GPUNodeForceDemo >> visitMouseMotionEvent: aMouseMotionEvent [

	| simPosition |
	super visitMouseMotionEvent: aMouseMotionEvent.

	simPosition := self simulationPositionFromWindowPoint: aMouseMotionEvent position.
	uniforms hoverX: simPosition x.
	uniforms hoverY: simPosition y
]
