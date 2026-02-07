"
My subclasses are related to text input.
"
Class {
	#name : 'SDL3TextEvent',
	#superclass : 'SDL3WindowIDEvent',
	#category : 'SDL3-Own',
	#package : 'SDL3',
	#tag : 'Own'
}

{ #category : 'visitor' }
SDL3TextEvent >> accept: aVisitor [

	^ aVisitor visitTextEvent: self
]
