"
A window driver used for running things using SDL3 library.

I am responsible for:
- managing the event loop process along sessions
- initializing the SDL3 library
- creating SDL3-based OSWindows
"
Class {
	#name : 'OSSDL3Driver',
	#superclass : 'OSWindowDriver',
	#traits : 'LibTSDL3',
	#classTraits : 'LibTSDL3 classTrait',
	#instVars : [
		'eventMap',
		'eventHandlerChain',
		'eventLoopSession',
		'sdl3Event'
	],
	#classVars : [
		'BackendWindowRegistry',
		'EventLoopProcess',
		'RegistryMutex'
	],
	#pools : [
		'SDL3AllEnumerations',
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

{ #category : 'events' }
OSSDL3Driver >> afterMainPharoWindowCreated: osWindow [

	OSPlatform current osSDL3Platform
		afterMainPharoWindowCreated: osWindow
]

{ #category : 'events' }
OSSDL3Driver >> afterSetWindowTitle: aString onWindow: osWindow [

	OSPlatform current osSDL3Platform
		afterSetWindowTitle: aString onWindow: osWindow
]

{ #category : 'window registry' }
OSSDL3Driver >> backendWindowWithId: aWindowID ifPresent: aBlock [
	"Evaluate aBlock with the backend window associated with the given ID"

	^ RegistryMutex critical: [
		BackendWindowRegistry at: aWindowID ifPresent: aBlock ]
]

{ #category : 'events' }
OSSDL3Driver >> beforeMainPharoWindowClosed: osWindow [

	OSPlatform current osSDL3Platform beforeMainPharoWindowClosed: osWindow
]

{ #category : 'clipboard' }
OSSDL3Driver >> clipboardText [
	"Answer the current text in the system clipboard."

	^ self ffiLibrary utf8StringFromExternalAddress: self ffiLibrary getClipboardText
]

{ #category : 'clipboard' }
OSSDL3Driver >> clipboardText: aString [
	"Set the system clipboard text to aString."

	self ffiLibrary setClipboardText: aString
]

{ #category : 'window creation' }
OSSDL3Driver >> createWindowWithAttributes: attributes osWindow: osWindow [
	"Create a new SDL3 window with the given attributes and associate it with osWindow."

	^ RegistryMutex critical: [
		| aBackendWindow |
		aBackendWindow := OSSDL3BackendWindow fromAttributes: attributes for: osWindow.
		self registerWindow: aBackendWindow.
		aBackendWindow ]
]

{ #category : 'events-processing' }
OSSDL3Driver >> deliverEvent: osEvent windowID: windowID [
	"Dispatch the mapped SDL3 event to the appropriate window or as a global event."

	RegistryMutex critical: [
		| backendWindow |
		backendWindow :=
			BackendWindowRegistry at: windowID ifAbsent: [ ^ nil ].
		osEvent window: backendWindow osWindow.
		osEvent deliver ]
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

{ #category : 'events-processing' }
OSSDL3Driver >> handlePendingSDL3Events [

	[  eventLoopSession == Smalltalk session and: [
		self ffiLibrary pollEvent: sdl3Event ] ] whileTrue: [
			[  | mappedEvent |
				mappedEvent := eventMap value: sdl3Event.
				eventHandlerChain handle: mappedEvent 
			] on: UnhandledException
			  do: [ :exception |
					"Keep running event handling despite a
					(hopefully isolated) error."
					exception freeze.
					[ exception debug ] fork ] ]
]

{ #category : 'initialization' }
OSSDL3Driver >> initialize [

	super initialize.

	self initializeEventHandlerChain.
	self initializeWindowMap.
	self initializeSDL3Library
]

{ #category : 'initialization' }
OSSDL3Driver >> initializeEventHandlerChain [

	eventHandlerChain :=
		OSSDL3InterruptHandler new
			nextHandler:
				(OSSDL3FocusHandler new
					driver: self;
					nextHandler: 
						(OSSDL3PasteHandler new
							nextHandler: 
								(OSSDL3DeliverOSEventHandler new
									driver: self;
									yourself);
							yourself);
					yourself)
			yourself
]

{ #category : 'initialization' }
OSSDL3Driver >> initializeSDL3Library [

	"Log to stderr, if debug is enabled"
	OSSDL3SystemSettings debugEnabled ifTrue: [
		self ffiLibrary setLogPriorities: SDL_LOG_PRIORITY_TRACE ].

	self ffiLibrary
		setHintName: SDL_HINT_VIDEO_ALLOW_SCREENSAVER value: '1';
		setHintName: SDL_HINT_NO_SIGNAL_HANDLERS value: '1';
		setHintName: SDL_HINT_MOUSE_FOCUS_CLICKTHROUGH value: '1'.

	"We add 'hide_numpad' to SDL_HINT_KEYCODE_OPTIONS´s default value.
	This way, the numpad keysyms will be translated into their non-numpad versions based on the current NumLock state.
	For example, SDLK_KP_4 would become SDLK_4 if SDL_KMOD_NUM is set in the event modifiers, and SDLK_LEFT if it is unset."
	self ffiLibrary
		setHintName: SDL_HINT_KEYCODE_OPTIONS
		value: 'french_numbers,latin_letters,hide_numpad'.

	OSPlatform current osSDL3Platform initPlatformSpecific.

	self ffiLibrary assertSuccess: (self ffiLibrary init: SDL_INIT_VIDEO)
]

{ #category : 'initialization' }
OSSDL3Driver >> initializeWindowMap [
	"Initialize the map used to track active windows."

	BackendWindowRegistry ifNil: [
		BackendWindowRegistry := WeakValueDictionary new ].

	RegistryMutex := Semaphore forMutualExclusion
]

{ #category : 'accessing' }
OSSDL3Driver >> newFormRenderer: form backendWindow: aBackendWindow [

	^ OSSDL3FormRenderer new
		form: form;
		backendWindow: aBackendWindow;
		yourself
]

{ #category : 'window registry' }
OSSDL3Driver >> registerWindow: aBackendWindow [
	"Register aBackendWindow in the window map."

	BackendWindowRegistry at: aBackendWindow windowId put: aBackendWindow
]

{ #category : 'events-processing' }
OSSDL3Driver >> runEventLoop [
	"The main loop for polling and handling pending SDL3 events."
	
	eventLoopSession := Smalltalk session. "Store which session is valid for us"
	sdl3Event := SDL3Event new. "Reuse this object along this session"
	eventMap := SDL3EventMap new. "Maps SDL3Event (a C union) to SDL3MappedEvent"

	[  self handlePendingSDL3Events.
		self waitUntilNextEventLoopIteration ] doWhileTrue: [ eventLoopSession == Smalltalk session ]
]

{ #category : 'window registry' }
OSSDL3Driver >> selectWindow: selectBlock thenDo: doBlock [

	RegistryMutex critical: [
		BackendWindowRegistry valuesDo: [ :each |
			(selectBlock value: each) ifTrue: [ doBlock value: each ] ] ]
]

{ #category : 'system startup' }
OSSDL3Driver >> shutDown: quitting [
	"Reset WindowMap and others, otherwise there will be handlers remaining on restart"

	quitting ifTrue: [
		BackendWindowRegistry := nil ].

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
		self error: self className, ': Cannot launch another event loop' ].

	EventLoopProcess :=
		[ self runEventLoop ]
			forkAt: Processor lowIOPriority
			named: self className, ' event loop'
]

{ #category : 'window registry' }
OSSDL3Driver >> unregisterWindowWithId: aWindowID [
	"Remove the window with the given ID from the window map."

	RegistryMutex critical: [
		BackendWindowRegistry removeKey: aWindowID ifAbsent: [ ] ]
]

{ #category : 'events-processing' }
OSSDL3Driver >> waitUntilNextEventLoopIteration [

	(Delay forMilliseconds: OSSDL3SystemSettings eventLoopPeriodMS) wait
]
