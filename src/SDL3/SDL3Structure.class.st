Class {
	#name : 'SDL3Structure',
	#superclass : 'FFIStructure',
	#traits : 'LibTSDL3',
	#classTraits : 'LibTSDL3 classTrait',
	#pools : [
		'SDL3Typedef',
		'SDL3ZConstants'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'instance creation' }
SDL3Structure class >> externalNew [

	| instance |
	instance := super externalNew.
	instance zeroMemory.
	^ instance
]

{ #category : 'instance creation' }
SDL3Structure class >> safeNew [

	^ self externalNew
		autoRelease;
		yourself
]

{ #category : 'instance creation' }
SDL3Structure class >> safeNewArray: anInteger [

	^ (FFIExternalArray externalNewType: self size: anInteger)
		autoRelease;
		yourself
]

{ #category : 'initialization' }
SDL3Structure >> zeroMemory [

	handle ifNotNil: [
		1 to: self externalTypeSize do: [ :index |
			handle unsignedByteAt: index put: 0 ] ]
]
