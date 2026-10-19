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

{ #category : 'accessing' }
SDL3MouseEvent >> position [
	^ self x @ self y
]

{ #category : 'printing' }
SDL3MouseEvent >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: ' x: ';
		nextPutAll: (self x printShowingDecimalPlaces: 2).
	aStream
		nextPutAll: ' y: ';
		nextPutAll: (self y printShowingDecimalPlaces: 2).
	aStream
		nextPutAll: ' which: ';
		print: self which
]

{ #category : 'accessing - structure variables' }
SDL3MouseEvent >> which [
	^ self subclassResponsibility
]

{ #category : 'accessing - structure variables' }
SDL3MouseEvent >> x [
	^ self subclassResponsibility
]

{ #category : 'accessing - structure variables' }
SDL3MouseEvent >> y [
	^ self subclassResponsibility
]
