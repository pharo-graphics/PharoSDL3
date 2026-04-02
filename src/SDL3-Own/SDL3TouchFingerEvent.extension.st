Extension { #name : 'SDL3TouchFingerEvent' }

{ #category : '*SDL3-Own' }
SDL3TouchFingerEvent >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: ' touchID: ';
		print: self touchID.
	aStream
		nextPutAll: ' fingerID: ';
		print: self fingerID.
	aStream
		nextPutAll: ' x: ';
		nextPutAll: (self x printShowingDecimalPlaces: 2).
	aStream
		nextPutAll: ' y: ';
		nextPutAll: (self y printShowingDecimalPlaces: 2).
	aStream
		nextPutAll: ' pressure: ';
		nextPutAll: (self pressure printShowingDecimalPlaces: 2)
]
