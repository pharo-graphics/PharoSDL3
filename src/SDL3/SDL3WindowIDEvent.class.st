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

{ #category : 'printing' }
SDL3WindowIDEvent >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: ' windowID: ';
		print: self windowID
]

{ #category : 'accessing' }
SDL3WindowIDEvent >> window [

	^ self ffiLibrary getWindowFromEvent: self
]
