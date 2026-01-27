Extension { #name : 'LibSDL3' }

{ #category : '*SDL3-Own' }
LibSDL3 >> assertSuccess [
	"Signal an error if SDL_GetError() returns a non-empty string. In such case, the error message will describe the most recent error."
	<debuggerCompleteToSender>

	self getError ifNotEmpty: [ :aString | SDL3Error new signal: aString ]
]

{ #category : '*SDL3-Own' }
LibSDL3 >> assertSuccess: aReturnedValue [
	"FFI calls in SDL3 return either true or not NULL to indicate success. In the case of an error, a descriptive string can be retrieved from SDL_GetError()."
	<debuggerCompleteToSender>

	(aReturnedValue = true or: [ aReturnedValue isNull not ]) ifTrue: [ ^ self ].

	"Try to retrieve a descriptive error message"
	^ SDL3Error new signal: self getError
]

{ #category : '*SDL3-Own' }
LibSDL3 >> boundsOfDisplay: aDisplayID [
	"Answer the desktop rectangle of a display."

	| sdlRect |
	sdlRect := SDL3Rect new.
	self getDisplayBoundsDisplayID: aDisplayID rect: sdlRect.
	^ sdlRect asRectangle
]

{ #category : '*SDL3-Own' }
LibSDL3 >> currentTime [
	"Answer current value of the system realtime clock in nanoseconds since Jan 1, 1970 in Universal Coordinated Time (UTC)."

	| countBuffer |
	countBuffer := FFIInt64 newBuffer.
	self assertSuccess: (self getCurrentTime: countBuffer).
	^ countBuffer int64AtOffset: 0
]

{ #category : '*SDL3-Own' }
LibSDL3 >> displayIDs [
	"Answer an array of currently connected display ids."

	| countBuffer first count array |
	countBuffer := FFIInt32 newBuffer.
	first := self getDisplays: countBuffer.
	count := countBuffer int32AtOffset: 0.
	array := first readArrayOf: SDL_DisplayID size: count.
	self free: first.
	^ array
]

{ #category : '*SDL3-Own' }
LibSDL3 >> fullscreenDisplayModesOf: aDisplayID [
	"Answer an array of fullscreen display modes available on a display."

	| countBuffer first count array |
	countBuffer := FFIInt32 newBuffer.
	first := self getFullscreenDisplayModesDisplayID: aDisplayID count: countBuffer.
	count := countBuffer int32AtOffset: 0.
	array := first readStructArrayFromPointers: SDL3DisplayMode size: count.
	self free: first.
	^ array
]

{ #category : '*SDL3-Own' }
LibSDL3 >> gpuDrivers [

	| result |
	result := OrderedCollection new.
	0 to: self getNumGPUDrivers - 1 do: [ :zeroBasedIndex |
		result add: (self getGPUDriver: zeroBasedIndex) ].
	^ result
]

{ #category : '*SDL3-Own' }
LibSDL3 >> numberOfDisplays [

	| buffer |
	buffer := FFIInt32 newBuffer.
	self getDisplays: buffer.
	^ buffer int32AtOffset: 0
]

{ #category : '*SDL3-Own' }
LibSDL3 >> renderDrivers [

	| result |
	result := OrderedCollection new.
	0 to: self getNumRenderDrivers - 1 do: [ :zeroBasedIndex |
		result add: (self getRenderDriver: zeroBasedIndex) ].
	^ result
]

{ #category : '*SDL3-Own' }
LibSDL3 >> usableBoundsOfDisplay: aDisplayID [
	"Answer the desktop usable rectangle of a display."

	| sdlRect |
	sdlRect := SDL3Rect new.
	self getDisplayUsableBoundsDisplayID: aDisplayID rect: sdlRect.
	^ sdlRect asRectangle
]

{ #category : '*SDL3-Own' }
LibSDL3 >> videoDrivers [

	| result |
	result := OrderedCollection new.
	0 to: self getNumVideoDrivers - 1 do: [ :zeroBasedIndex |
		result add: (self getVideoDriver: zeroBasedIndex) ].
	^ result
]
