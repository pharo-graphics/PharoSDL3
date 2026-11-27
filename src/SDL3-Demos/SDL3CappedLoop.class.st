"
I regulate the execution rate of an SDL3 application loop.

Each cycle I:
- Step the application via stepBlock
- Delegate frame waiting to my active pacer

## Frame Pacers
- `SDL3CooperativePacer` (default): Schedules against a progressive deadline (nextDeadlineUS) in Smalltalk while C presentation stays non-blocking, allowing other Smalltalk Processes to run during `Delay wait` (or `Processor yield` under 1 ms). If a large delay occurs (such as window dragging or a GC pause), the deadline clamps forward to avoid catch-up bursts.
- `SDL3VSyncPacer`: Lets hardware VBlank pace visible frames in C without a competing software deadline, falling back to a sleep only when a frame returns immediately without blocking (e.g. a minimized window).

Collaborators:
- pacer: coordinates Smalltalk waiting and SDL3 VSync/swapchain configuration
- stepBlock: receives the nominal frame period in microseconds (deltaUS) and performs the frame step
- microsecondsBlock: queries the current microsecond clock (default: [ Time microsecondClockValue ])
- delayBlock: receives remaining spare microseconds to pause (default: [ :microseconds | (Delay forMilliseconds: microseconds // 1000) wait ])
- yieldBlock: cooperative yield when not sleeping on a Delay (default: [ Processor yield ])
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
		'stepBlock',
		'yieldBlock',
		'pacer',
		'lastFrameUS'
	],
	#category : 'SDL3-Demos-Base',
	#package : 'SDL3-Demos',
	#tag : 'Base'
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
	stepBlock := [ :deltaUS | ].
	yieldBlock := [ Processor yield ].
	pacer := SDL3CooperativePacer new
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
SDL3CappedLoop >> pacer [

	^ pacer
]

{ #category : 'accessing' }
SDL3CappedLoop >> pacer: aFramePacer [

	pacer := aFramePacer.
	self resetDeadline
]

{ #category : 'accessing' }
SDL3CappedLoop >> period: aDuration [

	periodUS := aDuration asMicroseconds
]

{ #category : 'accessing' }
SDL3CappedLoop >> periodAsSeconds [

	^ periodUS / 1000000.0
]

{ #category : 'lifecycle' }
SDL3CappedLoop >> requestQuit [

	quit := true
]

{ #category : 'running' }
SDL3CappedLoop >> resetDeadline [

	| nowUS |
	nowUS := microsecondsBlock value.
	lastFrameUS := nowUS.
	nextDeadlineUS := nowUS + periodUS
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

{ #category : 'pacing' }
SDL3CappedLoop >> togglePacer [

	self pacer: pacer toggled
]

{ #category : 'private' }
SDL3CappedLoop >> wait [
	"Delegate frame waiting to the active pacer."

	| currentUS |
	currentUS := microsecondsBlock value.
	lastFrameUS ifNil: [ lastFrameUS := currentUS ].

	pacer waitOnLoop: self at: currentUS.

	lastFrameUS := microsecondsBlock value
]

{ #category : 'pacing' }
SDL3CappedLoop >> waitIfUnthrottledFrom: currentUS [
	"When hardware VSync paces visible frames in C, avoid running a competing software deadline.
	If stepBlock completed in under 1ms without blocking (e.g. a minimized window), wait for the remaining spare time so the loop does not spin uncapped; otherwise yield cooperatively to same-priority processes."

	| elapsedUS spareUS |
	elapsedUS := currentUS - lastFrameUS.
	spareUS := periodUS - elapsedUS.
	(elapsedUS < 1000 and: [ spareUS >= 1000 ])
		ifTrue: [ delayBlock cull: spareUS ]
		ifFalse: [ yieldBlock value ]
]

{ #category : 'pacing' }
SDL3CappedLoop >> waitUntilNextDeadlineFrom: currentUS [
	"Wait or yield against a progressive deadline to maintain the target frame period in Smalltalk."

	| spareUS wakeUS |
	nextDeadlineUS ifNil: [ nextDeadlineUS := currentUS + periodUS ].
	spareUS := nextDeadlineUS - currentUS.

	"Wait if spare time is at least 1ms (1000 microseconds).
	Otherwise, cooperatively yield if any positive spare time remains."
	spareUS >= 1000
		ifTrue: [ delayBlock cull: spareUS ]
		ifFalse: [
			spareUS > 0 ifTrue: [ yieldBlock value ] ].

	nextDeadlineUS := nextDeadlineUS + periodUS.
	wakeUS := microsecondsBlock value.
	wakeUS > (nextDeadlineUS + periodUS) ifTrue: [
		nextDeadlineUS := wakeUS + periodUS ]
]

{ #category : 'accessing' }
SDL3CappedLoop >> yieldBlock [

	^ yieldBlock
]

{ #category : 'accessing' }
SDL3CappedLoop >> yieldBlock: aBlock [

	yieldBlock := aBlock
]
