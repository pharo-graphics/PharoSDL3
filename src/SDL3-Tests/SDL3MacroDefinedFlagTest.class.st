"
A SDL3MacroDefinedFlagTest is a test class for testing the behavior of SDL3MacroDefinedFlag
"
Class {
	#name : 'SDL3MacroDefinedFlagTest',
	#superclass : 'TestCase',
	#category : 'SDL3-Tests-Library',
	#package : 'SDL3-Tests',
	#tag : 'Library'
}

{ #category : 'tests' }
SDL3MacroDefinedFlagTest >> testAllValues [

	self
		assert: SDL3InitFlags allValues sorted
		equals: {
			SDL3InitFlags audio.
			SDL3InitFlags camera.
			SDL3InitFlags events.
			SDL3InitFlags gamepad.
			SDL3InitFlags haptic.
			SDL3InitFlags joystick.
			SDL3InitFlags sensor.
			SDL3InitFlags video }
]

{ #category : 'tests' }
SDL3MacroDefinedFlagTest >> testAllValuesIn [

	self
		assert: (SDL3InitFlags allValuesIn: SDL3InitFlags video | SDL3InitFlags audio)
		equals: {
			SDL3InitFlags audio.
			SDL3InitFlags video }
]

{ #category : 'tests' }
SDL3MacroDefinedFlagTest >> testFlagOperations [

	self assert: SDL3InitFlags video value equals: 32.
	self assert: SDL3InitFlags audio value equals: 16.

	self assert: SDL3InitFlags video | SDL3InitFlags audio equals: 48.

	self assert: (SDL3InitFlags video bitOr: SDL3InitFlags audio) equals: 48.

]
