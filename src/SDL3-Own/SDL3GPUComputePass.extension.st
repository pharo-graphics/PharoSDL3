Extension { #name : 'SDL3GPUComputePass' }

{ #category : '*SDL3-Own' }
SDL3GPUComputePass >> computeSamplers: textureSamplerBindings slot: firstSlot [

	^ self
		 computeSamplersSlot: firstSlot
		 bindings: (textureSamplerBindings ifEmpty: [ ExternalAddress null ])
		 count: textureSamplerBindings size
]

{ #category : '*SDL3-Own' }
SDL3GPUComputePass >> computeSamplersSlot: firstSlot bindings: textureSamplerBindings count: numBindings [

	self ffiLibrary
		bindGPUComputeSamplersComputePass: self
		firstSlot: firstSlot
		textureSamplerBindings: textureSamplerBindings
		numBindings: numBindings
]

{ #category : '*SDL3-Own' }
SDL3GPUComputePass >> computeStorageBuffers: storageBuffers slot: firstSlot [

	^ self
		 computeStorageBuffersSlot: firstSlot
		 bindings: (storageBuffers ifEmpty: [ ExternalAddress null ])
		 count: storageBuffers size
]

{ #category : '*SDL3-Own' }
SDL3GPUComputePass >> computeStorageBuffersSlot: firstSlot bindings: storageBuffers count: numBindings [

	self ffiLibrary
		bindGPUComputeStorageBuffersComputePass: self
		firstSlot: firstSlot
		storageBuffers: storageBuffers
		numBindings: numBindings
]

{ #category : '*SDL3-Own' }
SDL3GPUComputePass >> computeStorageTextures: storageTextures slot: firstSlot [

	^ self
		 computeStorageTexturesSlot: firstSlot
		 bindings: (storageTextures ifEmpty: [ ExternalAddress null ])
		 count: storageTextures size
]

{ #category : '*SDL3-Own' }
SDL3GPUComputePass >> computeStorageTexturesSlot: firstSlot bindings: storageTextures count: numBindings [

	self ffiLibrary
		bindGPUComputeStorageTexturesComputePass: self
		firstSlot: firstSlot
		storageTextures: storageTextures
		numBindings: numBindings
]

{ #category : '*SDL3-Own' }
SDL3GPUComputePass >> dispatchIndirectBuffer: buffer offset: offset [

	self ffiLibrary
		dispatchGPUComputeIndirectComputePass: self
		buffer: buffer
		offset: offset
]

{ #category : '*SDL3-Own' }
SDL3GPUComputePass >> dispatchX: x [

	self dispatchX: x y: 1 z: 1
]

{ #category : '*SDL3-Own' }
SDL3GPUComputePass >> dispatchX: x y: y z: z [

	| m |
	m := self pipeline metadata.
	self ffiLibrary
		dispatchGPUComputeComputePass: self
		groupcountX: (x + m threadCountX - 1 // m threadCountX)
		groupcountY: (y + m threadCountY - 1 // m threadCountY)
		groupcountZ: (z + m threadCountZ - 1 // m threadCountZ)
]

{ #category : '*SDL3-Own' }
SDL3GPUComputePass >> end [

	self ffiLibrary endGPUComputePass: self
]

{ #category : '*SDL3-Own' }
SDL3GPUComputePass >> releaseFromGPUDevice [
	"Passes are released when they are ended."

	self end
]
