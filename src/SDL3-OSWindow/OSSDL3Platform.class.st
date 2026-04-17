Class {
	#name : 'OSSDL3Platform',
	#superclass : 'Object',
	#pools : [
		'SDL3ZConstants'
	],
	#category : 'SDL3-OSWindow',
	#package : 'SDL3-OSWindow'
}

{ #category : 'public' }
OSSDL3Platform >> afterSetWindowTitle: aString onWindow: aOSSDL3Window [
]

{ #category : 'public' }
OSSDL3Platform >> initPlatformSpecific [
]

{ #category : 'public' }
OSSDL3Platform >> platformSpecificHandleOf: aOSSDL3BackendWindow [

	^ self subclassResponsibility
]
