Extension { #name : 'SDL3GPURenderPass' }

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> bindGPUFragmentSamplersFirstSlot: first_slot textureSamplerBindings: texture_sampler_bindings numBindings: num_bindings [

	^ self ffiLibrary
		  bindGPUFragmentSamplersRenderPass: self
		  firstSlot: first_slot
		  textureSamplerBindings: texture_sampler_bindings
		  numBindings: num_bindings
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> bindGPUFragmentStorageBuffersFirstSlot: first_slot storageBuffers: storage_buffers numBindings: num_bindings [

	^ self ffiLibrary
		  bindGPUFragmentStorageBuffersRenderPass: self
		  firstSlot: first_slot
		  storageBuffers: storage_buffers
		  numBindings: num_bindings
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> bindGPUFragmentStorageTexturesFirstSlot: first_slot storageTextures: storage_textures numBindings: num_bindings [

	^ self ffiLibrary
		  bindGPUFragmentStorageTexturesRenderPass: self
		  firstSlot: first_slot
		  storageTextures: storage_textures
		  numBindings: num_bindings
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> bindGPUGraphicsPipeline: graphics_pipeline [

	^ self ffiLibrary
		  bindGPUGraphicsPipelineRenderPass: self
		  graphicsPipeline: graphics_pipeline
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> bindGPUIndexBufferBinding: binding indexElementSize: index_element_size [

	^ self ffiLibrary
		  bindGPUIndexBufferRenderPass: self
		  binding: binding
		  indexElementSize: index_element_size
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> bindGPUVertexBuffersFirstSlot: first_slot bindings: bindings numBindings: num_bindings [

	^ self ffiLibrary
		  bindGPUVertexBuffersRenderPass: self
		  firstSlot: first_slot
		  bindings: bindings
		  numBindings: num_bindings
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> bindGPUVertexSamplersFirstSlot: first_slot textureSamplerBindings: texture_sampler_bindings numBindings: num_bindings [

	^ self ffiLibrary
		  bindGPUVertexSamplersRenderPass: self
		  firstSlot: first_slot
		  textureSamplerBindings: texture_sampler_bindings
		  numBindings: num_bindings
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> bindGPUVertexStorageBuffersFirstSlot: first_slot storageBuffers: storage_buffers numBindings: num_bindings [

	^ self ffiLibrary
		  bindGPUVertexStorageBuffersRenderPass: self
		  firstSlot: first_slot
		  storageBuffers: storage_buffers
		  numBindings: num_bindings
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> bindGPUVertexStorageTexturesFirstSlot: first_slot storageTextures: storage_textures numBindings: num_bindings [

	^ self ffiLibrary
		  bindGPUVertexStorageTexturesRenderPass: self
		  firstSlot: first_slot
		  storageTextures: storage_textures
		  numBindings: num_bindings
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> blendConstants: blend_constants [

	^ self ffiLibrary
		  setGPUBlendConstantsRenderPass: self
		  blendConstants: blend_constants
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> drawGPUIndexedPrimitivesIndirectBuffer: buffer offset: offset drawCount: draw_count [

	^ self ffiLibrary
		  drawGPUIndexedPrimitivesIndirectRenderPass: self
		  buffer: buffer
		  offset: offset
		  drawCount: draw_count
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> drawGPUIndexedPrimitivesNumIndices: num_indices numInstances: num_instances firstIndex: first_index vertexOffset: vertex_offset firstInstance: first_instance [

	^ self ffiLibrary
		  drawGPUIndexedPrimitivesRenderPass: self
		  numIndices: num_indices
		  numInstances: num_instances
		  firstIndex: first_index
		  vertexOffset: vertex_offset
		  firstInstance: first_instance
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> drawGPUPrimitivesIndirectBuffer: buffer offset: offset drawCount: draw_count [

	^ self ffiLibrary
		  drawGPUPrimitivesIndirectRenderPass: self
		  buffer: buffer
		  offset: offset
		  drawCount: draw_count
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> drawGPUPrimitivesNumVertices: num_vertices numInstances: num_instances firstVertex: first_vertex firstInstance: first_instance [

	^ self ffiLibrary
		  drawGPUPrimitivesRenderPass: self
		  numVertices: num_vertices
		  numInstances: num_instances
		  firstVertex: first_vertex
		  firstInstance: first_instance
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> end [

	^ self ffiLibrary endGPURenderPass: self
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> scissor: scissor [

	^ self ffiLibrary setGPUScissorRenderPass: self scissor: scissor
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> stencilReference: reference [

	^ self ffiLibrary
		  setGPUStencilReferenceRenderPass: self
		  reference: reference
]

{ #category : '*SDL3-API' }
SDL3GPURenderPass >> viewport: viewport [

	^ self ffiLibrary setGPUViewportRenderPass: self viewport: viewport
]
