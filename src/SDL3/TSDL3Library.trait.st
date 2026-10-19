Trait {
	#name : 'TSDL3Library',
	#category : 'SDL3-Library',
	#package : 'SDL3',
	#tag : 'Library'
}

{ #category : 'library path' }
TSDL3Library classSide >> ffiLibraryName [

	^ SDL3Library
]

{ #category : 'error handling' }
TSDL3Library >> assertNotNullReturn [
	"FFI calls in SDL3 return not NULL on success. In the case of an error, a descriptive string can be retrieved from SDL_GetError()."
	<debuggerCompleteToSender>

	self isNull ifFalse: [ ^ self ].

	"Try to retrieve a descriptive error message"
	^ SDL3Error signalFromLibraryErrorMessage
]

{ #category : 'library path' }
TSDL3Library >> ffiLibraryName [

	^ SDL3Library
]
