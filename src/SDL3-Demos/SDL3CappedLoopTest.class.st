Class {
	#name : 'SDL3CappedLoopTest',
	#superclass : 'TestCase',
	#category : 'SDL3-Demos-Tests',
	#package : 'SDL3-Demos',
	#tag : 'Tests'
}

{ #category : 'tests' }
SDL3CappedLoopTest >> testDefaultBlocks [
	"Verify default block initialization for the clock, delay, and step collaborators."

	| loop |
	loop := SDL3CappedLoop new.
	self assert: loop microsecondsBlock isBlock.
	self assert: loop microsecondsBlock value isInteger.
	self assert: loop microsecondsBlock value > 0.
	self assert: loop delayBlock isBlock.
	self assert: loop stepBlock isBlock
]

{ #category : 'tests' }
SDL3CappedLoopTest >> testHertzAndPeriod [
	"Verify that setting frequency in Hertz or duration correctly calculates microsecond, millisecond, and second periods."

	| loop |
	"Configure 60 Hz and check calculated period conversions"
	loop := SDL3CappedLoop new.
	loop hertz: 60.
	self assert: (loop periodUS closeTo: 1000000.0 / 60).
	self assert: (loop periodMS closeTo: 1000.0 / 60).
	self assert: (loop periodAsSeconds closeTo: 1.0 / 60).

	"Configure a 20 ms Duration and verify exact period representations"
	loop period: 20 milliSeconds.
	self assert: loop periodUS equals: 20000.
	self assert: loop periodMS equals: 20.0.
	self assert: loop periodAsSeconds equals: 0.02
]

{ #category : 'tests' }
SDL3CappedLoopTest >> testLoopStepsBlock [
	"Verify that #start executes stepBlock passing periodUS as deltaUS until quit is requested."

	| loop stepCount receivedDeltaUS |
	stepCount := 0.
	receivedDeltaUS := nil.
	loop := SDL3CappedLoop new.
	loop hertz: 1000.
	loop stepBlock: [ :deltaUS |
		stepCount := stepCount + 1.
		receivedDeltaUS := deltaUS.
		stepCount >= 3 ifTrue: [ loop requestQuit ] ].
	loop start.
	self assert: stepCount equals: 3.
	self assert: receivedDeltaUS equals: loop periodUS
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
SDL3CappedLoopTest >> testSimulationVSyncClockDrift [
	"When small clock drift occurs between hardware and software (e.g. 59.94 Hz vs 60.00 Hz), the progressive deadline absorbs the difference without drifting over time."

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

	"Simulate 3 frames with small clock drift (e.g. 16 microseconds extra per frame)"
	3 timesRepeat: [
		simulatedTime := simulatedTime + 2016.
		loop wait ].
	self assert: recordedWaits size equals: 3.
	self assert: (recordedWaits first closeTo: expectedWaitUS)
]

{ #category : 'tests' }
SDL3CappedLoopTest >> testSimulationVSyncDisplaySlowerThanTarget [
	"When the screen or hardware renders slower than our target (e.g. 30 Hz screen with a 60 Hz target), the loop skips delays and stays locked to the hardware pace."

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

	"Simulate frames taking 33.3ms (30 Hz); no software wait should be triggered"
	3 timesRepeat: [
		simulatedTime := simulatedTime + 33333.
		loop wait ].
	self assert: recordedWaits isEmpty
]

{ #category : 'tests' }
SDL3CappedLoopTest >> testSimulationVSyncExactMultiple [
	"When the display refresh rate is an exact multiple of our target (e.g. 120 Hz monitor with a 60 Hz target), frames cadence smoothly on every second refresh."

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

	"Simulate 4 frames where work takes 2ms, paced to a 120 Hz display"
	4 timesRepeat: [
		simulatedTime := simulatedTime + 2000.
		loop wait ].
	self assert: recordedWaits asArray equals: #(14000 15000 15000 14000)
]

{ #category : 'tests' }
SDL3CappedLoopTest >> testSimulationVSyncNonMultiple [
	"When the display refresh rate is not an even multiple (e.g. 144 Hz monitor with a 60 Hz target), screen presentation naturally alternates between 2 and 3 refresh cycles."

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

	"Simulate frames completing near alternating 144 Hz intervals"
	simulatedTime := simulatedTime + 2000.
	loop wait.
	self assert: recordedWaits size equals: 1.

	simulatedTime := simulatedTime + 7000.
	loop wait.
	self assert: recordedWaits size equals: 2.
	self assert: recordedWaits second equals: 10000
]

{ #category : 'tests' }
SDL3CappedLoopTest >> testWaitAdvancesDeadline [
	"Verify that calling #wait advances the next deadline by exactly periodUS."

	| loop initialDeadline |
	loop := SDL3CappedLoop new.
	loop hertz: 60.
	loop wait.
	initialDeadline := loop nextDeadlineUS.
	self assert: initialDeadline isNotNil.

	loop wait.
	self assert: loop nextDeadlineUS equals: initialDeadline + loop periodUS
]
