Extension { #name : 'SDL3GPURenderPass' }

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
SDL3GPURenderPass >> fragmentStorageBuffers: storageBuffers slot: firstSlot [

	^ self
		 fragmentStorageBuffersSlot: firstSlot
		 bindings: (storageBuffers ifEmpty: [ ExternalAddress null ])
		 count: storageBuffers size
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> fragmentStorageTextures: storageTextures slot: firstSlot [

	^ self
		 fragmentStorageTexturesSlot: firstSlot
		 bindings: (storageTextures ifEmpty: [ ExternalAddress null ])
		 count: storageTextures size
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
SDL3GPURenderPass >> vertexBuffers: anArray slot: firstSlot [

	^ self
		 vertexBuffersSlot: firstSlot
		 bindings: (anArray ifEmpty: [ ExternalAddress null ])
		 count: anArray size
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> vertexSamplers: textureSamplerBindings slot: firstSlot [

	^ self
		 vertexSamplersSlot: firstSlot
		 bindings: (textureSamplerBindings ifEmpty: [ ExternalAddress null ])
		 count: textureSamplerBindings size
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> vertexStorageBuffers: storageBuffers slot: firstSlot [

	^ self
		 vertexStorageBuffersSlot: firstSlot
		 bindings: (storageBuffers ifEmpty: [ ExternalAddress null ])
		 count: storageBuffers size
]

{ #category : '*SDL3-Own' }
SDL3GPURenderPass >> vertexStorageTextures: storageTextures slot: firstSlot [

	^ self
		 vertexStorageTexturesSlot: firstSlot
		 bindings: (storageTextures ifEmpty: [ ExternalAddress null ])
		 count: storageTextures size
]
