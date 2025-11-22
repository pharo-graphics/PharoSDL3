Extension { #name : 'SDL3MouseEvent' }

{ #category : '*SDL3-Own' }
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

{ #category : '*SDL3-Own' }
SDL3MouseEvent >> which [
	^ self subclassResponsibility
]

{ #category : '*SDL3-Own' }
SDL3MouseEvent >> x [
	^ self subclassResponsibility
]

{ #category : '*SDL3-Own' }
SDL3MouseEvent >> y [
	^ self subclassResponsibility
]
