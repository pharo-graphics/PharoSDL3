Extension { #name : 'SDL3BaseObject' }

{ #category : '*SDL3-Additions' }
SDL3BaseObject >> = anObject [
	"Equality relies on the handle in the opaque external objects"

	^ self class == anObject class and: [
		self getHandle = anObject getHandle ]
]

{ #category : '*SDL3-Additions' }
SDL3BaseObject >> dispose [

	(handle isNil or: [ self isNull ]) ifTrue: [ ^ self ].
	self destroy.
	handle beNull
]

{ #category : '*SDL3-Additions' }
SDL3BaseObject >> hash [

	^ self class hash bitXor: self getHandle hash
]
