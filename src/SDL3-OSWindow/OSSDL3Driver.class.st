"
A window driver used for running things using SDL3 library.

I am responsible for initializing the SDL3 library, managing the event loop,
and creating SDL3-based OSWindows.
"
Class {
	#name : 'OSSDL3Driver',
	#superclass : 'OSWindowDriver',
	#traits : 'LibTSDL3',
	#classTraits : 'LibTSDL3 classTrait',
	#instVars : [
		'gpuDevice',
		'eventMap',
		'eventHandlerChain'
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

{ #category : 'gpu' }
OSSDL3Driver >> destroyGPUDevice [
	"Release the shared GPU device if it exists."

	gpuDevice ifNotNil: [
		gpuDevice destroy.
		gpuDevice := nil ]
]

{ #category : 'system startup' }
OSSDL3Driver >> ensureEventLoop [
	"Ensure that the SDL3 event loop process is running."

	EventLoopProcess ifNotNil: [ ^ self ].

	self startUpEventLoop
]

{ #category : 'gpu' }
OSSDL3Driver >> gpuDevice [
	"Ensure the shared GPU device is initialized and answer it."

	^ gpuDevice ifNil: [
		self initializeGPUDevice.
		gpuDevice ]
]

{ #category : 'initialization' }
OSSDL3Driver >> initialize [

	super initialize.

	"Maps SDL3Event (a C union) to SDL3MappedEvent"
	eventMap := SDL3EventMap new.

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
			yourself.

	self initializeWindowMap.
	self initializeLibrary
]

{ #category : 'gpu' }
OSSDL3Driver >> initializeGPUDevice [
	"Initialize the shared GPU device."

	gpuDevice :=
		self ffiLibrary
			newGPUDeviceFormatFlags:
				SDL_GPU_SHADERFORMAT_DXIL | SDL_GPU_SHADERFORMAT_MSL | SDL_GPU_SHADERFORMAT_SPIRV
			debugMode: true
			name: nil.
	gpuDevice assertNotNullReturn
]

{ #category : 'initialization' }
OSSDL3Driver >> initializeLibrary [

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

	self ffiLibrary assertSuccess: (self ffiLibrary init: SDL_INIT_VIDEO | SDL_INIT_AUDIO)
]

{ #category : 'initialization' }
OSSDL3Driver >> initializeWindowMap [
	"Initialize the map used to track active windows."

	BackendWindowRegistry ifNil: [
		BackendWindowRegistry := WeakValueDictionary new ].

	RegistryMutex := Semaphore forMutualExclusion
]

{ #category : 'events-processing' }
OSSDL3Driver >> processSDL3Event: aSDL3Event [
	
	[	| mappedEvent |
		mappedEvent := eventMap value: aSDL3Event.
		eventHandlerChain handle: mappedEvent ]
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
		[ self ffiLibrary pollEvent: sdl3Event ] whileTrue: [
			self processSDL3Event: sdl3Event ].
		
		5 timesRepeat: [
			"Flush all renderers to ensure screen updates"
			self class allWindows do: [ :win | 
				win renderer ifNotNil: [ :renderer | renderer flush ] ].

			(Delay forMilliseconds: 1) wait ]]
]

{ #category : 'system startup' }
OSSDL3Driver >> shutDown: quitting [
	"Reset WindowMap and others, otherwise there will be handlers remaining on restart"

	quitting ifTrue: [
		BackendWindowRegistry := nil.
		self destroyGPUDevice ].

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
