"
My subclasses are related to a pen device.
"
Class {
	#name : 'SDL3PenEvent',
	#superclass : 'SDL3WindowIDEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'visitor' }
SDL3PenEvent >> accept: aVisitor [

	^ aVisitor visitPenEvent: self
]
