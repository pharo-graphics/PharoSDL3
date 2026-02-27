"
I represent a particular SDL3 main loop that works with an ""app"" object.

- regularly poll available events, map them to `SDL3MappedEvent`s and sends them to the app using `#handleEvent:` selector
- send `#stepBySeconds:` to the app after polling all events
- caps the step rate via Pharo wait

"
Class {
	#name : 'SDL3MainLoop',
	#superclass : 'Object',
	#instVars : [
		'process',
		'event',
		'session',
		'delay',
		'eventMap',
		'periodMS',
		'app',
		'lastUS',
		'lastStepUS'
	],
	#category : 'SDL3-Demos',
	#package : 'SDL3-Demos'
}

{ #category : 'accessing' }
SDL3MainLoop >> app [

	^ app
]

{ #category : 'accessing' }
SDL3MainLoop >> app: anObject [

	app := anObject
]

{ #category : 'accessing' }
SDL3MainLoop >> hertz: aNumber [

	periodMS := 1000.0 / aNumber
]

{ #category : 'initialization' }
SDL3MainLoop >> initialize [

	super initialize.
	
	self hertz: 60.

	delay := Delay forMilliseconds: 0.
	eventMap := SDL3EventMap new.
	event := SDL3Event new
]

{ #category : 'testing' }
SDL3MainLoop >> isRunning [

	^ process notNil and: [ process isTerminated not ]
]

{ #category : 'accessing' }
SDL3MainLoop >> period: aDuration [

	periodMS := aDuration asMilliSeconds asFloat
]

{ #category : 'running' }
SDL3MainLoop >> start [

	self isRunning ifTrue: [ ^ self ].

	session := Smalltalk session.
	lastUS := Time microsecondClockValue.
	process := [ [ self step ] repeat ] forkAt: Processor lowIOPriority
]

{ #category : 'private' }
SDL3MainLoop >> step [
	"Perform an interation of the main loop."

	self flag: #todo. "Session may change in midst of event handling as well"
	Smalltalk session == session ifFalse: [ ^ self stop ].

	[ LibSDL3 uniqueInstance pollEvent: event ]
		whileTrue: [ app handleEvent: (eventMap value: event) ].

	self stepApp.
	self wait
]

{ #category : 'private' }
SDL3MainLoop >> stepApp [

	| currentUS |
	currentUS := Time microsecondClockValue.
	app stepBySeconds: (currentUS - lastStepUS) / 1e6.
	lastStepUS := currentUS
]

{ #category : 'running' }
SDL3MainLoop >> stop [

	process ifNil: [ ^ self ].
	process terminate.
	process := nil.
	session := nil.
	lastUS := nil
]

{ #category : 'private' }
SDL3MainLoop >> wait [
	"May wait, according to the expected refresh rate"

	| waitMS deltaUS currentUS |
	currentUS := Time microsecondClockValue.
	deltaUS := currentUS - lastUS.
	lastUS := currentUS.

	"Wait if spare time is at least 1ms.
	(1 millisecond = 1000 microseconds)"
	waitMS := (periodMS - deltaUS) // 1000.
	waitMS > 0 ifTrue: [ delay setDelay: waitMS; wait ]
]
