"
A window driver used for running things using SDL3 library.

I am responsible for initializing the SDL3 library, managing the event loop,
and creating SDL3-based OSWindows.
"
Class {
	#name : 'OSSDL3Driver',
	#superclass : 'OSWindowDriver',
	#instVars : [
		'eventProcessor',
		'sdl'
	],
	#classVars : [
		'BackendWindowRegistry',
		'EventLoopProcess',
		'RegistryMutex'
	],
	#pools : [
		'SDL3ZConstants'
	],
	#category : 'SDL3-OSWindow-Core',
	#package : 'SDL3-OSWindow',
	#tag : 'Core'
}

{ #category : 'accessing' }
OSSDL3Driver class >> allWindows [
	"Answer all the registered windows."

	^ RegistryMutex critical: [ BackendWindowRegistry values ]
]

{ #category : 'accessing' }
OSSDL3Driver class >> eventLoopProcess [
	"Answer the process running the SDL3 event loop."

	^ EventLoopProcess
]

{ #category : 'testing' }
OSSDL3Driver class >> isSuitable [
	"Answer true if the SDL3 library is available on the current platform."

	^ LibSDL3 uniqueInstance isAvailable
]

{ #category : 'clipboard' }
OSSDL3Driver >> clipboardText [
	"Answer the current text in the system clipboard."

	^ sdl utf8StringFromExternalAddress: sdl getClipboardText
]

{ #category : 'clipboard' }
OSSDL3Driver >> clipboardText: aString [
	"Set the system clipboard text to aString."

	sdl setClipboardText: aString
]

{ #category : 'window creation' }
OSSDL3Driver >> createWindowWithAttributes: attributes osWindow: osWindow [
	"Create a new SDL3 window with the given attributes and associate it with osWindow."

	| flags sdl3Window aBackendWindow |
	flags := self windowFlagsFromAttributes: attributes.

	RegistryMutex critical: [
		sdl3Window := sdl
			newWindowTitle: attributes title
			w: attributes width
			h: attributes height
			flags: flags.

		aBackendWindow := OSSDL3BackendWindow newWithHandle: sdl3Window attributes: attributes.
		aBackendWindow osWindow: osWindow.
		self registerWindow: aBackendWindow.
		osWindow setJustCreatedHandle: aBackendWindow.
		
		attributes visible ifTrue: [ sdl3Window show ]
	].

	^ aBackendWindow
]

{ #category : 'events-processing' }
OSSDL3Driver >> deliverEvent: osEvent windowID: windowID [
	"Dispatch the mapped SDL3 event to the appropriate window or as a global event."

	RegistryMutex critical: [
		| backendWindow |
		backendWindow :=
			BackendWindowRegistry at: windowID ifAbsent: [ ^ nil ].
		osEvent window: backendWindow osWindow ].

	osEvent deliver
]

{ #category : 'events-processing' }
OSSDL3Driver >> deliverGlobalEvent: osEvent [
	"Global events are delivered to each window"

	RegistryMutex critical: [
		BackendWindowRegistry valuesDo: [ :window |
			window osWindow deliverGlobalEvent: osEvent ] ]
]

{ #category : 'system startup' }
OSSDL3Driver >> ensureEventLoop [
	"Ensure that the SDL3 event loop process is running."

	EventLoopProcess ifNotNil: [ ^ self ].

	self startUpEventLoop
]

{ #category : 'initialization' }
OSSDL3Driver >> initialize [

	super initialize.

	eventProcessor := OSSDL3EventProcessor new.

	self initializeWindowMap.
	self initializeLibrary
]

{ #category : 'initialization' }
OSSDL3Driver >> initializeLibrary [

	sdl := LibSDL3 uniqueInstance.

	sdl
		setHintName: SDL_HINT_VIDEO_ALLOW_SCREENSAVER value: '1';
		setHintName: SDL_HINT_NO_SIGNAL_HANDLERS value: '1';
		setHintName: SDL_HINT_MOUSE_FOCUS_CLICKTHROUGH value: '1'.

	sdl setHintName: SDL_HINT_KEYCODE_OPTIONS value: 'french_numbers,latin_letters,hide_numpad'.
	"We add 'hide_numpad' to default values. This is it's meaning: The numpad keysyms will be translated into their non-numpad versions based on the current NumLock state. For example, SDLK_KP_4 would become SDLK_4 if SDL_KMOD_NUM is set in the event modifiers, and SDLK_LEFT if it is unset."

	sdl assertSuccess: (sdl init: SDL_INIT_VIDEO | SDL_INIT_AUDIO)
]

{ #category : 'initialization' }
OSSDL3Driver >> initializeWindowMap [
	"Initialize the map used to track active windows."

	BackendWindowRegistry ifNil: [
		BackendWindowRegistry := WeakValueDictionary new ].

	RegistryMutex := Semaphore forMutualExclusion
]

{ #category : 'events-processing' }
OSSDL3Driver >> processSDL3Event: sdl3Event [
	
	[ eventProcessor deliver: sdl3Event on: self ]
		on: UnhandledException
		do: [ :ex |
			"It is critical that event handling keep running despite errors.
			Any error in event handling require immediate attention and fixing"
			ex freeze. [ ex debug ] fork ]
]

{ #category : 'window registry' }
OSSDL3Driver >> registerWindow: aBackendWindow [
	"Register aBackendWindow in the window map."

	BackendWindowRegistry at: aBackendWindow windowId put: aBackendWindow
]

{ #category : 'events-processing' }
OSSDL3Driver >> runEventLoop [
	"The main loop for polling and processing SDL3 events. This method runs in a separate process."

	| sdl3Event session |
	sdl3Event := SDL3Event new.
	session := Smalltalk session.

	[ session == Smalltalk session ] whileTrue: [
		[ LibSDL3 uniqueInstance pollEvent: sdl3Event ] whileTrue: [
			eventProcessor deliver: sdl3Event on: self ].

		(Delay forMilliseconds: 5) wait ]
]

{ #category : 'system startup' }
OSSDL3Driver >> shutDown: quitting [
	"Reset WindowMap and others, otherwise there will be handlers remaining on restart"

	quitting ifTrue: [ BackendWindowRegistry := nil ].

	self shutDownEventLoop
]

{ #category : 'system startup' }
OSSDL3Driver >> shutDownEventLoop [
	"Kills the current event loop, if any"

	EventLoopProcess ifNil: [ ^ self ].
	EventLoopProcess terminate.
	EventLoopProcess := nil
]

{ #category : 'system startup' }
OSSDL3Driver >> startUp: resuming [

	resuming 
		ifTrue: [
			self shutDownEventLoop.
			self startUpEventLoop ]
		ifFalse: [
			self ensureEventLoop ]
]

{ #category : 'system startup' }
OSSDL3Driver >> startUpEventLoop [
	"Create a new event loop.
	Precondition: there is no pre-existing event loop"

	EventLoopProcess ifNotNil: [
		self error: 'Cannot launch another SDL3 event loop' ].

	EventLoopProcess :=
		[ self runEventLoop ]
			forkAt: Processor lowIOPriority
			named: 'SDL3 event loop'
]

{ #category : 'window registry' }
OSSDL3Driver >> unregisterWindowWithId: aWindowID [
	"Remove the window with the given ID from the window map."

	RegistryMutex critical: [
		BackendWindowRegistry removeKey: aWindowID ifAbsent: [ ] ]
]

{ #category : 'window registry' }
OSSDL3Driver >> windowAtId: id ifAbsent: aBlock [

	^ BackendWindowRegistry at: id ifAbsent: aBlock
]

{ #category : 'window registry' }
OSSDL3Driver >> windowAtId: id ifPresent: presentBlock ifAbsent: absentBlock [

	^ BackendWindowRegistry at: id ifPresent: presentBlock ifAbsent: absentBlock
]

{ #category : 'private' }
OSSDL3Driver >> windowFlagsFromAttributes: attributes [

	| flags |
	flags := "SDL3WindowFlags highPixelDensity" 0.

	attributes fullscreen ifTrue: [ flags := flags bitOr: SDL3WindowFlags fullscreen ].
	attributes borderless ifTrue: [ flags := flags bitOr: SDL3WindowFlags borderless ].
	attributes resizable ifTrue: [ flags := flags bitOr: SDL3WindowFlags resizable ].
	attributes maximized ifTrue: [ flags := flags bitOr: SDL3WindowFlags maximized ].
	attributes minimized ifTrue: [ flags := flags bitOr: SDL3WindowFlags minimized ].
	^ flags
]
