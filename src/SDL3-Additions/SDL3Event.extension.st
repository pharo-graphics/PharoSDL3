Extension { #name : 'SDL3Event' }

{ #category : '*SDL3-Additions' }
SDL3Event >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: ' type: ';
		print: self type;
		nextPutAll: ' timestamp: ';
		print: self common timestamp
]
