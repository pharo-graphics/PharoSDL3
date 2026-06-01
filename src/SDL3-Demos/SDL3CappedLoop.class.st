"
I represent a particular SDL3 main loop that works with an ""app"" object.

- regularly poll available events, map them to `SDL3MappedEvent`s and sends them to the app using `#handleEvent:` selector
- send `#step` to the app after polling all events
- caps the step rate via Pharo wait

"
Class {
	#name : 'SDL3CappedLoop',
	#superclass : 'Object',
	#instVars : [
		'delay',
		'periodMS',
		'lastUS',
		'object',
		'selector',
		'quit'
	],
	#category : 'SDL3-Demos-Base',
	#package : 'SDL3-Demos',
	#tag : 'Base'
}

{ #category : 'accessing' }
SDL3CappedLoop >> hertz: aNumber [

	periodMS := 1000.0 / aNumber
]

{ #category : 'initialization' }
SDL3CappedLoop >> initialize [

	super initialize.

	self hertz: 60.

	delay := Delay forMilliseconds: 0
]

{ #category : 'accessing' }
SDL3CappedLoop >> object [

	^ object
]

{ #category : 'accessing' }
SDL3CappedLoop >> object: anObject [

	object := anObject
]

{ #category : 'accessing' }
SDL3CappedLoop >> period: aDuration [

	periodMS := aDuration asMilliSeconds asFloat
]

{ #category : 'accessing' }
SDL3CappedLoop >> periodAsSeconds [

	^ periodMS / 1000.0
]

{ #category : 'lifecycle' }
SDL3CappedLoop >> requestQuit [

	quit := true
]

{ #category : 'accessing' }
SDL3CappedLoop >> selector [

	^ selector
]

{ #category : 'accessing' }
SDL3CappedLoop >> selector: aSymbol [

	selector := aSymbol
]

{ #category : 'running' }
SDL3CappedLoop >> start [

	| session |
	session := Smalltalk session.
	quit := false.
	lastUS := Time microsecondClockValue.
	
	[ object perform: selector. self wait ]
		doWhileFalse: [ quit or: [ Smalltalk session ~~ session ] ]
]

{ #category : 'private' }
SDL3CappedLoop >> wait [
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
