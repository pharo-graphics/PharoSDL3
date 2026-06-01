Extension { #name : 'SDL3GPURenderPass' }

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> bindGPUFragmentSamplersFirstSlot: firstSlot textureSamplerBindings: textureSamplerBindings [

	^ self
		  bindGPUFragmentSamplersFirstSlot: firstSlot
		  textureSamplerBindings: (textureSamplerBindings ifEmpty: [ ExternalAddress null ])
		  numBindings: textureSamplerBindings size
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> bindGPUFragmentStorageBuffersFirstSlot: firstSlot storageBuffers: storageBuffers [

	^ self
		  bindGPUFragmentStorageBuffersFirstSlot: firstSlot
		  storageBuffers: (storageBuffers ifEmpty: [ ExternalAddress null ])
		  numBindings: storageBuffers size
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> bindGPUFragmentStorageTexturesFirstSlot: firstSlot storageTextures: storageTextures [

	^ self
		  bindGPUFragmentStorageTexturesFirstSlot: firstSlot
		  storageTextures: (storageTextures ifEmpty: [ ExternalAddress null ])
		  numBindings: storageTextures size
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> bindGPUVertexBuffersFirstSlot: firstSlot bindings: bindings [

	^ self
		  bindGPUVertexBuffersFirstSlot: firstSlot
		  bindings: (bindings ifEmpty: [ ExternalAddress null ])
		  numBindings: bindings size
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> bindGPUVertexSamplersFirstSlot: firstSlot textureSamplerBindings: textureSamplerBindings [

	^ self
		  bindGPUVertexSamplersFirstSlot: firstSlot
		  textureSamplerBindings: (textureSamplerBindings ifEmpty: [ ExternalAddress null ])
		  numBindings: textureSamplerBindings size
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> bindGPUVertexStorageBuffersFirstSlot: firstSlot storageBuffers: storageBuffers [

	^ self
		  bindGPUVertexStorageBuffersFirstSlot: firstSlot
		  storageBuffers: (storageBuffers ifEmpty: [ ExternalAddress null ])
		  numBindings: storageBuffers size
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> bindGPUVertexStorageTexturesFirstSlot: firstSlot storageTextures: storageTextures [

	^ self
		  bindGPUVertexStorageTexturesFirstSlot: firstSlot
		  storageTextures: (storageTextures ifEmpty: [ ExternalAddress null ])
		  numBindings: storageTextures size
]
