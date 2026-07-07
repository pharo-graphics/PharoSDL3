Class {
	#name : 'SDL3SubsystemTest',
	#superclass : 'SDL3Test',
	#category : 'SDL3-Tests-Library',
	#package : 'SDL3-Tests',
	#tag : 'Library'
}

{ #category : 'testing' }
SDL3SubsystemTest class >> isAbstract [

	^ self == SDL3SubsystemTest
]

{ #category : 'running' }
SDL3SubsystemTest >> runCase [
	"Tests that require to init/quit SDL3 subsystems  must be skip when Smalltalk isInteractive"

	Smalltalk isInteractive ifTrue: [ 
		self traceCr: self asString , ' skipped: Must run in headless sessions to prevent crashes'.
		^ self skip ].
	super runCase
]

{ #category : 'running' }
SDL3SubsystemTest >> setUp [

	super setUp.
	sdl initSubSystem: self subsystemInitFlags
]

{ #category : 'hooks' }
SDL3SubsystemTest >> subsystemInitFlags [

	^ SDL_INIT_VIDEO
]

{ #category : 'running' }
SDL3SubsystemTest >> tearDown [

	sdl quitSubSystem: self subsystemInitFlags.
	super tearDown
]
