Class {
	#name : 'SDL3WindowIDEvent',
	#superclass : 'SDL3MappedEvent',
	#category : 'SDL3-Own',
	#package : 'SDL3',
	#tag : 'Own'
}

{ #category : 'visitor' }
SDL3WindowIDEvent >> accept: aVisitor [

	^ aVisitor visitWindowIDEvent: self
]
