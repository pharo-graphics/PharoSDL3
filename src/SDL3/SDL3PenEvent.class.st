"
My subclasses are related to a pen device.
"
Class {
	#name : 'SDL3PenEvent',
	#superclass : 'SDL3WindowIDEvent',
	#category : 'SDL3-Own',
	#package : 'SDL3',
	#tag : 'Own'
}

{ #category : 'visitor' }
SDL3PenEvent >> accept: aVisitor [

	^ aVisitor visitPenEvent: self
]
