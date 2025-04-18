Extension { #name : 'S3SDL_Texture' }

{ #category : '*SDL3-Own' }
S3SDL_Texture >> destroy [

	self ffiLibrary destroyTexture: self
]
