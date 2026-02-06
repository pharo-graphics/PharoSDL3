Extension { #name : 'LibTSDL3' }

{ #category : '*SDL3-Own' }
LibTSDL3 >> assertNotNullReturn [
	"FFI calls in SDL3 return not NULL on success. In the case of an error, a descriptive string can be retrieved from SDL_GetError()."
	<debuggerCompleteToSender>

	self isNull ifFalse: [ ^ self ].

	"Try to retrieve a descriptive error message"
	^ SDL3Error new signal: self ffiLibrary getError
]
