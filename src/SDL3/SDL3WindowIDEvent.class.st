Class {
	#name : 'SDL3WindowIDEvent',
	#superclass : 'SDL3MappedEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'visitor' }
SDL3WindowIDEvent >> accept: aVisitor [

	^ aVisitor visitWindowIDEvent: self
]
