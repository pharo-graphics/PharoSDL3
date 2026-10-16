Extension { #name : 'SDL3AudioSpec' }

{ #category : '*SDL3-Additions' }
SDL3AudioSpec >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: '(freq: ';
		print: self freq.
	aStream
		nextPutAll: ' channels: ';
		print: self channels.
	aStream
		nextPutAll: ' format: ';
		print: self format item;
		nextPut: $)
]
