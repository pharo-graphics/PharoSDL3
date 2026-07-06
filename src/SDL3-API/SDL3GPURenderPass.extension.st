Extension { #name : 'SDL3GPURenderPass' }

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> blendConstants: blendConstants [

	self ffiLibrary
		setGPUBlendConstantsRenderPass: self
		blendConstants: blendConstants
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> drawIndexedPrimitives: numIndices instances: numInstances firstIndex: firstIndex vertexOffset: vertexOffset firstInstance: firstInstance [

	self ffiLibrary
		drawGPUIndexedPrimitivesRenderPass: self
		numIndices: numIndices
		numInstances: numInstances
		firstIndex: firstIndex
		vertexOffset: vertexOffset
		firstInstance: firstInstance
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> drawIndexedPrimitivesIndirectBuffer: buffer offset: offset drawCount: drawCount [

	self ffiLibrary
		drawGPUIndexedPrimitivesIndirectRenderPass: self
		buffer: buffer
		offset: offset
		drawCount: drawCount
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> drawPrimitives: numVertices instances: numInstances firstVertex: firstVertex firstInstance: firstInstance [

	self ffiLibrary
		drawGPUPrimitivesRenderPass: self
		numVertices: numVertices
		numInstances: numInstances
		firstVertex: firstVertex
		firstInstance: firstInstance
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> drawPrimitivesIndirectBuffer: buffer offset: offset drawCount: drawCount [

	self ffiLibrary
		drawGPUPrimitivesIndirectRenderPass: self
		buffer: buffer
		offset: offset
		drawCount: drawCount
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> end [

	self ffiLibrary endGPURenderPass: self
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> fragmentSamplersSlot: firstSlot bindings: textureSamplerBindings count: numBindings [

	self ffiLibrary
		bindGPUFragmentSamplersRenderPass: self
		firstSlot: firstSlot
		textureSamplerBindings: textureSamplerBindings
		numBindings: numBindings
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> fragmentStorageBuffersSlot: firstSlot bindings: storageBuffers count: numBindings [

	self ffiLibrary
		bindGPUFragmentStorageBuffersRenderPass: self
		firstSlot: firstSlot
		storageBuffers: storageBuffers
		numBindings: numBindings
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> fragmentStorageTexturesSlot: firstSlot bindings: storageTextures count: numBindings [

	self ffiLibrary
		bindGPUFragmentStorageTexturesRenderPass: self
		firstSlot: firstSlot
		storageTextures: storageTextures
		numBindings: numBindings
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> indexBuffer: binding elementSize: indexElementSize [

	self ffiLibrary
		bindGPUIndexBufferRenderPass: self
		binding: binding
		indexElementSize: indexElementSize
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> releaseFromGPUDevice [
	"Passes are released when they are ended."

	self end
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> scissor: scissor [

	self ffiLibrary setGPUScissorRenderPass: self scissor: scissor
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> stencilReference: reference [

	self ffiLibrary
		setGPUStencilReferenceRenderPass: self
		reference: reference
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> vertexBuffersSlot: firstSlot bindings: bindings count: numBindings [

	self ffiLibrary
		bindGPUVertexBuffersRenderPass: self
		firstSlot: firstSlot
		bindings: bindings
		numBindings: numBindings
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> vertexSamplersSlot: firstSlot bindings: textureSamplerBindings count: numBindings [

	self ffiLibrary
		bindGPUVertexSamplersRenderPass: self
		firstSlot: firstSlot
		textureSamplerBindings: textureSamplerBindings
		numBindings: numBindings
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> vertexStorageBuffersSlot: firstSlot bindings: storageBuffers count: numBindings [

	self ffiLibrary
		bindGPUVertexStorageBuffersRenderPass: self
		firstSlot: firstSlot
		storageBuffers: storageBuffers
		numBindings: numBindings
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> vertexStorageTexturesSlot: firstSlot bindings: storageTextures count: numBindings [

	self ffiLibrary
		bindGPUVertexStorageTexturesRenderPass: self
		firstSlot: firstSlot
		storageTextures: storageTextures
		numBindings: numBindings
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> viewport: viewport [

	self ffiLibrary setGPUViewportRenderPass: self viewport: viewport
]
