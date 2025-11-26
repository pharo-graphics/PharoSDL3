Extension { #name : 'SDL3Window' }

{ #category : '*SDL3-Own' }
SDL3Window >> extent [
	"Answer my logical extent"

	| widthPointer heightPointer |
	widthPointer := FFIInt32 newBuffer.
	heightPointer := FFIInt32 newBuffer.

	self getSizeIntoW: widthPointer h: heightPointer.

	^ (widthPointer int32AtOffset: 0) @ (heightPointer int32AtOffset: 0)
]
