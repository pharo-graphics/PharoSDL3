Extension { #name : 'SDL3GPUBlitInfo' }

{ #category : '*SDL3-Own' }
SDL3GPUBlitInfo >> beSource: sourceTexture destination: destinationTexture filter: aFilter [

	self
		loadOp: SDL3GPULoadOp dontCare;
		flipMode: SDL3FlipMode none;
		filter: aFilter;
		cycle: false.
	self source beTexture: sourceTexture.
	self destination beTexture: destinationTexture
]

{ #category : '*SDL3-Own' }
SDL3GPUBlitInfo class >> source: sourceTexture destination: destinationTexture filter: aFilter [

	^ self safeNew
		beSource: sourceTexture destination: destinationTexture filter: aFilter;
		yourself
]

{ #category : '*SDL3-Own' }
SDL3GPUBlitInfo >> updateClearColorFrom: aColor [

	self clearColor updateFrom: aColor
]
