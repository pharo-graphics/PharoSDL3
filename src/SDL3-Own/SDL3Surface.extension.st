Extension { #name : 'SDL3Surface' }

{ #category : '*SDL3-Own' }
SDL3Surface >> asForm [
	"Answer a Form with my pixels."

	self format = SDL_PixelFormat argb8888
		ifTrue: [ ^ self asFormARGB32 ]
		ifFalse: [
			| copy |
			copy := self copyWithFormat: SDL_PixelFormat argb8888.
			[ ^ copy asForm ] ensure: [ copy destroy ] ]
]

{ #category : '*SDL3-Own' }
SDL3Surface >> asFormARGB32 [
	"Answer a Form with my pixels. Assumes my format is SDL_PIXELFORMAT_ARGB8888."

	| result theData |
	self lock.
	theData := FFIExternalArray
		fromHandle: self pixels getHandle
		type: FFIUInt32
		size: (self h * self pitch) >> 2.

	result := Form
		extent: self w @ self h
		depth: 32
		bits: (Bitmap newFrom: theData).

	self unlock.

	^ result
]

{ #category : '*SDL3-Own' }
SDL3Surface >> extent [
	
	^ self w @ self h
]
