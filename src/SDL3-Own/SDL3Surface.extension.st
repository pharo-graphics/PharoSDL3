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
		size: self w * self h.

	result := Form
		extent: self w @ self h
		depth: 32
		bits: (Bitmap newFrom: theData).

	self unlock.

	^ result
]

{ #category : '*SDL3-Own' }
SDL3Surface >> clearColor: aColor [ 
	"Clear the surface with a color."

	self
		clearR: aColor red
		g: aColor green
		b: aColor blue
		a: aColor alpha
]

{ #category : '*SDL3-Own' }
SDL3Surface >> colorAtX: x y: y [

	ExternalAddress
		allocateMemoryOfSizes: #(4 4 4 4)
		during: [ :r :g :b :a |
			self ffiLibrary assertSuccess: (self readPixelFloatX: x y: y r: r g: g b: b a: a).
			^ Color
				r: (r float32AtOffset: 0)
				g: (g float32AtOffset: 0)
				b: (b float32AtOffset: 0)
				alpha: (a float32AtOffset: 0) ]
]

{ #category : '*SDL3-Own' }
SDL3Surface >> extent [
	
	^ self w @ self h
]
