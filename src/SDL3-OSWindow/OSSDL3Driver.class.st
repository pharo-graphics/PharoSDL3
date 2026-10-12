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
	#traits : 'TSDL3Library',
	#classTraits : 'TSDL3Library classTrait',
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
		'SDL3Constants'
	],
	#category : 'SDL3-OSWindow-Core',
	#package : 'SDL3-OSWindow',
	#tag : 'Core'
}

{ #category : 'testing' }
OSSDL3Driver class >> isSuitable [
	"Answer true if the SDL3 library is available on the current platform."

	^ SDL3Library uniqueInstance isAvailable
]

{ #category : 'system startup' }
OSSDL3Driver >> ensureEventLoop [
	"Ensure that the SDL3 event loop process is running."

	"A dead process can linger across image sessions or crashes without being nilled.
	Only a living, non-terminated process indicates an active event loop."
	(EventLoopProcess isNotNil and: [ EventLoopProcess isTerminated not ])
		ifTrue: [ ^ self ].

	self shutDownEventLoop.
	self startUpEventLoop
]

{ #category : 'accessing' }
OSSDL3Driver >> newFormRenderer: form backendWindow: aBackendWindow [

	^ OSSDL3FormRenderer new
		form: form;
		backendWindow: aBackendWindow;
		yourself
]

{ #category : 'events-processing' }
OSSDL3Driver >> runEventLoop [
	"The main loop for polling and handling pending SDL3 events."

	[
		eventLoopSession := Smalltalk session. "Store which session is valid for us"
		sdl3Event := SDL3Event new. "Reuse this object along this session"
		eventMap := SDL3EventMap new. "Maps SDL3Event (a C union) to SDL3MappedEvent"

		[ self handlePendingSDL3Events.
		self waitUntilNextEventLoopIteration ] doWhileTrue: [ eventLoopSession == Smalltalk session ]
	] ensure: [ EventLoopProcess := nil ]
]

{ #category : 'events-processing' }
OSSDL3Driver >> waitUntilNextEventLoopIteration [

	(Delay forMilliseconds: OSSDL3SystemSettings eventLoopPeriodMS) wait
]
