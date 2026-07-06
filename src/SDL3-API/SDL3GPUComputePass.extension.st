Extension { #name : 'SDL3GPUComputePass' }

{ #category : '*SDL3-API' }
SDL3GPUComputePass >> computeSamplersSlot: firstSlot bindings: textureSamplerBindings count: numBindings [

	self ffiLibrary
		bindGPUComputeSamplersComputePass: self
		firstSlot: firstSlot
		textureSamplerBindings: textureSamplerBindings
		numBindings: numBindings
]

{ #category : '*SDL3-API' }
SDL3GPUComputePass >> computeStorageBuffersSlot: firstSlot bindings: storageBuffers count: numBindings [

	self ffiLibrary
		bindGPUComputeStorageBuffersComputePass: self
		firstSlot: firstSlot
		storageBuffers: storageBuffers
		numBindings: numBindings
]

{ #category : '*SDL3-API' }
SDL3GPUComputePass >> computeStorageTexturesSlot: firstSlot bindings: storageTextures count: numBindings [

	self ffiLibrary
		bindGPUComputeStorageTexturesComputePass: self
		firstSlot: firstSlot
		storageTextures: storageTextures
		numBindings: numBindings
]

{ #category : '*SDL3-API' }
SDL3GPUComputePass >> dispatchIndirectBuffer: buffer offset: offset [

	self ffiLibrary
		dispatchGPUComputeIndirectComputePass: self
		buffer: buffer
		offset: offset
]

{ #category : '*SDL3-API' }
SDL3GPUComputePass >> end [

	self ffiLibrary endGPUComputePass: self
]

{ #category : '*SDL3-API' }
SDL3GPUComputePass >> releaseFromGPUDevice [
	"Passes are released when they are ended."

	self end
]
