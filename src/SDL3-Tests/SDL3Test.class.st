"
A LibSDL3Test is a test class for testing the behavior of LibSDL3
"
Class {
	#name : 'SDL3Test',
	#superclass : 'TestCase',
	#instVars : [
		'lib'
	],
	#category : 'SDL3-Tests-Library',
	#package : 'SDL3-Tests',
	#tag : 'Library'
}

{ #category : 'testing' }
SDL3Test class >> isAbstract [

	^ self == SDL3Test
]

{ #category : 'running' }
SDL3Test >> setUp [

	super setUp.

	lib := LibSDL3 uniqueInstance
]

{ #category : 'running' }
SDL3Test >> tearDown [

	lib quit.

	super tearDown
]
