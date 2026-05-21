Extension { #name : 'SDL3CameraSpec' }

{ #category : '*SDL3-Own' }
SDL3CameraSpec >> extent [

	^ self width @ self height
]

{ #category : '*SDL3-Own' }
SDL3CameraSpec >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: '(extent: ';
		print: self extent.
"	aStream
		nextPutAll: ' format: ';
		print: self format."
	aStream
		nextPutAll: ' colorspace: ';
		print: self colorspace.
	aStream
		nextPutAll: ' framerate: ';
		print: self framerateNumerator;
		nextPutAll: '/';
		print: self framerateDenominator;
		nextPut: $)
]
