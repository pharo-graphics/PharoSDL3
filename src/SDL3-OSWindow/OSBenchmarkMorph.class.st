"
I benchmark current OSWindowDriver. I measure how much a Pharo process is blocked during rendering.
"
Class {
	#name : 'OSBenchmarkMorph',
	#superclass : 'Morph',
	#instVars : [
		'measureProcess',
		'backgroundCount',
		'stepCount',
		'countBackgroundProcess'
	],
	#classVars : [
		'BenchDuration',
		'StepTime',
		'WindowExtent'
	],
	#category : 'SDL3-OSWindow',
	#package : 'SDL3-OSWindow'
}

{ #category : 'convenience' }
OSBenchmarkMorph class >> benchAll [
	<script>

	[(self classSide selectors sorted copyWithout: #benchAll)
		select: [ :e | e beginsWith: 'bench' ]
		thenDo: [ :e | (self perform: e) waitForCompletion: BenchDuration * 2 ]] fork
]

{ #category : 'convenience' }
OSBenchmarkMorph class >> benchHorizontal [
	<script>

	^ self measureFor: BenchDuration all: { 50 asPoint extent: 600@20 }
]

{ #category : 'convenience' }
OSBenchmarkMorph class >> benchLarge [
	<script>

	^ self measureFor: BenchDuration all: { 0@0 extent: WindowExtent }
]

{ #category : 'convenience' }
OSBenchmarkMorph class >> benchMedium [
	<script>

	^ self measureFor: BenchDuration all: { 50 asPoint extent: 600@600 }
]

{ #category : 'convenience' }
OSBenchmarkMorph class >> benchTwoDistant [
	<script>

	^ self measureFor: BenchDuration all: {
		50 asPoint extent: 50 asPoint.
		600 asPoint extent: 50 asPoint. }
]

{ #category : 'convenience' }
OSBenchmarkMorph class >> benchVertical [
	<script>

	^ self measureFor: BenchDuration all: { 50 asPoint extent: 20@600 }
]

{ #category : 'class initialization' }
OSBenchmarkMorph class >> initialize [

	StepTime := 16. "Aim for ~60 FPS"
	BenchDuration := 5 seconds.
	WindowExtent := 1280 @ 720 "720p"
]

{ #category : 'convenience' }
OSBenchmarkMorph class >> measureFor: aDuration all: aCollectionOfRectangles [
	"Benchmark in a new process. You can send me from UI or from terminal. The answer is a `TKTFuture`, which is can be used in this way:
	
	./pharo-ui Pharo.image eval 'OSSDL3GPURenderingBenchmark benchVertical andThen: [ Smalltalk snapshot: false andQuit: true ] future'
	"
	
	"For consistency, set the Pharo window extent"
	self currentWorld worldState worldRenderer osWindow extent: WindowExtent.
	Smalltalk garbageCollect.
	1.0 seconds wait.

	^ [		| results |
			results := AtomicSharedQueue new.

			aCollectionOfRectangles do: [ :e |
				| bench |
				bench := self new.
				bench position: e origin.
				bench extent: e extent.
				bench measureFor: aDuration to: results ].

			"Collect bench results (the queue has an internal Semaphore)"
			results := Array streamContents: [ :str |
				aCollectionOfRectangles size timesRepeat: [ str nextPut: results next ] ].
			
			Stdio stdout
				print: self currentWorld worldState worldRenderer osWindowRenderer class;
				<< '. ';
				print: results;
				lf; flush
		] future
]

{ #category : 'benchmarking' }
OSBenchmarkMorph >> measureFor: aDuration to: aCollection [
	"Run benchmark for the given duration and return the background process throughput."

	stepCount := 0.
	backgroundCount := 0.

	self openInWorld.

	countBackgroundProcess := [
		[ backgroundCount := backgroundCount + 1 ] repeat
	] forkAt: Processor userBackgroundPriority.

	measureProcess := [
		aDuration wait.
		aCollection nextPut: {
			#stepsPerSecond -> (stepCount/aDuration asSeconds) asInteger.
			#backgroundCountPerMS -> (backgroundCount/aDuration asMilliSeconds) asInteger }.

		self delete.
		countBackgroundProcess terminate.
		countBackgroundProcess := nil.
		measureProcess := nil 
	] forkAt: Processor userInterruptPriority
]

{ #category : 'printing' }
OSBenchmarkMorph >> printOn: aStream [

	super printOn: aStream.
	
	aStream << '('.
	aStream print: self bounds.
	aStream << ')'
]

{ #category : 'stepping and presenter' }
OSBenchmarkMorph >> step [

	stepCount := stepCount + 1.

	self color:
		(stepCount even
			ifTrue: [ Color orange ]
			ifFalse: [ Color blue ])
]

{ #category : 'stepping and presenter' }
OSBenchmarkMorph >> stepTime [

	^ StepTime
]

{ #category : 'stepping and presenter' }
OSBenchmarkMorph >> stop [

	self delete.

	countBackgroundProcess terminate.
	countBackgroundProcess := nil.
	measureProcess := nil
]
