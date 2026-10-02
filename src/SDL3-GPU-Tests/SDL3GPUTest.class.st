Class {
	#name : 'SDL3GPUTest',
	#superclass : 'SDL3SubsystemTest',
	#instVars : [
		'window',
		'gpuDevice'
	],
	#category : 'SDL3-GPU-Tests-Basic',
	#package : 'SDL3-GPU-Tests',
	#tag : 'Basic'
}

{ #category : 'testing' }
SDL3GPUTest class >> isAbstract [

	^ self == SDL3GPUTest
]

{ #category : 'running' }
SDL3GPUTest >> setUp [

	super setUp.

	window := SDL3Window
		         unownedNewTitle: 'GPU Test'
		         width: 640
		         height: 480
		         flags: 0.

	gpuDevice := SDL3GPUDevice unownedNewDebugMode: true.

	gpuDevice claimWindow: window
]

{ #category : 'running' }
SDL3GPUTest >> tearDown [

	gpuDevice ifNotNil: [
		gpuDevice releaseWindow: window.
		gpuDevice destroy ].
	window ifNotNil: [ window destroy ].

	super tearDown
]
