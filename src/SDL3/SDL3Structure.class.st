Class {
	#name : 'SDL3Structure',
	#superclass : 'FFIStructure',
	#traits : 'TSDL3Library',
	#classTraits : 'TSDL3Library classTrait',
	#pools : [
		'SDL3Aliases',
		'SDL3Constants'
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
	| array |
	array := (FFIExternalArray externalNewType: self size: anInteger)
		autoRelease;
		yourself.
	array zeroMemory.
	^ array
]

{ #category : 'initialization' }
SDL3Structure >> zeroMemory [

	handle ifNotNil: [
		SDL3Library uniqueInstance memsetDst: handle c: 0 len: self externalTypeSize ]
]
