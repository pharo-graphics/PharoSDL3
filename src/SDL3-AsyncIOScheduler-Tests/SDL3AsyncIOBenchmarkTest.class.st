"
I provide smoke tests for SDL3AsyncIOBenchmark to verify all benchmark routines execute cleanly without errors.
"
Class {
	#name : 'SDL3AsyncIOBenchmarkTest',
	#superclass : 'SDL3Test',
	#category : 'SDL3-AsyncIOScheduler-Tests',
	#package : 'SDL3-AsyncIOScheduler-Tests'
}

{ #category : 'tests' }
SDL3AsyncIOBenchmarkTest >> testPrioritiesConfiguration [

	| benchmark |
	benchmark := SDL3AsyncIOBenchmark new.
	self assert: benchmark workerPriority equals: Processor userBackgroundPriority.
	self assert: benchmark workloadPriority equals: Processor systemBackgroundPriority.
	self assert: benchmark workloadPriority < benchmark workerPriority.

	benchmark workerPriority: 30.
	self assert: benchmark workerPriority equals: 30.

	benchmark workloadPriority: 25.
	self assert: benchmark workloadPriority equals: 25.

	self
		should: [ benchmark workloadPriority: 35 ]
		raise: Error.
	self
		should: [ benchmark workerPriority: 20 ]
		raise: Error
]

{ #category : 'tests' }
SDL3AsyncIOBenchmarkTest >> testSmokeRunAll [

	| benchmark |
	benchmark := SDL3AsyncIOBenchmark new.
	benchmark runAll.
	self assert: benchmark reportStream contents isNotEmpty
]
