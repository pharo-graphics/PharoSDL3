Extension { #name : 'SDL3GPUDepthStencilTargetInfo' }

{ #category : '*SDL3-Own' }
SDL3GPUDepthStencilTargetInfo >> beClear [

	self beClear: ExternalAddress null
]

{ #category : '*SDL3-Own' }
SDL3GPUDepthStencilTargetInfo >> beClear: aTexture [

	self
		texture: aTexture;
		mipLevel: 0;
		layer: 0;
		loadOp: SDL3GPULoadOp clear;
		storeOp: SDL3GPUStoreOp dontCare;
		cycle: false.
	self clearDepth: 1.0
]

{ #category : '*SDL3-Own' }
SDL3GPUDepthStencilTargetInfo class >> clear [

	^ self clear: ExternalAddress null
]

{ #category : '*SDL3-Own' }
SDL3GPUDepthStencilTargetInfo class >> clear: aTexture [

	^ self safeNew
		beClear: aTexture;
		yourself
]
