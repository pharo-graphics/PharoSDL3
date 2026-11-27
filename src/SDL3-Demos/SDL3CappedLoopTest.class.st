Class {
	#name : 'SDL3CappedLoopTest',
	#superclass : 'TestCase',
	#category : 'SDL3-Demos-Tests',
	#package : 'SDL3-Demos',
	#tag : 'Tests'
}

{ #category : 'tests' }
SDL3CappedLoopTest >> testAmpleSpareTimeDelaysWithoutYield [
	"Verify that when ample spare time exists (>= 1ms), delayBlock is invoked and yieldBlock is not."

	| loop simulatedTime delayed yielded |
	simulatedTime := 0.
	delayed := false.
	yielded := false.
	loop := SDL3CappedLoop new.
	loop hertz: 60.
	loop microsecondsBlock: [ simulatedTime ].
	loop delayBlock: [ :microseconds | delayed := true ].
	loop yieldBlock: [ yielded := true ].
	loop resetDeadline.

	"Simulate work taking 2ms (leaving ~14.6ms spare time)"
	simulatedTime := 2000.
	loop wait.
	self assert: delayed.
	self deny: yielded
]

{ #category : 'tests' }
SDL3CappedLoopTest >> testDefaultBlocks [
	"Verify default block initialization for the clock, delay, step, and yield collaborators."

	| loop |
	loop := SDL3CappedLoop new.
	self assert: loop microsecondsBlock isBlock.
	self assert: loop microsecondsBlock value isInteger.
	self assert: loop microsecondsBlock value > 0.
	self assert: loop delayBlock isBlock.
	self assert: loop stepBlock isBlock.
	self assert: loop yieldBlock isBlock
]

{ #category : 'tests' }
SDL3CappedLoopTest >> testDefaultPacerIsCooperative [
	"Verify SDL3CappedLoop defaults to cooperative software deadline pacing."

	| loop |
	loop := SDL3CappedLoop new.
	self assert: loop pacer class equals: SDL3CooperativePacer.
	self assert: loop pacer shortName equals: 'Cooperative'
]

{ #category : 'tests' }
SDL3CappedLoopTest >> testDefaultSingleWindowAppPacerIsVSync [
	"Verify standalone single-window demos default to tear-free hardware VSync and can toggle to Cooperative."

	| app |
	app := SDL3ClearDemoApp new.
	self assert: app pacer class equals: SDL3VSyncPacer.
	self assert: app updatedTitle equals: 'SDL3ClearDemoApp [VSync]'.

	app togglePacer.
	self assert: app pacer class equals: SDL3CooperativePacer.
	self assert: app updatedTitle equals: 'SDL3ClearDemoApp [Cooperative]'
]

{ #category : 'tests' }
SDL3CappedLoopTest >> testHertzAndPeriod [
	"Verify that setting frequency in Hertz or duration correctly calculates microsecond, millisecond, and second periods."

	| loop |
	"Configure 60 Hz and check calculated period conversions"
	loop := SDL3CappedLoop new.
	loop hertz: 60.
	self assert: loop periodAsSeconds closeTo: 1.0 / 60.

	"Configure a 20 ms Duration and verify exact period representations"
	loop period: 20 milliSeconds.
	self assert: loop periodAsSeconds closeTo: 0.02
]

{ #category : 'tests' }
SDL3CappedLoopTest >> testLoopStepsBlock [
	"Verify #start passes initial periodUS on frame 1, measured elapsed deltaUS thereafter, clamps lag spikes, and supports zero-argument blocks."

	| loop simulatedTime deltas zeroArgCount |
	simulatedTime := 0.
	deltas := OrderedCollection new.
	loop := SDL3CappedLoop new.
	loop hertz: 60.
	loop microsecondsBlock: [ simulatedTime ].
	loop delayBlock: [ :microseconds | ].
	loop yieldBlock: [ ].
	loop stepBlock: [ :deltaUS |
		deltas add: deltaUS.
		deltas size = 1 ifTrue: [ simulatedTime := simulatedTime + 8333 ].
		deltas size = 2 ifTrue: [ simulatedTime := simulatedTime + 500000 ].
		deltas size >= 3 ifTrue: [ loop requestQuit ] ].
	loop start.
	self assert: deltas size equals: 3.
	self assert: (deltas first closeTo: 1000000.0 / 60).
	self assert: deltas second equals: 8333.
	self assert: deltas third equals: 100000.

	zeroArgCount := 0.
	loop stepBlock: [
		zeroArgCount := zeroArgCount + 1.
		loop requestQuit ].
	loop start.
	self assert: zeroArgCount equals: 1
]

{ #category : 'tests' }
SDL3CappedLoopTest >> testOverdueFrameDoesNotYield [
	"Verify that when a frame overshoots its deadline (spare time is negative), neither delayBlock nor yieldBlock is invoked."

	| loop simulatedTime delayed yielded |
	simulatedTime := 0.
	delayed := false.
	yielded := false.
	loop := SDL3CappedLoop new.
	loop hertz: 60.
	loop microsecondsBlock: [ simulatedTime ].
	loop delayBlock: [ :microseconds | delayed := true ].
	loop yieldBlock: [ yielded := true ].
	loop resetDeadline.

	"Simulate heavy frame taking 20ms (> 16.666ms budget)"
	simulatedTime := 20000.
	loop wait.
	self deny: delayed.
	self deny: yielded
]

{ #category : 'tests' }
SDL3CappedLoopTest >> testSimulationAlternatingWorkDurations [
	"Verify that progressive deadlines adjust spare wait durations cleanly across frames with varying work durations."

	| loop simulatedTime recordedWaits |
	simulatedTime := 0.
	recordedWaits := OrderedCollection new.
	loop := SDL3CappedLoop new.
	loop hertz: 60.
	loop microsecondsBlock: [ simulatedTime ].
	loop delayBlock: [ :microseconds |
		| simulatedDelayDuration |
		simulatedDelayDuration := microseconds truncateTo: 1000.
		recordedWaits add: simulatedDelayDuration.
		simulatedTime := simulatedTime + simulatedDelayDuration ].
	loop resetDeadline.

	simulatedTime := simulatedTime + 2000.
	loop wait.
	self assert: recordedWaits size equals: 1.

	simulatedTime := simulatedTime + 7000.
	loop wait.
	self assert: recordedWaits size equals: 2.
	self assert: recordedWaits second equals: 10000
]

{ #category : 'tests' }
SDL3CappedLoopTest >> testSimulationHeavyFrame [
	"Verify that when a frame overruns its budget, the loop skips waiting and catches up on the next frame without dropping into an oscillation cycle."

	| loop simulatedTime recordedWaits expectedWaitUS |
	simulatedTime := 0.
	recordedWaits := OrderedCollection new.
	loop := SDL3CappedLoop new.
	loop hertz: 60.
	loop microsecondsBlock: [ simulatedTime ].
	loop delayBlock: [ :microseconds |
		recordedWaits add: microseconds.
		simulatedTime := simulatedTime + (microseconds truncateTo: 1000) ].
	loop resetDeadline.
	expectedWaitUS := (1000000.0 / 60 * 2) - 22000.

	"Frame 1: 20ms of work exceeds the 16.6ms budget; no delay must be requested"
	simulatedTime := simulatedTime + 20000.
	loop wait.
	self assert: recordedWaits isEmpty.

	"Frame 2: 2ms of work; the loop catches up the remainder of the combined 2-frame budget"
	simulatedTime := simulatedTime + 2000.
	loop wait.
	self assert: recordedWaits size equals: 1.
	self assert: (recordedWaits first closeTo: expectedWaitUS)
]

{ #category : 'tests' }
SDL3CappedLoopTest >> testSimulationLagSpikeCatchUp [
	"Verify that a massive lag spike (e.g. GC pause or window drag) is clamped to prevent a backlog catch-up loop."

	| loop simulatedTime recordedWaits expectedWaitUS |
	simulatedTime := 0.
	recordedWaits := OrderedCollection new.
	loop := SDL3CappedLoop new.
	loop hertz: 60.
	loop microsecondsBlock: [ simulatedTime ].
	loop delayBlock: [ :microseconds |
		recordedWaits add: microseconds.
		simulatedTime := simulatedTime + (microseconds truncateTo: 1000) ].
	loop resetDeadline.
	expectedWaitUS := 1000000.0 / 60 - 2000.

	"Frame 1: normal 2ms work; regular delay requested"
	simulatedTime := simulatedTime + 2000.
	loop wait.
	self assert: recordedWaits size equals: 1.
	self assert: (recordedWaits first closeTo: expectedWaitUS).

	"Frame 2: 500ms lag spike; clamp must trigger and prevent sleeping"
	simulatedTime := simulatedTime + 500000.
	loop wait.
	self assert: recordedWaits size equals: 1.

	"Frame 3: normal 2ms work; deadline was reset so subsequent frame returns to normal pace"
	simulatedTime := simulatedTime + 2000.
	loop wait.
	self assert: recordedWaits size equals: 2.
	self assert: (recordedWaits second closeTo: expectedWaitUS)
]

{ #category : 'tests' }
SDL3CappedLoopTest >> testSimulationLateWakeupAbsorbed [
	"Verify that when Pharo's scheduler wakes up late from a delay, the progressive deadline absorbs the overshoot without causing alternating 0ms delays or oscillation."

	| loop simulatedTime recordedWaits |
	simulatedTime := 0.
	recordedWaits := OrderedCollection new.
	loop := SDL3CappedLoop new.
	loop hertz: 60.
	loop microsecondsBlock: [ simulatedTime ].
	loop delayBlock: [ :microseconds |
		| requestedMS actualSleepUS |
		requestedMS := microseconds // 1000.
		recordedWaits add: requestedMS.
		"Simulate the VM/scheduler waking up 1.2ms late on every frame"
		actualSleepUS := (requestedMS * 1000) + 1200.
		simulatedTime := simulatedTime + actualSleepUS ].
	loop resetDeadline.

	"Simulate 5 frames where work takes 2ms each"
	5 timesRepeat: [
		simulatedTime := simulatedTime + 2000.
		loop wait ].
	self assert: recordedWaits asArray equals: #(14 14 13 14 13)
]

{ #category : 'tests' }
SDL3CappedLoopTest >> testSimulationPacingWithoutOscillation [
	"Verify that consecutive fast frames maintain consistent delay durations without alternating or oscillating."

	| loop simulatedTime recordedWaits |
	simulatedTime := 0.
	recordedWaits := OrderedCollection new.
	loop := SDL3CappedLoop new.
	loop hertz: 60.
	loop microsecondsBlock: [ simulatedTime ].
	loop delayBlock: [ :microseconds |
		| simulatedDelayDuration |
		simulatedDelayDuration := microseconds truncateTo: 1000.
		recordedWaits add: simulatedDelayDuration.
		simulatedTime := simulatedTime + simulatedDelayDuration ].
	loop resetDeadline.

	"Simulate 5 consecutive frames with 2ms work each; each frame must receive consistent spare time"
	5 timesRepeat: [
		simulatedTime := simulatedTime + 2000.
		loop wait ].
	self assert: recordedWaits asArray equals: #(14000 15000 15000 14000 15000)
]

{ #category : 'tests' }
SDL3CappedLoopTest >> testSimulationSubMillisecondWorkDrift [
	"Verify that sub-millisecond variations in frame work duration are absorbed by the progressive deadline without drifting."

	| loop simulatedTime recordedWaits expectedWaitUS |
	simulatedTime := 0.
	recordedWaits := OrderedCollection new.
	loop := SDL3CappedLoop new.
	loop hertz: 60.
	loop microsecondsBlock: [ simulatedTime ].
	loop delayBlock: [ :microseconds |
		recordedWaits add: microseconds.
		simulatedTime := simulatedTime + (microseconds truncateTo: 1000) ].
	loop resetDeadline.
	expectedWaitUS := 1000000.0 / 60 - 2016.

	3 timesRepeat: [
		simulatedTime := simulatedTime + 2016.
		loop wait ].
	self assert: recordedWaits size equals: 3.
	self assert: (recordedWaits first closeTo: expectedWaitUS)
]

{ #category : 'tests' }
SDL3CappedLoopTest >> testSimulationSustainedOverbudgetSkipsDelays [
	"Verify that when every frame takes longer than the target period, software delays are skipped."

	| loop simulatedTime recordedWaits |
	simulatedTime := 0.
	recordedWaits := OrderedCollection new.
	loop := SDL3CappedLoop new.
	loop hertz: 60.
	loop microsecondsBlock: [ simulatedTime ].
	loop delayBlock: [ :microseconds |
		recordedWaits add: microseconds.
		simulatedTime := simulatedTime + (microseconds truncateTo: 1000) ].
	loop resetDeadline.

	3 timesRepeat: [
		simulatedTime := simulatedTime + 33333.
		loop wait ].
	self assert: recordedWaits isEmpty
]

{ #category : 'tests' }
SDL3CappedLoopTest >> testStepSecondsMovesQuadFrameRateIndependently [
	"Verify 1 frame at 60 Hz and 2 frames at 120 Hz produce identical quad displacement."

	| quad60 quad120 extent |
	extent := 1000 @ 1000.
	quad60 := SDL3GPUDualKawaseBlurQuad new
		position: 100.0 @ 100.0;
		velocity: 120.0 @ -60.0;
		rotation: 0.0;
		rotationSpeed: 3.0;
		yourself.
	quad120 := SDL3GPUDualKawaseBlurQuad new
		position: 100.0 @ 100.0;
		velocity: 120.0 @ -60.0;
		rotation: 0.0;
		rotationSpeed: 3.0;
		yourself.

	quad60 step: 1.0 / 60.0 in: extent.
	2 timesRepeat: [ quad120 step: 1.0 / 120.0 in: extent ].
	self assert: (quad60 position x closeTo: quad120 position x).
	self assert: (quad60 position y closeTo: quad120 position y).
	self assert: (quad60 rotation closeTo: quad120 rotation)
]

{ #category : 'tests' }
SDL3CappedLoopTest >> testSubMillisecondSpareTimeYields [
	"Verify that when spare time is positive but under 1ms, #wait invokes yieldBlock and avoids delayBlock."

	| loop simulatedTime delayed yielded |
	simulatedTime := 0.
	delayed := false.
	yielded := false.
	loop := SDL3CappedLoop new.
	loop hertz: 60.
	loop microsecondsBlock: [ simulatedTime ].
	loop delayBlock: [ :microseconds | delayed := true ].
	loop yieldBlock: [ yielded := true ].
	loop resetDeadline.

	"Simulate work taking 16.2ms (leaving ~466 microseconds spare time on a 16.666ms budget)"
	simulatedTime := 16200.
	loop wait.
	self deny: delayed.
	self assert: yielded
]

{ #category : 'tests' }
SDL3CappedLoopTest >> testTogglePacer [
	"Verify toggling alternates between Cooperative and VSync pacers."

	| loop |
	loop := SDL3CappedLoop new.
	self assert: loop pacer class equals: SDL3CooperativePacer.

	loop togglePacer.
	self assert: loop pacer class equals: SDL3VSyncPacer.

	loop togglePacer.
	self assert: loop pacer class equals: SDL3CooperativePacer
]

{ #category : 'tests' }
SDL3CappedLoopTest >> testVSyncPacerDoesNotWaitWhenVSyncBlocked [
	"Verify that under hardware VSync pacing, frames blocked in C (>= 1ms) do not trigger a competing software Delay."

	| loop simulatedTime delayed yieldCount |
	simulatedTime := 0.
	delayed := false.
	yieldCount := 0.
	loop := SDL3CappedLoop new.
	loop hertz: 60.
	loop microsecondsBlock: [ simulatedTime ].
	loop delayBlock: [ :microseconds | delayed := true ].
	loop yieldBlock: [ yieldCount := yieldCount + 1 ].
	loop pacer: SDL3VSyncPacer new.

	"Simulate C VSync blocking for 16.6ms on a 60 Hz display"
	simulatedTime := simulatedTime + 16600.
	loop wait.
	self deny: delayed.
	self assert: yieldCount equals: 1.

	"Simulate C VSync blocking for 8.33ms on a 120 Hz display even when loop hertz is 60"
	simulatedTime := simulatedTime + 8333.
	loop wait.
	self deny: delayed.
	self assert: yieldCount equals: 2
]

{ #category : 'tests' }
SDL3CappedLoopTest >> testVSyncPacerFallsBackToDelayWhenUnthrottled [
	"Verify that under hardware VSync pacing, an unthrottled frame (< 1ms, e.g. minimized window) falls back to delayBlock."

	| loop simulatedTime recordedWaits |
	simulatedTime := 0.
	recordedWaits := OrderedCollection new.
	loop := SDL3CappedLoop new.
	loop hertz: 60.
	loop microsecondsBlock: [ simulatedTime ].
	loop delayBlock: [ :microseconds |
		recordedWaits add: microseconds.
		simulatedTime := simulatedTime + microseconds ].
	loop pacer: SDL3VSyncPacer new.

	simulatedTime := simulatedTime + 500.
	loop wait.
	self assert: recordedWaits size equals: 1.
	self assert: (recordedWaits first closeTo: 1000000.0 / 60 - 500)
]

{ #category : 'tests' }
SDL3CappedLoopTest >> testWaitAdvancesDeadline [
	"Verify that calling #wait advances the next deadline by exactly periodUS."

	| loop initialDeadline |
	loop := SDL3CappedLoop new.
	loop hertz: 120.
	loop wait.
	initialDeadline := loop nextDeadlineUS.
	self assert: initialDeadline isNotNil.

	loop wait.
	self assert: loop nextDeadlineUS equals: initialDeadline + 8333.333333333334
]

{ #category : 'tests' }
SDL3CappedLoopTest >> testWindowHertzChangeResetsActiveDeadline [
	"Verify changing hertz: or period: while a loop has an active deadline immediately recomputes nextDeadlineUS."

	| loop simulatedTime |
	simulatedTime := 10000.
	loop := SDL3CappedLoop new.
	loop microsecondsBlock: [ simulatedTime ].
	loop hertz: 60.
	loop resetDeadline.
	self assert: (loop nextDeadlineUS closeTo: 10000 + (1000000.0 / 60)).

	simulatedTime := 15000.
	loop hertz: 120.
	self assert: (loop nextDeadlineUS closeTo: 15000 + (1000000.0 / 120)).

	simulatedTime := 20000.
	loop period: 10 milliSeconds.
	self assert: loop nextDeadlineUS equals: 30000
]
