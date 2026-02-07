Class {
	#name : 'SDL3MappedEvent',
	#superclass : 'SDL3Structure',
	#category : 'SDL3-Own',
	#package : 'SDL3',
	#tag : 'Own'
}

{ #category : 'visitor' }
SDL3MappedEvent >> accept: aVisitor [

	^ aVisitor visitMappedEvent: self
]
