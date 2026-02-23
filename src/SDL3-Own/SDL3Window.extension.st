Extension { #name : 'SDL3Window' }

{ #category : '*SDL3-Own' }
SDL3Window >> extent [
	"Answer my logical extent"

	| widthPointer heightPointer |
	widthPointer := FFIInt32 newBuffer.
	heightPointer := FFIInt32 newBuffer.

	self ffiLibrary assertSuccess:
		(self getSizeIntoW: widthPointer h: heightPointer).

	^ (widthPointer int32AtOffset: 0) @ (heightPointer int32AtOffset: 0)
]

{ #category : '*SDL3-Own' }
SDL3Window >> extent: aPoint [

	self ffiLibrary assertSuccess: (self sizeW: aPoint x h: aPoint y)
]

{ #category : '*SDL3-Own' }
SDL3Window >> newGPURenderer [

	^ self newRendererFor: 'gpu'
]

{ #category : '*SDL3-Own' }
SDL3Window >> position [

	| widthPointer heightPointer |
	widthPointer := FFIInt32 newBuffer.
	heightPointer := FFIInt32 newBuffer.

	self ffiLibrary assertSuccess:
		(self getPositionIntoX: widthPointer y: heightPointer).

	^ (widthPointer int32AtOffset: 0) @ (heightPointer int32AtOffset: 0)
]

{ #category : '*SDL3-Own' }
SDL3Window >> position: aPoint [

	self ffiLibrary assertSuccess: (self positionX: aPoint x y: aPoint y)
]
