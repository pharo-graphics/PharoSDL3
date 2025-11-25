Extension { #name : 'SDL3MouseWheelEvent' }

{ #category : '*SDL3-Own' }
SDL3MouseWheelEvent class >> eventTypeSelectors [

	^ #(#mouseWheel)
]

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
		nextPutAll: ' direction: ';
		nextPutAll: self direction item
]
