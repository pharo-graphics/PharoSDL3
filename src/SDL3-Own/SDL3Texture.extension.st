Extension { #name : 'SDL3Texture' }

{ #category : '*SDL3-Own' }
SDL3Texture >> extent [
	"Answer my (float) extent"

	| widthPointer heightPointer |
	widthPointer := FFIFloat32 newBuffer.
	heightPointer := FFIFloat32 newBuffer.

	self getSizeIntoW: widthPointer h: heightPointer.

	^ (widthPointer float32AtOffset: 0) @ (heightPointer float32AtOffset: 0)
]
