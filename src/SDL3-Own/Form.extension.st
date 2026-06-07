Extension { #name : 'Form' }

{ #category : '*SDL3-Own' }
Form >> asUnownedNewSDL3Surface [
	"Answer a `SDL3Surface` that shares my pixels (there isn't a copy). The sender is responsible of destroying the surface."

	| aSDLSurface |
	self depth = 32 ifFalse: [ ^ (self asFormOfDepth: 32) asUnownedNewSDL3Surface ].

	self unhibernate.

	aSDLSurface := LibSDL3 uniqueInstance
		              newSurfaceFromWidth: self width
		              height: self height
		              format: SDL3PixelFormat argb8888
		              pixels: self bits
		              pitch: self bits byteSize // self height.

	aSDLSurface assertNotNullReturn.

	^ aSDLSurface
]
