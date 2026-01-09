Extension { #name : 'SDL3DisplayMode' }

{ #category : '*SDL3-Own' }
SDL3DisplayMode >> extent [

	^ self w @ self h
]

{ #category : '*SDL3-Own' }
SDL3DisplayMode >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPut: $(;
		print: self extent;
		space;
		print: self refreshRate;
		nextPutAll: 'hz ';
		print: self pixelDensity;
		nextPutAll: 'X)'
]
