Class {
	#name : 'SDL3BaseObject',
	#superclass : 'FFIOpaqueObject',
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

{ #category : 'comparing' }
SDL3BaseObject >> = anObject [
	"Equality relies on the handle in the opaque external objects"

	^ self class == anObject class and: [
		self getHandle = anObject getHandle ]
]

{ #category : 'finalization' }
SDL3BaseObject >> destroy [
	"Hook for subclasses to destroy their native handle.
	Subclasses with specific C destructor functions override this."
]

{ #category : 'finalization' }
SDL3BaseObject >> dispose [

	(handle isNil or: [ self isNull ]) ifTrue: [ ^ self ].
	self destroy.
	handle beNull
]

{ #category : 'comparing' }
SDL3BaseObject >> hash [

	^ self class hash bitXor: self getHandle hash
]

{ #category : 'initialization' }
SDL3BaseObject >> initialize [
	"do nothing (prevent initialize to set the handle)"
]
