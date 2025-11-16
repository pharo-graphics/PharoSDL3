Extension { #name : 'SDL3Texture' }

{ #category : '*SDL3-Own' }
SDL3Texture >> destroy [

	self ffiLibrary destroyTexture: self
]
