Class {
	#name : 'SDL3MouseEvent',
	#superclass : 'SDL3WindowIDEvent',
	#category : 'SDL3-Own',
	#package : 'SDL3',
	#tag : 'Own'
}

{ #category : 'visitor' }
SDL3MouseEvent >> accept: aVisitor [

	^ aVisitor visitMouseEvent: self
]
