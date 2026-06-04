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
SDL3GPUNodeForceDemo >> bindSharedGraphicsResourcesTo: aRenderPass with: aCommandBuffer [

	aRenderPass bindGPUVertexBuffersFirstSlot: 0 bindings: vertexBufferBindings.
	aRenderPass
		bindGPUVertexStorageBuffersFirstSlot: 0
		storageBuffers: storageBuffers.
	aRenderPass bindGPUIndexBufferBinding: indexBufferBinding indexElementSize: SDL_GPU_INDEXELEMENTSIZE_16BIT.

	uniforms aspectRatio: window extent x asFloat / (window extent y max: 1).
	uniforms selectedNodeIndex: selectedNodeIndex.
	aCommandBuffer pushGPUVertexUniformDataSlotIndex: 0 data: uniforms length: SDL3GPUNodeForceUniforms structureSize
]

{ #category : 'lifecycle' }
SDL3GPUNodeForceDemo >> close [

	nodesBufferPing ifNotNil: [
		gpuDevice releaseGPUBuffer: nodesBufferPing.
		nodesBufferPing := nil ].
	nodesBufferPong ifNotNil: [
		gpuDevice releaseGPUBuffer: nodesBufferPong.
		nodesBufferPong := nil ].
	edgesBuffer ifNotNil: [
		gpuDevice releaseGPUBuffer: edgesBuffer.
		edgesBuffer := nil ].

	vertexBuffer ifNotNil: [
		gpuDevice releaseGPUBuffer: vertexBuffer.
		vertexBuffer := nil ].
	indexBuffer ifNotNil: [
		gpuDevice releaseGPUBuffer: indexBuffer.
		indexBuffer := nil ].

	computePipeline ifNotNil: [
		gpuDevice releaseGPUComputePipeline: computePipeline.
		computePipeline := nil ].
	nodePipeline ifNotNil: [
		gpuDevice releaseGPUGraphicsPipeline: nodePipeline.
		nodePipeline := nil ].
	edgePipeline ifNotNil: [
		gpuDevice releaseGPUGraphicsPipeline: edgePipeline.
		edgePipeline := nil ].

	super close
]

{ #category : 'rendering' }
SDL3GPUNodeForceDemo >> computeSimulation [

	| nextBuffer commandBuffer |
	commandBuffer := gpuDevice acquireGPUCommandBuffer.

	"Ping-pong"
	nextBuffer := currentNodesBuffer == nodesBufferPing
					 ifTrue: [ nodesBufferPong ]
					 ifFalse: [ nodesBufferPing ].

	self pushSimulationUniformsTo: commandBuffer.
	self
		executeSimulationComputePassWith: commandBuffer
		input: currentNodesBuffer
		output: nextBuffer.

	commandBuffer submit.

	"Ping-pong"
	currentNodesBuffer := nextBuffer
]

{ #category : 'rendering' }
SDL3GPUNodeForceDemo >> doRenderPassesOn: aTexture with: aCommandBuffer [

	| renderPass colorTargetInfos |
	colorTargetInfos := FFIExternalArray externalNewType: SDL_GPUColorTargetInfo size: 1.
	colorTargetInfos autoRelease.
	colorTargetInfos first
		texture: aTexture;
		storeOp: SDL_GPU_STOREOP_STORE;
		loadOp: SDL_GPU_LOADOP_CLEAR;
		updateClearColorFrom: Color black.

	renderPass := aCommandBuffer
					 beginGPURenderPassColorTargetInfos: colorTargetInfos
					 depthStencilTargetInfo: nil.

	self bindSharedGraphicsResourcesTo: renderPass with: aCommandBuffer.
	self drawEdgesOn: renderPass.
	self drawNodesOn: renderPass.

	renderPass end

]

{ #category : 'private' }
SDL3GPUNodeForceDemo >> drawEdgesOn: aRenderPass [

	aRenderPass bindGPUGraphicsPipeline: edgePipeline.
	aRenderPass
		drawGPUIndexedPrimitivesNumIndices: 6
		numInstances: numEdges
		firstIndex: 0
		vertexOffset: 0
		firstInstance: 0
]

{ #category : 'private' }
SDL3GPUNodeForceDemo >> drawNodesOn: aRenderPass [

	aRenderPass bindGPUGraphicsPipeline: nodePipeline.
	aRenderPass
		drawGPUIndexedPrimitivesNumIndices: 6
		numInstances: numNodes
		firstIndex: 0
		vertexOffset: 0
		firstInstance: 0
]

{ #category : 'private' }
SDL3GPUNodeForceDemo >> executeSimulationComputePassWith: commandBuffer input: inputBuffer output: outputBuffer [

	| computePass |
	storageBufferBindings first
		buffer: outputBuffer;
		cycle: false.
	computePass := commandBuffer
					  beginGPUComputePassStorageTextureBindings: #()
					  storageBufferBindings: storageBufferBindings.

	storageBuffers at: 1 put: currentNodesBuffer getHandle.
	storageBuffers at: 2 put: edgesBuffer getHandle.

	computePass
		bindGPUComputePipeline: computePipeline;
		bindGPUComputeStorageBuffersFirstSlot: 0
		storageBuffers: storageBuffers;
		dispatchWorkgroupCountX: numNodes + 63 // 64
		y: 1
		z: 1;
		end
]

{ #category : 'private' }
SDL3GPUNodeForceDemo >> fillIndexTransfer: aTransfer [

	| mappedAddress indices |
	mappedAddress := gpuDevice mapGPUTransferBuffer: aTransfer cycle: false.
	indices := FFIArray fromHandle: mappedAddress type: #uint16 size: 6.
	#( 0 1 2 0 2 3 ) withIndexDo: [ :val :idx | indices at: idx put: val ].
	gpuDevice unmapGPUTransferBuffer: aTransfer
]

{ #category : 'private' }
SDL3GPUNodeForceDemo >> fillVertexTransfer: aTransfer [

	| mappedAddress |
	mappedAddress := gpuDevice mapGPUTransferBuffer: aTransfer cycle: false.
	#( (0 0) (1 0) (1 1) (0 1) ) withIndexDo: [ :uv :idx |
		| v |
		v := SDL3GPUQuadVertex fromHandle: mappedAddress + ((idx - 1) * SDL3GPUQuadVertex structureSize).
		v x: uv first asFloat; y: uv second asFloat; z: 0.0; u: uv first asFloat; v: uv second asFloat ].
	gpuDevice unmapGPUTransferBuffer: aTransfer
]

{ #category : 'private' }
SDL3GPUNodeForceDemo >> findNodeAtSimulationPosition: aPoint among: aNodeArray [

	aNodeArray withIndexDo: [ :node :i |
		| distance |
		distance := (node x @ node y) distanceTo: aPoint.
		distance < node radius ifTrue: [ ^ i - 1 ] ].

	^ -1
]

{ #category : 'initialization' }
SDL3GPUNodeForceDemo >> initialize [

	super initialize.

	numNodes := 64.
	numEdges := 128.
	
	self initializeUniforms.
	self initializeGPUStateContainers.
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

	storageBuffers := FFIExternalArray externalNewType: ExternalAddress size: 2.
	storageBuffers autoRelease.
	
	storageBufferBindings := FFIExternalArray externalNewType: SDL_GPUStorageBufferReadWriteBinding size: 1.
	storageBufferBindings autoRelease.

	vertexBufferBindings := FFIExternalArray externalNewType: SDL_GPUBufferBinding size: 1.
	vertexBufferBindings autoRelease.

	selectedNodeIndex := -1.

	isDragging := false.
]

{ #category : 'initialization' }
SDL3GPUNodeForceDemo >> initializeGeometry [

	| vSize iSize vTransfer iTransfer |
	vSize := 4 * SDL3GPUQuadVertex structureSize.
	iSize := 6 * 2.

	vertexBuffer := gpuDevice
		               newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_VERTEX
		               size: vSize.
	indexBuffer := gpuDevice
		              newGPUBufferUsage: SDL_GPU_BUFFERUSAGE_INDEX
		              size: iSize.

	vTransfer := gpuDevice newUploadTransferBuffer: vSize.
	iTransfer := gpuDevice newUploadTransferBuffer: iSize.

	self fillVertexTransfer: vTransfer.
	self fillIndexTransfer: iTransfer.
	self uploadVertex: vTransfer index: iTransfer.

	gpuDevice releaseGPUTransferBuffer: vTransfer.
	gpuDevice releaseGPUTransferBuffer: iTransfer.

	vertexBufferBindings first
		buffer: vertexBuffer;
		offset: 0.
	indexBufferBinding := SDL_GPUBufferBinding externalNew
		                     buffer: indexBuffer;
		                     yourself.
	indexBufferBinding autoRelease
]

{ #category : 'initialization' }
SDL3GPUNodeForceDemo >> initializeGraph [

	| random |
	numNodes := 64.
	numEdges := 128.

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
SDL3GPUNodeForceDemo >> initializeShaders [

	| formats colorTargets |
	formats := gpuDevice gpuShaderFormatsAsArray.
	computePipeline := SDL3GPUNodeForceComputeShaderSource
						  newComputePipelineAmong: formats
						  device: gpuDevice.

	colorTargets := self newColorTargetDescriptions: 1.
	colorTargets first format:
		(gpuDevice getGPUSwapchainTextureFormatIntoWindow: window).

	self newNodePipelineWith: formats colorTargets: colorTargets.
	self newEdgePipelineWith: formats colorTargets: colorTargets
]

{ #category : 'initialization' }
SDL3GPUNodeForceDemo >> initializeUniforms [

	uniforms := SDL3GPUNodeForceUniforms externalNew.
	uniforms autoRelease.
	uniforms
		numNodes: numNodes;
		numEdges: numEdges;
		deltaTime: 0.016;
		springStiffness: 5.0;
		repulsionWeight: 1.0;
		repulsionRadius: 0.5;
		centerGravityWeight: 0.5;
		damping: 0.01;
		maxVelocity: 2.0;
		aspectRatio: 1.0;
		hoverX: -10.0;
		hoverY: -10.0;
		isDragging: 0.
]

{ #category : 'private' }
SDL3GPUNodeForceDemo >> newAlphaBlendState [

	^ SDL_GPUColorTargetBlendState new
		 enableBlend: true;
		 srcColorBlendfactor: SDL_GPU_BLENDFACTOR_SRC_ALPHA;
		 dstColorBlendfactor: SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA;
		 colorBlendOp: SDL_GPU_BLENDOP_ADD;
		 srcAlphaBlendfactor: SDL_GPU_BLENDFACTOR_ONE;
		 dstAlphaBlendfactor: SDL_GPU_BLENDFACTOR_ZERO;
		 alphaBlendOp: SDL_GPU_BLENDOP_ADD;
		 yourself
]

{ #category : 'private' }
SDL3GPUNodeForceDemo >> newEdgePipelineWith: aFormatArray colorTargets: colorTargets [

	| vertexShader fragmentShader pipelineCreateInfo |
	vertexShader := SDL3GPUEdgeVertexShaderSource
						newShaderAmong: aFormatArray
						device: gpuDevice.
	fragmentShader := SDL3GPUEdgeFragmentShaderSource
						 newShaderAmong: aFormatArray
						 device: gpuDevice.

	colorTargets first blendState: self newAlphaBlendState.

	pipelineCreateInfo := self
							 newGraphicsPipelineCreateInfoFor: vertexShader
							 colorTargets: colorTargets.
	pipelineCreateInfo fragmentShader: fragmentShader.

	edgePipeline := gpuDevice newGPUGraphicsPipelineCreateinfo:
						pipelineCreateInfo.
	gpuDevice
		releaseGPUShader: vertexShader;
		releaseGPUShader: fragmentShader
]

{ #category : 'private' }
SDL3GPUNodeForceDemo >> newGraphicsPipelineCreateInfoFor: vertexShader colorTargets: colorTargets [

	| pipelineCreateInfo vertexBindings vertexAttributes |
	vertexBindings := self newNodeVertexBindings.
	vertexAttributes := self newNodeVertexAttributes.

	pipelineCreateInfo := SDL3GPUGraphicsPipelineCreateInfo externalNew
							 autoRelease.
	pipelineCreateInfo
		primitiveType: SDL_GPU_PRIMITIVETYPE_TRIANGLELIST;
		vertexShader: vertexShader.
	pipelineCreateInfo targetInfo
		colorTargetDescriptions: colorTargets;
		numColorTargets: 1;
		hasDepthStencilTarget: false.
	pipelineCreateInfo vertexInputState
		vertexAttributes: vertexAttributes;
		numVertexAttributes: 2;
		vertexBufferDescriptions: vertexBindings;
		numVertexBuffers: 1.
	^ pipelineCreateInfo
]

{ #category : 'private' }
SDL3GPUNodeForceDemo >> newNodePipelineWith: aFormatArray colorTargets: colorTargets [

	| vertexShader fragmentShader pipelineCreateInfo |
	vertexShader := SDL3GPUNodeVertexShaderSource
						newShaderAmong: aFormatArray
						device: gpuDevice.
	fragmentShader := SDL3GPUNodeFragmentShaderSource
						 newShaderAmong: aFormatArray
						 device: gpuDevice.

	colorTargets first blendState: self newAlphaBlendState.

	pipelineCreateInfo := self
							 newGraphicsPipelineCreateInfoFor: vertexShader
							 colorTargets: colorTargets.
	pipelineCreateInfo fragmentShader: fragmentShader.

	nodePipeline := gpuDevice newGPUGraphicsPipelineCreateinfo:
						pipelineCreateInfo.
	gpuDevice
		releaseGPUShader: vertexShader;
		releaseGPUShader: fragmentShader
]

{ #category : 'private' }
SDL3GPUNodeForceDemo >> newNodeVertexAttributes [

	| vertexAttributes |
	vertexAttributes := FFIExternalArray
							externalNewType: SDL_GPUVertexAttribute
							size: 2.
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
	^ vertexAttributes
]

{ #category : 'private' }
SDL3GPUNodeForceDemo >> newNodeVertexBindings [

	| vertexBindings |
	vertexBindings := FFIExternalArray
						 externalNewType: SDL_GPUVertexBufferDescription
						 size: 1.
	vertexBindings autoRelease.
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
	self uploadGraph.
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
		isDragging: (isDragging
				ifTrue: [ 1 ]
				ifFalse: [ 0 ]).

	commandBuffer
		pushGPUComputeUniformDataSlotIndex: 0
		data: uniforms
		length: SDL3GPUNodeForceUniforms structureSize
]

{ #category : 'actions' }
SDL3GPUNodeForceDemo >> selectNodeAtSimulationPosition: aPoint [

	| nodesSize transfer mappedNodes |
	nodesSize := numNodes * SDL3GPUNode structureSize.
	transfer := gpuDevice newDownloadTransferBuffer: nodesSize.

	gpuDevice acquireGPUCommandBuffer in: [ :commandBuffer | 
		| copyPass |
		copyPass := commandBuffer beginGPUCopyPass.
		copyPass
			downloadFromGPUBufferSource: (SDL_GPUBufferRegion new
					buffer: currentNodesBuffer;
					offset: 0;
					size: nodesSize;
					yourself)
			destination: (SDL_GPUTransferBufferLocation new
					transferBuffer: transfer;
					offset: 0;
					yourself).
		copyPass end.
		commandBuffer submit ].

	gpuDevice waitForGPUIdle.

	mappedNodes := FFIArray
		              fromHandle:
		              (gpuDevice mapGPUTransferBuffer: transfer cycle: false)
		              type: SDL3GPUNode
		              size: numNodes.
	selectedNodeIndex := self
		                    findNodeAtSimulationPosition: aPoint
		                    among: mappedNodes.

	gpuDevice unmapGPUTransferBuffer: transfer.
	gpuDevice releaseGPUTransferBuffer: transfer.
	self updateTitle
]

{ #category : 'private' }
SDL3GPUNodeForceDemo >> simulationPositionFromWindowPoint: aPoint [

	| nx ny winExtent aspect bx by |
	winExtent := window extent.
	nx := aPoint x / (winExtent x max: 1) asFloat.
	ny := aPoint y / (winExtent y max: 1) asFloat.
	
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

	| edgesSize transfer mappedAddress |
	edgesSize := numEdges * SDL3GPUEdge structureSize.
	transfer := gpuDevice newUploadTransferBuffer: edgesSize.

	mappedAddress := gpuDevice mapGPUTransferBuffer: transfer cycle: false.
	LibC memCopy: edgeArray getHandle to: mappedAddress size: edgesSize.
	gpuDevice unmapGPUTransferBuffer: transfer.

	gpuDevice acquireGPUCommandBuffer in: [ :commandBuffer | 
		| copyPass |
		copyPass := commandBuffer beginGPUCopyPass.
		copyPass
			uploadToGPUBufferSource: (SDL_GPUTransferBufferLocation new
					transferBuffer: transfer;
					offset: 0;
					yourself)
			destination: (SDL_GPUBufferRegion new
					buffer: edgesBuffer;
					offset: 0;
					size: edgesSize;
					yourself)
			cycle: false.
		copyPass end.
		commandBuffer submit ].

	gpuDevice releaseGPUTransferBuffer: transfer
]

{ #category : 'private' }
SDL3GPUNodeForceDemo >> uploadGraph [

	self uploadNodes.
	self uploadEdges
]

{ #category : 'private' }
SDL3GPUNodeForceDemo >> uploadNodes [

	| nodesSize transfer mappedAddress |
	nodesSize := numNodes * SDL3GPUNode structureSize.
	transfer := gpuDevice newUploadTransferBuffer: nodesSize.

	mappedAddress := gpuDevice mapGPUTransferBuffer: transfer cycle: false.
	LibC memCopy: nodeArray getHandle to: mappedAddress size: nodesSize.
	gpuDevice unmapGPUTransferBuffer: transfer.

	gpuDevice acquireGPUCommandBuffer in: [ :commandBuffer | 
		| copyPass |
		copyPass := commandBuffer beginGPUCopyPass.
		copyPass
			uploadToGPUBufferSource: (SDL_GPUTransferBufferLocation new
					transferBuffer: transfer;
					offset: 0;
					yourself)
			destination: (SDL_GPUBufferRegion new
					buffer: nodesBufferPing;
					offset: 0;
					size: nodesSize;
					yourself)
			cycle: false.
		copyPass end.
		commandBuffer submit ].

	gpuDevice releaseGPUTransferBuffer: transfer
]

{ #category : 'private' }
SDL3GPUNodeForceDemo >> uploadVertex: vTransfer index: iTransfer [

	| copyCB copyPass |
	copyCB := gpuDevice acquireGPUCommandBuffer.
	copyPass := copyCB beginGPUCopyPass.
	copyPass
		uploadToGPUBufferSource: (SDL_GPUTransferBufferLocation new
				transferBuffer: vTransfer;
				offset: 0;
				yourself)
		destination: (SDL_GPUBufferRegion new
				buffer: vertexBuffer;
				offset: 0;
				size: 4 * SDL3GPUQuadVertex structureSize;
				yourself)
		cycle: false.
	copyPass
		uploadToGPUBufferSource: (SDL_GPUTransferBufferLocation new
				transferBuffer: iTransfer;
				offset: 0;
				yourself)
		destination: (SDL_GPUBufferRegion new
				buffer: indexBuffer;
				offset: 0;
				size: 6 * 2;
				yourself)
		cycle: false.
	copyPass end.
	copyCB submit
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
	uniforms hoverY: simPosition y.
]
