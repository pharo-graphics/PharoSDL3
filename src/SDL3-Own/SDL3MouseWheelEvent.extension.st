Extension { #name : 'SDL3MouseWheelEvent' }

{ #category : '*SDL3-Own' }
SDL3MouseWheelEvent >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: ' mouseX: ';
		nextPutAll: (self mouseX printShowingDecimalPlaces: 2).
	aStream
		nextPutAll: ' mouseY: ';
		nextPutAll: (self mouseY printShowingDecimalPlaces: 2).
	aStream
		nextPutAll: ' integerX: ';
		nextPutAll: (self integerX printShowingDecimalPlaces: 2).
	aStream
		nextPutAll: ' integerY: ';
		nextPutAll: (self integerY printShowingDecimalPlaces: 2).
	aStream
		nextPutAll: ' direction: ';
		nextPutAll: self direction item
]
