"
My subclasses define behavior for specific OS platforms.
"
Class {
	#name : 'OSSDL3Platform',
	#superclass : 'Object',
	#pools : [
		'SDL3ZConstants'
	],
	#category : 'SDL3-OSWindow-Platforms',
	#package : 'SDL3-OSWindow',
	#tag : 'Platforms'
}

{ #category : 'operations' }
OSSDL3Platform >> afterMainPharoWindowCreated: aOSWindow [
]

{ #category : 'public' }
OSSDL3Platform >> afterSetWindowTitle: aString onWindow: aOSWindow [
]

{ #category : 'operations' }
OSSDL3Platform >> beforeMainPharoWindowClosed: aOSWindow [
]

{ #category : 'public' }
OSSDL3Platform >> initPlatformSpecific [
]

{ #category : 'public' }
OSSDL3Platform >> platformSpecificHandleOf: aOSSDL3BackendWindow [

	^ self subclassResponsibility
]
