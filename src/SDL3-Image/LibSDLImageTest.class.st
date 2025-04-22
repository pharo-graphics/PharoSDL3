Class {
	#name : 'LibSDLImageTest',
	#superclass : 'TestCase',
	#instVars : [
		'lib'
	],
	#category : 'SDL3-Image-Tests',
	#package : 'SDL3-Image',
	#tag : 'Tests'
}

{ #category : 'running' }
LibSDLImageTest >> setUp [

	super setUp.

	lib := LibSDL_image uniqueInstance
]

{ #category : 'tests' }
LibSDLImageTest >> test01Version [

	self assert: lib version >= 3002004
]
