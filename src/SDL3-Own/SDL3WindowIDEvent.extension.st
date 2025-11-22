Extension { #name : 'SDL3WindowIDEvent' }

{ #category : '*SDL3-Own' }
SDL3WindowIDEvent >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: ' windowID: ';
		print: self windowID
]

{ #category : '*SDL3-Own' }
SDL3WindowIDEvent >> windowID [
	^ self subclassResponsibility
]
