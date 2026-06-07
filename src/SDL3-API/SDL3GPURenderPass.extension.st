Extension { #name : 'SDL3GPURenderPass' }

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> bindGPUFragmentSamplersFirstSlot: firstSlot textureSamplerBindings: textureSamplerBindings numBindings: numBindings [

	self ffiLibrary
		bindGPUFragmentSamplersRenderPass: self
		firstSlot: firstSlot
		textureSamplerBindings: textureSamplerBindings
		numBindings: numBindings
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> bindGPUFragmentStorageBuffersFirstSlot: firstSlot storageBuffers: storageBuffers numBindings: numBindings [

	self ffiLibrary
		bindGPUFragmentStorageBuffersRenderPass: self
		firstSlot: firstSlot
		storageBuffers: storageBuffers
		numBindings: numBindings
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> bindGPUFragmentStorageTexturesFirstSlot: firstSlot storageTextures: storageTextures numBindings: numBindings [

	self ffiLibrary
		bindGPUFragmentStorageTexturesRenderPass: self
		firstSlot: firstSlot
		storageTextures: storageTextures
		numBindings: numBindings
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> bindGPUGraphicsPipeline: graphicsPipeline [

	self ffiLibrary
		bindGPUGraphicsPipelineRenderPass: self
		graphicsPipeline: graphicsPipeline
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> bindGPUIndexBufferBinding: binding indexElementSize: indexElementSize [

	self ffiLibrary
		bindGPUIndexBufferRenderPass: self
		binding: binding
		indexElementSize: indexElementSize
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> bindGPUVertexBuffersFirstSlot: firstSlot bindings: bindings numBindings: numBindings [

	self ffiLibrary
		bindGPUVertexBuffersRenderPass: self
		firstSlot: firstSlot
		bindings: bindings
		numBindings: numBindings
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> bindGPUVertexSamplersFirstSlot: firstSlot textureSamplerBindings: textureSamplerBindings numBindings: numBindings [

	self ffiLibrary
		bindGPUVertexSamplersRenderPass: self
		firstSlot: firstSlot
		textureSamplerBindings: textureSamplerBindings
		numBindings: numBindings
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> bindGPUVertexStorageBuffersFirstSlot: firstSlot storageBuffers: storageBuffers numBindings: numBindings [

	self ffiLibrary
		bindGPUVertexStorageBuffersRenderPass: self
		firstSlot: firstSlot
		storageBuffers: storageBuffers
		numBindings: numBindings
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> bindGPUVertexStorageTexturesFirstSlot: firstSlot storageTextures: storageTextures numBindings: numBindings [

	self ffiLibrary
		bindGPUVertexStorageTexturesRenderPass: self
		firstSlot: firstSlot
		storageTextures: storageTextures
		numBindings: numBindings
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> blendConstants: blendConstants [

	self ffiLibrary
		setGPUBlendConstantsRenderPass: self
		blendConstants: blendConstants
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> drawGPUIndexedPrimitivesIndirectBuffer: buffer offset: offset drawCount: drawCount [

	self ffiLibrary
		drawGPUIndexedPrimitivesIndirectRenderPass: self
		buffer: buffer
		offset: offset
		drawCount: drawCount
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> drawGPUIndexedPrimitivesNumIndices: numIndices numInstances: numInstances firstIndex: firstIndex vertexOffset: vertexOffset firstInstance: firstInstance [

	self ffiLibrary
		drawGPUIndexedPrimitivesRenderPass: self
		numIndices: numIndices
		numInstances: numInstances
		firstIndex: firstIndex
		vertexOffset: vertexOffset
		firstInstance: firstInstance
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> drawGPUPrimitivesIndirectBuffer: buffer offset: offset drawCount: drawCount [

	self ffiLibrary
		drawGPUPrimitivesIndirectRenderPass: self
		buffer: buffer
		offset: offset
		drawCount: drawCount
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> drawGPUPrimitivesNumVertices: numVertices numInstances: numInstances firstVertex: firstVertex firstInstance: firstInstance [

	self ffiLibrary
		drawGPUPrimitivesRenderPass: self
		numVertices: numVertices
		numInstances: numInstances
		firstVertex: firstVertex
		firstInstance: firstInstance
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> end [

	self ffiLibrary endGPURenderPass: self
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
SDL3GPURenderPass >> viewport: viewport [

	self ffiLibrary setGPUViewportRenderPass: self viewport: viewport
]
