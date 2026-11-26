"
I am an abstract frame pacer defining how an SDL3 application coordinates frame pacing between Smalltalk and SDL3 presentation.

My subclasses reify the two valid pacers on a single-threaded Pharo VM:
- `SDL3VSyncPacer`: Lets hardware VSync block in C for tear-free presentation without fighting a second software clock (default for `SDL3SingleWindowApp` demos).
- `SDL3CooperativePacer`: Keeps C presentation non-blocking (`MAILBOX` or `IMMEDIATE` / VSync disabled) and paces frames in Smalltalk so background `Process`es can run between frames (default for `SDL3CappedLoop`).
"
Class {
	#name : 'SDL3FramePacer',
	#superclass : 'Object',
	#pools : [
		'SDL3AllEnumerations'
	],
	#category : 'SDL3-Demos-Base',
	#package : 'SDL3-Demos',
	#tag : 'Base'
}

{ #category : 'testing' }
SDL3FramePacer class >> isAbstract [

	^ self == SDL3FramePacer
]

{ #category : 'gpu' }
SDL3FramePacer >> acquireSwapchainTextureForWindow: aWindow commandBuffer: aCommandBuffer into: aTextureHolder [

	self subclassResponsibility
]

{ #category : 'gpu' }
SDL3FramePacer >> configureGPUDevice: aGPUDevice window: aWindow [

	self subclassResponsibility
]

{ #category : 'renderer' }
SDL3FramePacer >> configureRenderer: aRenderer [

	self subclassResponsibility
]

{ #category : 'accessing' }
SDL3FramePacer >> name [

	self subclassResponsibility
]

{ #category : 'accessing' }
SDL3FramePacer >> shortName [

	self subclassResponsibility
]

{ #category : 'converting' }
SDL3FramePacer >> toggled [

	self subclassResponsibility
]

{ #category : 'pacing' }
SDL3FramePacer >> waitOnLoop: aLoop at: currentUS [

	self subclassResponsibility
]
