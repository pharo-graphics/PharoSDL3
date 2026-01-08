Extension { #name : 'SDL3Event' }

{ #category : '*SDL3-Own' }
SDL3Event >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: ' type: ';
		print: self type;
		nextPutAll: ' timestamp: ';
		print: self common timestamp
]
