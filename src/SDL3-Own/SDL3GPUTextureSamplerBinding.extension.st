Extension { #name : 'SDL3GPUTextureSamplerBinding' }

{ #category : '*SDL3-Own' }
SDL3GPUTextureSamplerBinding >> beTexture: aTexture sampler: aSampler [

	self
		texture: aTexture;
		sampler: aSampler
]
