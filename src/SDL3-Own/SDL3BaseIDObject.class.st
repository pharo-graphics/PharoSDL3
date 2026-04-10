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
	#category : 'SDL3-Own',
	#package : 'SDL3-Own'
}

{ #category : 'accessing' }
SDL3BaseIDObject class >> id: anInteger [

	^ self basicNew
		initializeWithID: anInteger;
		yourself
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
