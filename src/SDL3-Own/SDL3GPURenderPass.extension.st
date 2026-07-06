Extension { #name : 'SDL3GPURenderPass' }

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> blendConstants: blendConstants [

	self ffiLibrary
		setGPUBlendConstantsRenderPass: self
		blendConstants: blendConstants
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> drawIndexedPrimitives: numIndices instances: numInstances firstIndex: firstIndex vertexOffset: vertexOffset firstInstance: firstInstance [

	self ffiLibrary
		drawGPUIndexedPrimitivesRenderPass: self
		numIndices: numIndices
		numInstances: numInstances
		firstIndex: firstIndex
		vertexOffset: vertexOffset
		firstInstance: firstInstance
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> drawIndexedPrimitivesIndirectBuffer: buffer offset: offset drawCount: drawCount [

	self ffiLibrary
		drawGPUIndexedPrimitivesIndirectRenderPass: self
		buffer: buffer
		offset: offset
		drawCount: drawCount
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> drawPrimitives: numVertices instances: numInstances firstVertex: firstVertex firstInstance: firstInstance [

	self ffiLibrary
		drawGPUPrimitivesRenderPass: self
		numVertices: numVertices
		numInstances: numInstances
		firstVertex: firstVertex
		firstInstance: firstInstance
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> drawPrimitivesIndirectBuffer: buffer offset: offset drawCount: drawCount [

	self ffiLibrary
		drawGPUPrimitivesIndirectRenderPass: self
		buffer: buffer
		offset: offset
		drawCount: drawCount
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> end [

	self ffiLibrary endGPURenderPass: self
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> fragmentSamplers: textureSamplerBindings slot: firstSlot [

	| m |
	m := self pipeline fragmentMetadata.
	m ifNotNil: [ 
		m validateSamplerCount: textureSamplerBindings size ].

	^ self
		 fragmentSamplersSlot: firstSlot
		 bindings: (textureSamplerBindings ifEmpty: [ ExternalAddress null ])
		 count: textureSamplerBindings size
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> fragmentSamplersSlot: firstSlot bindings: textureSamplerBindings count: numBindings [

	self ffiLibrary
		bindGPUFragmentSamplersRenderPass: self
		firstSlot: firstSlot
		textureSamplerBindings: textureSamplerBindings
		numBindings: numBindings
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> fragmentStorageBuffers: storageBuffers slot: firstSlot [

	^ self
		 fragmentStorageBuffersSlot: firstSlot
		 bindings: (storageBuffers ifEmpty: [ ExternalAddress null ])
		 count: storageBuffers size
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> fragmentStorageBuffersSlot: firstSlot bindings: storageBuffers count: numBindings [

	self ffiLibrary
		bindGPUFragmentStorageBuffersRenderPass: self
		firstSlot: firstSlot
		storageBuffers: storageBuffers
		numBindings: numBindings
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> fragmentStorageTextures: storageTextures slot: firstSlot [

	^ self
		 fragmentStorageTexturesSlot: firstSlot
		 bindings: (storageTextures ifEmpty: [ ExternalAddress null ])
		 count: storageTextures size
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> fragmentStorageTexturesSlot: firstSlot bindings: storageTextures count: numBindings [

	self ffiLibrary
		bindGPUFragmentStorageTexturesRenderPass: self
		firstSlot: firstSlot
		storageTextures: storageTextures
		numBindings: numBindings
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> indexBuffer16Bit: aBinding [

	self
		indexBuffer: aBinding
		elementSize: SDL3GPUIndexElementSize at16bit
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> indexBuffer32Bit: aBinding [

	self
		indexBuffer: aBinding
		elementSize: SDL3GPUIndexElementSize at32bit
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> indexBuffer: binding elementSize: indexElementSize [

	self ffiLibrary
		bindGPUIndexBufferRenderPass: self
		binding: binding
		indexElementSize: indexElementSize
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> releaseFromGPUDevice [
	"Passes are released when they are ended."

	self end
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> scissor: scissor [

	self ffiLibrary setGPUScissorRenderPass: self scissor: scissor
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> stencilReference: reference [

	self ffiLibrary
		setGPUStencilReferenceRenderPass: self
		reference: reference
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> vertexBuffers: anArray slot: firstSlot [

	^ self
		 vertexBuffersSlot: firstSlot
		 bindings: (anArray ifEmpty: [ ExternalAddress null ])
		 count: anArray size
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> vertexBuffersSlot: firstSlot bindings: bindings count: numBindings [

	self ffiLibrary
		bindGPUVertexBuffersRenderPass: self
		firstSlot: firstSlot
		bindings: bindings
		numBindings: numBindings
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> vertexSamplers: textureSamplerBindings slot: firstSlot [

	^ self
		 vertexSamplersSlot: firstSlot
		 bindings: (textureSamplerBindings ifEmpty: [ ExternalAddress null ])
		 count: textureSamplerBindings size
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> vertexSamplersSlot: firstSlot bindings: textureSamplerBindings count: numBindings [

	self ffiLibrary
		bindGPUVertexSamplersRenderPass: self
		firstSlot: firstSlot
		textureSamplerBindings: textureSamplerBindings
		numBindings: numBindings
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> vertexStorageBuffers: storageBuffers slot: firstSlot [

	^ self
		 vertexStorageBuffersSlot: firstSlot
		 bindings: (storageBuffers ifEmpty: [ ExternalAddress null ])
		 count: storageBuffers size
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> vertexStorageBuffersSlot: firstSlot bindings: storageBuffers count: numBindings [

	self ffiLibrary
		bindGPUVertexStorageBuffersRenderPass: self
		firstSlot: firstSlot
		storageBuffers: storageBuffers
		numBindings: numBindings
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> vertexStorageTextures: storageTextures slot: firstSlot [

	^ self
		 vertexStorageTexturesSlot: firstSlot
		 bindings: (storageTextures ifEmpty: [ ExternalAddress null ])
		 count: storageTextures size
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> vertexStorageTexturesSlot: firstSlot bindings: storageTextures count: numBindings [

	self ffiLibrary
		bindGPUVertexStorageTexturesRenderPass: self
		firstSlot: firstSlot
		storageTextures: storageTextures
		numBindings: numBindings
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> viewport: viewport [

	self ffiLibrary setGPUViewportRenderPass: self viewport: viewport
]
