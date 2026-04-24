"
I am a benchmark for the OSSDL3GPUFormRenderer.
I measure how much a Pharo process is blocked during rendering.
"
Class {
	#name : 'OSSDL3GPURenderingBenchmark',
	#superclass : 'Morph',
	#instVars : [
		'measureProcess',
		'backgroundCount',
		'stepCount',
		'countBackgroundProcess'
	],
	#category : 'SDL3-Tests-Benchmarks',
	#package : 'SDL3-Tests',
	#tag : 'Benchmarks'
}

{ #category : 'convenience' }
OSSDL3GPURenderingBenchmark class >> measureFor: aDuration positions: positions [

	| results |
	results := AtomicSharedQueue new.

	positions do: [ :e |
		| bench |
		bench := self new.
		bench position: e asPoint.
		bench measureFor: aDuration to: results ].

	^ Array streamContents: [ :str |
		positions size timesRepeat: [ str nextPut: results next ] ]
]

{ #category : 'convenience' }
OSSDL3GPURenderingBenchmark class >> measureForFiveSecondsOneSmallMorph [

	[ 	self currentWorld worldState worldRenderer osWindowRenderer class trace.
		'. ' trace.
		(self measureFor: 5 seconds positions: #(400)) traceCr ] fork.
]

{ #category : 'convenience' }
OSSDL3GPURenderingBenchmark class >> measureForFiveSecondsTwoSmallMorphs [

	[ 	self currentWorld worldState worldRenderer osWindowRenderer class trace.
		'. ' trace.
		(self measureFor: 5 seconds positions: #(100 800)) traceCr ] fork.
]

{ #category : 'benchmarking' }
OSSDL3GPURenderingBenchmark >> isStarted [

	^ measureProcess isNotNil
]

{ #category : 'benchmarking' }
OSSDL3GPURenderingBenchmark >> measureFor: aDuration to: aCollection [
	"Run a benchmark for the given duration and return the background process throughput."

	self start.
	measureProcess := [
		aDuration wait.
		aCollection nextPut: {
			#stepsPerSecond -> (stepCount/aDuration asSeconds asFloat).
			#backgroundCountPerMS -> (backgroundCount/aDuration asMilliSeconds asFloat) }.
		self stop
	] forkAt: Processor userInterruptPriority
]

{ #category : 'printing' }
OSSDL3GPURenderingBenchmark >> printOn: aStream [

	super printOn: aStream.
	
	aStream << '('.
	aStream print: self bounds.
	aStream << ')'
]

{ #category : 'stepping and presenter' }
OSSDL3GPURenderingBenchmark >> start [

	self assert: self isStarted not.

	stepCount := 0.
	backgroundCount := 0.

	self openInWorld.

	countBackgroundProcess := [
		[ backgroundCount := backgroundCount + 1 ] repeat
	] forkAt: Processor userBackgroundPriority
]

{ #category : 'stepping and presenter' }
OSSDL3GPURenderingBenchmark >> step [

	stepCount := stepCount + 1.
	self color: Color random
]

{ #category : 'stepping and presenter' }
OSSDL3GPURenderingBenchmark >> stepTime [
	"Aim for ~60 FPS"

	^ 16
]

{ #category : 'stepping and presenter' }
OSSDL3GPURenderingBenchmark >> stop [

	self delete.

	countBackgroundProcess terminate.
	countBackgroundProcess := nil.
	measureProcess := nil
]
