Extension { #name : 'SDL3Surface' }

{ #category : '*SDL3-Own' }
SDL3Surface >> asForm [
	"Answer a Form with my pixels."

	^ self format = SDL_PixelFormat argb8888
		ifTrue: [ self asFormARGB32 ]
		ifFalse: [
			| copy |
			copy := self copyWithFormat: SDL_PixelFormat argb8888.
			[ copy asForm ] ensure: [ copy destroy ] ]
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
SDL3Surface >> colorAtX: x y: y [

	ExternalAddress
		allocateMemoryOfSizes: #(4 4 4 4)
		during: [ :r :g :b :a |
			self ffiLibrary assertSuccess: (self readPixelX: x y: y r: r g: g b: b a: a).

			^ Color
				r: (r floatAt: 1)
				g: (g floatAt: 1)
				b: (b floatAt: 1)
				alpha: (a floatAt: 1) ]
]

{ #category : '*SDL3-Own' }
SDL3Surface >> extent [
	
	^ self w @ self h
]
