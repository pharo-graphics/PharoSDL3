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
