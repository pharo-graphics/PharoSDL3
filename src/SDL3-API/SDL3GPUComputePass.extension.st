Extension { #name : 'SDL3GPUComputePass' }

{ #category : '*SDL3-API' }
SDL3GPUComputePass >> bindGPUComputePipeline: compute_pipeline [

	^ self ffiLibrary
		  bindGPUComputePipelineComputePass: self
		  computePipeline: compute_pipeline
]

{ #category : '*SDL3-API' }
SDL3GPUComputePass >> bindGPUComputeSamplersFirstSlot: first_slot textureSamplerBindings: texture_sampler_bindings numBindings: num_bindings [

	^ self ffiLibrary
		  bindGPUComputeSamplersComputePass: self
		  firstSlot: first_slot
		  textureSamplerBindings: texture_sampler_bindings
		  numBindings: num_bindings
]

{ #category : '*SDL3-API' }
SDL3GPUComputePass >> bindGPUComputeStorageBuffersFirstSlot: first_slot storageBuffers: storage_buffers numBindings: num_bindings [

	^ self ffiLibrary
		  bindGPUComputeStorageBuffersComputePass: self
		  firstSlot: first_slot
		  storageBuffers: storage_buffers
		  numBindings: num_bindings
]

{ #category : '*SDL3-API' }
SDL3GPUComputePass >> bindGPUComputeStorageTexturesFirstSlot: first_slot storageTextures: storage_textures numBindings: num_bindings [

	^ self ffiLibrary
		  bindGPUComputeStorageTexturesComputePass: self
		  firstSlot: first_slot
		  storageTextures: storage_textures
		  numBindings: num_bindings
]

{ #category : '*SDL3-API' }
SDL3GPUComputePass >> dispatchGPUComputeGroupcountX: groupcount_x groupcountY: groupcount_y groupcountZ: groupcount_z [

	^ self ffiLibrary
		  dispatchGPUComputeComputePass: self
		  groupcountX: groupcount_x
		  groupcountY: groupcount_y
		  groupcountZ: groupcount_z
]

{ #category : '*SDL3-API' }
SDL3GPUComputePass >> dispatchGPUComputeIndirectBuffer: buffer offset: offset [

	^ self ffiLibrary
		  dispatchGPUComputeIndirectComputePass: self
		  buffer: buffer
		  offset: offset
]

{ #category : '*SDL3-API' }
SDL3GPUComputePass >> end [

	^ self ffiLibrary endGPUComputePass: self
]
