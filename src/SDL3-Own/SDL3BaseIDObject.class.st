"
I represent a SDL3 object that is identified by an integer ID, which contrasts with typical SDL3 objects that are identified by their external address.
"
Class {
	#name : 'SDL3BaseIDObject',
	#superclass : 'Object',
	#traits : 'LibTSDL3',
	#classTraits : 'LibTSDL3 classTrait',
	#instVars : [
		'id'
	],
	#pools : [
		'SDL3Typedef',
		'SDL3ZConstants'
	],
	#category : 'SDL3-Own-IDObjects',
	#package : 'SDL3-Own',
	#tag : 'IDObjects'
}

{ #category : 'accessing' }
SDL3BaseIDObject class >> id: anInteger [

	^ self basicNew
		initializeWithID: anInteger;
		yourself
]

{ #category : 'comparing' }
SDL3BaseIDObject >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ id = anObject id
]

{ #category : 'comparing' }
SDL3BaseIDObject >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ id hash
]

{ #category : 'accessing' }
SDL3BaseIDObject >> id [

	^ id
]

{ #category : 'initialization' }
SDL3BaseIDObject >> initializeWithID: anInteger [

	self initialize.
	id := anInteger
]
