Class {
	#name : 'SDL3MouseEvent',
	#superclass : 'SDL3WindowIDEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'visitor' }
SDL3MouseEvent >> accept: aVisitor [

	^ aVisitor visitMouseEvent: self
]
