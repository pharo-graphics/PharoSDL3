Class {
	#name : 'SDL3App',
	#superclass : 'Object',
	#instVars : [
		'sdl',
		'loop'
	],
	#category : 'SDL3-Demos',
	#package : 'SDL3-Demos'
}

{ #category : 'hooks' }
SDL3App >> handleEvent: aSDL3MappedEvent [
]

{ #category : 'lifecycle' }
SDL3App >> loopStopped [
	"Prepare to close after terminating the main loop"
]

{ #category : 'lifecycle' }
SDL3App >> loopWillStart [
	"Prepare the demo before starting the main loop"
]

{ #category : 'hooks' }
SDL3App >> newLoop [

	^ SDL3MainLoop new
]

{ #category : 'lifecycle' }
SDL3App >> start [

	sdl := LibSDL3 uniqueInstance.

	self assert: (sdl initSubSystem: self subsystemInitFlags).

	self loopWillStart.

	loop := self newLoop.
	loop start
]

{ #category : 'hooks' }
SDL3App >> stepBySeconds: aDelta [

]

{ #category : 'lifecycle' }
SDL3App >> stop [

	loop stop.

	self loopStopped.

	sdl quit
]

{ #category : 'hooks' }
SDL3App >> subsystemInitFlags [

	^ SDL3InitFlags video
]
