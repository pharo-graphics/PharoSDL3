Extension { #name : 'SDL3GPUStorageTextureReadWriteBinding' }

{ #category : '*SDL3-Own' }
SDL3GPUStorageTextureReadWriteBinding >> beTexture: aTexture [

	self beTexture: aTexture cycle: false
]

{ #category : '*SDL3-Own' }
SDL3GPUStorageTextureReadWriteBinding >> beTexture: aTexture cycle: aBoolean [

	self
		texture: aTexture;
		mipLevel: 0;
		layer: 0;
		cycle: aBoolean
]

{ #category : '*SDL3-Own' }
SDL3GPUStorageTextureReadWriteBinding >> beUnbound [

	self beUnboundCycle: false
]

{ #category : '*SDL3-Own' }
SDL3GPUStorageTextureReadWriteBinding >> beUnboundCycle: aBoolean [

	self beTexture: ExternalAddress null cycle: aBoolean
]
