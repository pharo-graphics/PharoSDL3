Extension { #name : 'SDL3GPUComputePass' }

{ #category : '*SDL3-API' }
SDL3GPUComputePass >> bindGPUComputePipeline: computePipeline [

	self ffiLibrary
		bindGPUComputePipelineComputePass: self
		computePipeline: computePipeline
]

{ #category : '*SDL3-API' }
SDL3GPUComputePass >> bindGPUComputeSamplersFirstSlot: firstSlot textureSamplerBindings: textureSamplerBindings numBindings: numBindings [

	self ffiLibrary
		bindGPUComputeSamplersComputePass: self
		firstSlot: firstSlot
		textureSamplerBindings: textureSamplerBindings
		numBindings: numBindings
]

{ #category : '*SDL3-API' }
SDL3GPUComputePass >> bindGPUComputeStorageBuffersFirstSlot: firstSlot storageBuffers: storageBuffers numBindings: numBindings [

	self ffiLibrary
		bindGPUComputeStorageBuffersComputePass: self
		firstSlot: firstSlot
		storageBuffers: storageBuffers
		numBindings: numBindings
]

{ #category : '*SDL3-API' }
SDL3GPUComputePass >> bindGPUComputeStorageTexturesFirstSlot: firstSlot storageTextures: storageTextures numBindings: numBindings [

	self ffiLibrary
		bindGPUComputeStorageTexturesComputePass: self
		firstSlot: firstSlot
		storageTextures: storageTextures
		numBindings: numBindings
]

{ #category : '*SDL3-API' }
SDL3GPUComputePass >> dispatchGPUComputeIndirectBuffer: buffer offset: offset [

	self ffiLibrary
		dispatchGPUComputeIndirectComputePass: self
		buffer: buffer
		offset: offset
]

{ #category : '*SDL3-API' }
SDL3GPUComputePass >> dispatchWorkgroupCountX: groupcountX y: groupcountY z: groupcountZ [

	self ffiLibrary
		dispatchGPUComputeComputePass: self
		groupcountX: groupcountX
		groupcountY: groupcountY
		groupcountZ: groupcountZ
]

{ #category : '*SDL3-API' }
SDL3GPUComputePass >> end [

	self ffiLibrary endGPUComputePass: self
]
