Extension { #name : 'SDL3GPUBlitRegion' }

{ #category : '*SDL3-Own' }
SDL3GPUBlitRegion >> beTexture: aTexture [

	self
		texture: aTexture;
		mipLevel: 0;
		layerOrDepthPlane: 0;
		x: 0;
		y: 0;
		w: 0;
		h: 0
]
