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
SDL3Structure class >> unownedNew [
	"Answer a new instance on the external heap with zeroed memory. The sender is responsible for freeing it."

	| instance |
	instance := self externalNew.
	instance zeroOut.
	^ instance
]

{ #category : 'initialization' }
SDL3Structure >> zeroOut [

	self ffiLibrary memsetDst: handle c: 0 len: self externalTypeSize
]
