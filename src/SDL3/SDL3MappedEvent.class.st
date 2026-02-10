Class {
	#name : 'SDL3MappedEvent',
	#superclass : 'SDL3Structure',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'visitor' }
SDL3MappedEvent >> accept: aVisitor [

	^ aVisitor visitMappedEvent: self
]
