"
I regulate the execution rate of an SDL3 application loop.

Each cycle I:
- Step the application via stepBlock
- Pause or yield for any remaining spare time to hit the target refresh rate (e.g. 60 Hz)
- Record cumulative frame pacing diagnostics (frame count, elapsed time, idle wait time)

## Pacing Mechanics
Instead of measuring elapsed time between frames (which causes stutter and timing drift), I schedule against a progressive deadline (nextDeadlineUS). Each iteration advances this deadline by a fixed period. Minor timing variations are naturally absorbed without cumulative drift. If a large delay occurs (such as window moving or a GC pause), the deadline resets to avoid catch-up storms.

## Pharo Concurrency & VSync
While display VSync coordinates frame presentation with the physical screen, relying solely on hardware VSync can freeze the Pharo VM during waits, starving background Smalltalk processes. My #wait method yields execution to the Pharo process scheduler using standard Delay, allowing other Smalltalk processes to run during idle headroom. When spare time is under 1 ms, #wait invokes yieldBlock (Processor yield) instead of sleeping, offering CPU time to peer processes without risking an overshoot.

Collaborators:
- stepBlock: receives the frame period in microseconds (deltaUS) and performs the frame step
- microsecondsBlock: queries the current microsecond clock (default: [ Time microsecondClockValue ])
- delayBlock: receives remaining spare microseconds to pause (default: [ :us | (Delay forMilliseconds: us // 1000) wait ])
- yieldBlock: cooperative yield when spare time is under 1 ms (default: [ Processor yield ])
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
		'frameCount',
		'lastFrameUS',
		'totalElapsedUS',
		'totalIdleUS'
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
SDL3CappedLoop >> fps [

	totalElapsedUS <= 0 ifTrue: [ ^ 0.0 ].
	^ frameCount * 1000000.0 / totalElapsedUS
]

{ #category : 'accessing' }
SDL3CappedLoop >> frameCount [

	^ frameCount
]

{ #category : 'accessing' }
SDL3CappedLoop >> hertz: aNumber [

	periodUS := 1000000.0 / aNumber
]

{ #category : 'accessing' }
SDL3CappedLoop >> idleHeadroomPercentage [

	totalElapsedUS <= 0 ifTrue: [ ^ 0.0 ].
	^ totalIdleUS * 100.0 / totalElapsedUS
]

{ #category : 'initialization' }
SDL3CappedLoop >> initialize [

	super initialize.

	self hertz: 60.

	microsecondsBlock := [ Time microsecondClockValue ].
	delayBlock := [ :microseconds | (Delay forMilliseconds: microseconds // 1000) wait ].
	stepBlock := [ :deltaUS | ].
	yieldBlock := [ Processor yield ].

	self resetMetrics
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

	| nowUS |
	nowUS := microsecondsBlock value.
	lastFrameUS := nowUS.
	nextDeadlineUS := nowUS + periodUS
]

{ #category : 'running' }
SDL3CappedLoop >> resetMetrics [

	frameCount := 0.
	totalElapsedUS := 0.
	totalIdleUS := 0
]

{ #category : 'running' }
SDL3CappedLoop >> start [

	| session |
	session := Smalltalk session.
	quit := false.
	self resetMetrics.
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

{ #category : 'accessing' }
SDL3CappedLoop >> syncToWindow: anSDL3Window [
	"Synchronize target hertz to the refresh rate of the display containing anSDL3Window, or 60 Hz on fallback."

	| refreshRate |
	refreshRate :=
		[ anSDL3Window display currentDisplayMode refreshRate ]
			on: Error
			do: [ :error | 60 ].
	(refreshRate isNil or: [ refreshRate <= 0 ]) ifTrue: [ refreshRate := 60 ].
	self hertz: refreshRate rounded
]

{ #category : 'accessing' }
SDL3CappedLoop >> totalElapsedUS [

	^ totalElapsedUS
]

{ #category : 'accessing' }
SDL3CappedLoop >> totalIdleUS [

	^ totalIdleUS
]

{ #category : 'private' }
SDL3CappedLoop >> wait [
	"Wait or yield for any remaining spare time to maintain the target frame period"

	| currentUS spareUS wakeUS |
	currentUS := microsecondsBlock value.
	nextDeadlineUS ifNil: [ nextDeadlineUS := currentUS + periodUS ].
	lastFrameUS ifNil: [ lastFrameUS := currentUS ].
	spareUS := nextDeadlineUS - currentUS.

	"Wait if spare time is at least 1ms.
	(1 millisecond = 1000 microseconds).
	Otherwise, cooperatively yield if any positive spare time remains."
	spareUS >= 1000
		ifTrue: [ delayBlock cull: spareUS ]
		ifFalse: [
			spareUS > 0 ifTrue: [ yieldBlock value ] ].

	nextDeadlineUS := nextDeadlineUS + periodUS.
	wakeUS := microsecondsBlock value.
	wakeUS > (nextDeadlineUS + periodUS) ifTrue: [
		nextDeadlineUS := wakeUS + periodUS ].

	frameCount := frameCount + 1.
	totalElapsedUS := totalElapsedUS + (wakeUS - lastFrameUS).
	wakeUS > currentUS ifTrue: [
		totalIdleUS := totalIdleUS + (wakeUS - currentUS) ].
	lastFrameUS := wakeUS
]

{ #category : 'accessing' }
SDL3CappedLoop >> yieldBlock [

	^ yieldBlock
]

{ #category : 'accessing' }
SDL3CappedLoop >> yieldBlock: aBlock [

	yieldBlock := aBlock
]
