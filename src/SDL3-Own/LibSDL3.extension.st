Extension { #name : 'LibSDL3' }

{ #category : '*SDL3-Own' }
LibSDL3 >> allAudioDrivers [
	"Answer the name of every built-in audio driver."

	^ (1 to: self getNumAudioDrivers) collect: [ :index | self getAudioDriver: index - 1 ]
]

{ #category : '*SDL3-Own' }
LibSDL3 >> allAudioPlaybackDeviceIDs [
	"Answer an array of currently-connected audio playback device IDs."

	| countValueHolder address array |
	countValueHolder := FFIInt32 newValueHolder.
	address := self getAudioPlaybackDevices: countValueHolder.
	array := address
		readArrayOf: SDL_AudioDeviceID
		size: countValueHolder value.
	self free: address.
	^ array
]

{ #category : '*SDL3-Own' }
LibSDL3 >> allAudioPlaybackDeviceNames [

	^ self allAudioPlaybackDeviceIDs collect: [ :eachID | self getAudioDeviceName: eachID ]
]

{ #category : '*SDL3-Own' }
LibSDL3 >> allAudioRecordingDeviceIDs [
	"Answer an array of currently-connected audio recording device IDs."

	| countValueHolder address array |
	countValueHolder := FFIInt32 newValueHolder.
	address := self getAudioRecordingDevices: countValueHolder.
	array := address
		readArrayOf: SDL_AudioDeviceID
		size: countValueHolder value.
	self free: address.
	^ array
]

{ #category : '*SDL3-Own' }
LibSDL3 >> allAudioRecordingDeviceNames [

	^ self allAudioRecordingDeviceIDs collect: [ :eachID | self getAudioDeviceName: eachID ]
]

{ #category : '*SDL3-Own' }
LibSDL3 >> allCameraIDs [
	"Answer the id array of all connected cameras"

	| countValueHolder address array |
	countValueHolder := FFIInt32 newValueHolder.
	address := (self getCameras: countValueHolder) getHandle.
	array := address
		readArrayOf: SDL_CameraID
		size: countValueHolder value.
	self free: address.
	^ array
]

{ #category : '*SDL3-Own' }
LibSDL3 >> allFingersOf: touchID [

	| countValueHolder address array |
	countValueHolder := FFIInt32 newValueHolder.
	address := self getTouchFingersTouchID: touchID count: countValueHolder.
	array := address
		readArrayOf: SDL_Finger
		size: countValueHolder value.
	self free: address.
	^ array
]

{ #category : '*SDL3-Own' }
LibSDL3 >> allKeyboardIDs [
	"Answer the id array of all connected keyboards"

	| countValueHolder address array |
	countValueHolder := FFIInt32 newValueHolder.
	address := (self getKeyboards: countValueHolder) getHandle.
	array := address
		readArrayOf: SDL_KeyboardID
		size: countValueHolder value.
	self free: address.
	^ array
]

{ #category : '*SDL3-Own' }
LibSDL3 >> allMouseIDs [
	"Answer an array of connected mouses"

	| countValueHolder address array |
	countValueHolder := FFIInt32 newValueHolder.
	address := (self getMice: countValueHolder) getHandle.
	array := address
		readArrayOf: SDL_MouseID
		size: countValueHolder value.
	self free: address.
	^ array
]

{ #category : '*SDL3-Own' }
LibSDL3 >> allTouchIDs [

	| countValueHolder address array |
	countValueHolder := FFIInt32 newValueHolder.
	address := self getTouchDevices: countValueHolder.
	array := address
		readArrayOf: SDL_TouchID
		size: countValueHolder value.
	self free: address.
	^ array
]

{ #category : '*SDL3-Own' }
LibSDL3 >> allWindows [
	"Answer an array of valid windows"

	| countValueHolder address array |
	countValueHolder := FFIInt32 newValueHolder.
	address := (self getWindows: countValueHolder) getHandle.
	array := address
		readArrayOf: SDL_Window
		size: countValueHolder value.
	self free: address.
	^ array
]

{ #category : '*SDL3-Own' }
LibSDL3 >> assertSuccess: aReturnedValue [
	"FFI calls in SDL3 return either true or not NULL to indicate success. In the case of an error, a descriptive string can be retrieved from SDL_GetError()."
	<debuggerCompleteToSender>

	aReturnedValue = true ifTrue: [ ^ aReturnedValue ].
	(aReturnedValue = false or: [ aReturnedValue isNull ])
		ifFalse: [ ^ aReturnedValue ].

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
LibSDL3 >> clipboardMimeTypes [

	| countValueHolder address array |
	countValueHolder := FFIInt32 newValueHolder.
	address := self getClipboardMimeTypes: countValueHolder.
	array := address arrayOfStringsOfSize: countValueHolder value. 
	self free: address.
	^ array
]

{ #category : '*SDL3-Own' }
LibSDL3 >> currentDirectory [
	"Answer a path String with the current working directory"

	^ self utf8StringFromExternalAddress: self getCurrentDirectory
]

{ #category : '*SDL3-Own' }
LibSDL3 >> currentTime [
	"Answer current value of the system realtime clock in nanoseconds since Jan 1, 1970 in Universal Coordinated Time (UTC)."

	| valueHolder |
	valueHolder := FFIInt64 newValueHolder.
	self assertSuccess: (self getCurrentTime: valueHolder).
	^ valueHolder value
]

{ #category : '*SDL3-Own' }
LibSDL3 >> displayIDs [
	"Answer an array of currently connected display ids."

	| countValueHolder first count array |
	countValueHolder := FFIInt32 newValueHolder.
	first := self getDisplays: countValueHolder.
	count := countValueHolder value.
	array := first readArrayOf: SDL_DisplayID size: count.
	self free: first.
	^ array
]

{ #category : '*SDL3-Own' }
LibSDL3 >> fullscreenDisplayModesOf: aDisplayID [
	"Answer an array of fullscreen display modes available on a display."

	| countValueHolder first count array |
	countValueHolder := FFIInt32 newValueHolder.

	first := self
		getFullscreenDisplayModesDisplayID: aDisplayID
		count: countValueHolder.
	count := countValueHolder value.

	array := first
		readStructArrayFromPointers: SDL3DisplayMode
		size: count.

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
LibSDL3 >> mousePosition [

	| xHolder yHolder |
	xHolder := FFIFloat32 newValueHolder.
	yHolder := FFIFloat32 newValueHolder.

	self getMouseStateX: xHolder y: yHolder.
	^ xHolder value @ yHolder value
]

{ #category : '*SDL3-Own' }
LibSDL3 >> newPropertyGroup [
	"Anwer a new group of properties. Sender is responsible of releasing it with #destroy. 
	However, all properties are automatically destroyed on `SDL_Quit()`."

	| id |
	id := self newProperties.
	self assertSuccess: id > 0.

	^ SDL3PropertyGroup id: id
]

{ #category : '*SDL3-Own' }
LibSDL3 >> numberOfDisplays [

	| valueHolder |
	valueHolder := FFIInt32 newValueHolder.
	self free: (self getDisplays: valueHolder).
	^ valueHolder value
]

{ #category : '*SDL3-Own' }
LibSDL3 >> pathInfoAt: pathString [

	| pathInfoHolder |
	pathInfoHolder := (FFIExternalValueHolder ofType: SDL3PathInfo) new.
	self assertSuccess: (self getPathInfoPath: pathString info: pathInfoHolder).
	^ pathInfoHolder value
]

{ #category : '*SDL3-Own' }
LibSDL3 >> primarySelectionText [
	"The X11 and Wayland video targets have a concept of the ""primary selection"" in addition to the usual clipboard. This is generally highlighted (but not explicitly copied) text from various apps. SDL offers APIs for this through SDL_GetPrimarySelectionText() and SDL_SetPrimarySelectionText(). SDL offers these APIs on platforms without this concept, too, but only so far that it will keep a copy of a string that the app sets for later retrieval; the operating system will not ever attempt to change the string externally if it doesn't support a primary selection."

	^ self utf8StringFromExternalAddress: self getPrimarySelectionText
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
LibSDL3 >> timeToDateAndTime: ticks [
	"Given an integer that represents a `SDL_Time`, answer its conversion to `DateAndTime`."

	^ (self timeToDateTime: ticks localTime: false) asDateAndTime
]

{ #category : '*SDL3-Own' }
LibSDL3 >> timeToDateTime: ticks localTime: isLocal [
	"Given an integer that represents a `SDL_Time`, answer its conversion to `SDL_DateTime`."

	| dateAndTimeHolder |
	dateAndTimeHolder := (FFIExternalValueHolder ofType: SDL3DateTime) new.

	self assertSuccess:
		(self
			 timeToDateTimeTicks: ticks
			 dt: dateAndTimeHolder
			 localTime: isLocal).

	^ dateAndTimeHolder value
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
LibSDL3 >> utf8StringFromExternalAddress: anExternalAddress [
	"Answer a String from the received address (NULL-terminated) and free the memory.
	Utility method that to ease calling some SDL functions whose comment indicates 
	that caller is responsible of freeing the memory via SDL_free()."

	| string |
	string := anExternalAddress utf8StringFromCString.
	self free: anExternalAddress.
	^ string
]

{ #category : '*SDL3-Own' }
LibSDL3 >> videoDrivers [

	| result |
	result := OrderedCollection new.
	0 to: self getNumVideoDrivers - 1 do: [ :zeroBasedIndex |
		result add: (self getVideoDriver: zeroBasedIndex) ].
	^ result
]
