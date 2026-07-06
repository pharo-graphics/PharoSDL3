Extension { #name : 'SDL3GPUComputePass' }

{ #category : '*SDL3-Own' }
SDL3GPUComputePass >> computeSamplers: textureSamplerBindings slot: firstSlot [

	^ self
		 computeSamplersSlot: firstSlot
		 bindings: (textureSamplerBindings ifEmpty: [ ExternalAddress null ])
		 count: textureSamplerBindings size
]

{ #category : '*SDL3-Own' }
SDL3GPUComputePass >> computeStorageBuffers: storageBuffers slot: firstSlot [

	^ self
		 computeStorageBuffersSlot: firstSlot
		 bindings: (storageBuffers ifEmpty: [ ExternalAddress null ])
		 count: storageBuffers size
]

{ #category : '*SDL3-Own' }
SDL3GPUComputePass >> computeStorageTextures: storageTextures slot: firstSlot [

	^ self
		 computeStorageTexturesSlot: firstSlot
		 bindings: (storageTextures ifEmpty: [ ExternalAddress null ])
		 count: storageTextures size
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
