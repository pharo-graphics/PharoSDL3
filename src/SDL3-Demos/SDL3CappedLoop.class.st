"
I regulate the execution rate of an SDL3 application loop.

Each cycle I:
- Process available events
- Step the application via stepBlock
- Pause for any remaining spare time to hit the target refresh rate (e.g. 60 Hz)

## Pacing Mechanics
Instead of measuring elapsed time between frames (which causes stutter and timing drift), I schedule against a progressive deadline (nextDeadlineUS). Each iteration advances this deadline by a fixed period. Minor timing variations are naturally absorbed without cumulative drift. If a large delay occurs (such as window moving or a GC pause), the deadline resets to avoid catch-up storms.

## Pharo Concurrency & VSync
While display VSync coordinates frame presentation with the physical screen, relying solely on hardware VSync can freeze the Pharo VM during waits, starving background Smalltalk processes. My #wait method yields execution to the Pharo process scheduler using standard Delay, allowing other Smalltalk processes to run during idle headroom.

Collaborators:
- stepBlock: receives the frame period in microseconds (deltaUS) and performs the frame step
- microsecondsBlock: queries the current microsecond clock (default: [ Time microsecondClockValue ])
- delayBlock: receives remaining spare microseconds to pause (default: [ :us | (Delay forMilliseconds: us // 1000) wait ])
"
Class {
	#name : 'SDL3CappedLoop',
	#superclass : 'Object',
	#instVars : [
		'periodUS',
		'nextDeadlineUS',
		'quit',
		'microsecondsBlock',
		'delayBlock',
		'stepBlock'
	],
	#category : 'SDL3-Demos',
	#package : 'SDL3-Demos'
}

{ #category : 'accessing' }
SDL3CappedLoop >> delayBlock [

	^ delayBlock
]

{ #category : 'accessing' }
SDL3CappedLoop >> delayBlock: aBlock [

	delayBlock := aBlock
]

{ #category : 'accessing' }
SDL3CappedLoop >> hertz: aNumber [

	periodUS := 1000000.0 / aNumber
]

{ #category : 'initialization' }
SDL3CappedLoop >> initialize [

	super initialize.

	self hertz: 60.

	microsecondsBlock := [ Time microsecondClockValue ].
	delayBlock := [ :microseconds | (Delay forMilliseconds: microseconds // 1000) wait ].
	stepBlock := [ :deltaUS | ]
]

{ #category : 'accessing' }
SDL3CappedLoop >> microsecondsBlock [

	^ microsecondsBlock
]

{ #category : 'accessing' }
SDL3CappedLoop >> microsecondsBlock: aBlock [

	microsecondsBlock := aBlock
]

{ #category : 'accessing' }
SDL3CappedLoop >> nextDeadlineUS [

	^ nextDeadlineUS
]

{ #category : 'accessing' }
SDL3CappedLoop >> period: aDuration [

	periodUS := aDuration asMicroseconds
]

{ #category : 'accessing' }
SDL3CappedLoop >> periodAsSeconds [

	^ periodUS / 1000000.0
]

{ #category : 'accessing' }
SDL3CappedLoop >> periodMS [

	^ periodUS / 1000.0
]

{ #category : 'accessing' }
SDL3CappedLoop >> periodUS [

	^ periodUS
]

{ #category : 'lifecycle' }
SDL3CappedLoop >> requestQuit [

	quit := true
]

{ #category : 'running' }
SDL3CappedLoop >> resetDeadline [

	nextDeadlineUS := microsecondsBlock value + periodUS
]

{ #category : 'running' }
SDL3CappedLoop >> start [

	| session |
	session := Smalltalk session.
	quit := false.
	self resetDeadline.

	[ stepBlock value: periodUS. self wait ]
		doWhileFalse: [ quit or: [ Smalltalk session ~~ session ] ]
]

{ #category : 'accessing' }
SDL3CappedLoop >> stepBlock [

	^ stepBlock
]

{ #category : 'accessing' }
SDL3CappedLoop >> stepBlock: aBlock [

	stepBlock := aBlock
]

{ #category : 'private' }
SDL3CappedLoop >> wait [
	"May wait, according to the expected refresh rate"

	| currentUS spareUS wakeUS |
	currentUS := microsecondsBlock value.
	nextDeadlineUS ifNil: [ nextDeadlineUS := currentUS + periodUS ].
	spareUS := nextDeadlineUS - currentUS.

	"Wait if spare time is at least 1ms.
	(1 millisecond = 1000 microseconds)"
	spareUS >= 1000 ifTrue: [ delayBlock cull: spareUS ].

	nextDeadlineUS := nextDeadlineUS + periodUS.
	wakeUS := microsecondsBlock value.
	wakeUS > (nextDeadlineUS + periodUS) ifTrue: [
		nextDeadlineUS := wakeUS + periodUS ]
]
