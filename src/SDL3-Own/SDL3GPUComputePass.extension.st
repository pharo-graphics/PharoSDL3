Extension { #name : 'SDL3GPUComputePass' }

{ #category : '*SDL3-Own' }
SDL3GPUComputePass >> bindGPUComputeSamplersFirstSlot: firstSlot textureSamplerBindings: textureSamplerBindings [

	^ self
		  bindGPUComputeSamplersFirstSlot: firstSlot
		  textureSamplerBindings: (textureSamplerBindings ifEmpty: [ ExternalAddress null ])
		  numBindings: textureSamplerBindings size
]

{ #category : '*SDL3-Own' }
SDL3GPUComputePass >> bindGPUComputeStorageBuffersFirstSlot: firstSlot storageBuffers: storageBuffers [

	^ self
		  bindGPUComputeStorageBuffersFirstSlot: firstSlot
		  storageBuffers: (storageBuffers ifEmpty: [ ExternalAddress null ])
		  numBindings: storageBuffers size
]

{ #category : '*SDL3-Own' }
SDL3GPUComputePass >> bindGPUComputeStorageTexturesFirstSlot: firstSlot storageTextures: storageTextures [

	^ self
		  bindGPUComputeStorageTexturesFirstSlot: firstSlot
		  storageTextures: (storageTextures ifEmpty: [ ExternalAddress null ])
		  numBindings: storageTextures size
]
