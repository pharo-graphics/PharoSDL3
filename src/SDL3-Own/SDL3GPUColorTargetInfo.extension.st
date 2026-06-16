Extension { #name : 'SDL3GPUColorTargetInfo' }

{ #category : '*SDL3-Own' }
SDL3GPUColorTargetInfo >> beClear [

	self beClear: Color black
]

{ #category : '*SDL3-Own' }
SDL3GPUColorTargetInfo >> beClear: aColor [

	self beClearTexture: ExternalAddress null color: aColor
]

{ #category : '*SDL3-Own' }
SDL3GPUColorTargetInfo >> beClearTexture: aTexture [

	self beClearTexture: aTexture color: Color black
]

{ #category : '*SDL3-Own' }
SDL3GPUColorTargetInfo >> beClearTexture: aTexture color: aColor [

	self
		texture: aTexture;
		mipLevel: 0;
		layerOrDepthPlane: 0;
		loadOp: SDL3GPULoadOp clear;
		storeOp: SDL3GPUStoreOp store;
		cycle: false.
	self updateClearColorFrom: aColor
]

{ #category : '*SDL3-Own' }
SDL3GPUColorTargetInfo >> beLoad [

	self beLoad: ExternalAddress null
]

{ #category : '*SDL3-Own' }
SDL3GPUColorTargetInfo >> beLoad: aTexture [

	self
		texture: aTexture;
		mipLevel: 0;
		layerOrDepthPlane: 0;
		loadOp: SDL3GPULoadOp load;
		storeOp: SDL3GPUStoreOp store;
		cycle: false
]

{ #category : '*SDL3-Own' }
SDL3GPUColorTargetInfo class >> clear [

	^ self clear: Color black
]

{ #category : '*SDL3-Own' }
SDL3GPUColorTargetInfo class >> clear: aColor [

	^ self safeNew
		beClear: aColor;
		yourself
]

{ #category : '*SDL3-Own' }
SDL3GPUColorTargetInfo class >> load [

	^ self load: ExternalAddress null
]

{ #category : '*SDL3-Own' }
SDL3GPUColorTargetInfo class >> load: aTexture [

	^ self safeNew
		beLoad: aTexture;
		yourself
]

{ #category : '*SDL3-Own' }
SDL3GPUColorTargetInfo >> updateClearColorFrom: aColor [

	self clearColor updateFrom: aColor
]
