Extension { #name : 'SDL3Window' }

{ #category : '*SDL3-Own' }
SDL3Window >> display [

	^ SDL3Display id: self displayID
]

{ #category : '*SDL3-Own' }
SDL3Window >> extent [
	"Answer my logical extent"

	| widthValueHolder heightValueHolder |
	widthValueHolder := FFIInt32 newValueHolder.
	heightValueHolder := FFIInt32 newValueHolder.

	self ffiLibrary assertSuccess:
		(self getSizeIntoW: widthValueHolder h: heightValueHolder).

	^ widthValueHolder value @ heightValueHolder value
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

	| widthValueHolder heightValueHolder |
	widthValueHolder := FFIInt32 newValueHolder.
	heightValueHolder := FFIInt32 newValueHolder.

	self ffiLibrary assertSuccess:
		(self getPositionIntoX: widthValueHolder y: heightValueHolder).

	^ widthValueHolder value @ heightValueHolder value
]

{ #category : '*SDL3-Own' }
SDL3Window >> position: aPoint [

	self ffiLibrary assertSuccess: (self positionX: aPoint x y: aPoint y)
]
