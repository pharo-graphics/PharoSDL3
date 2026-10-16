Extension { #name : 'SDL3TextInputEvent' }

{ #category : '*SDL3-Additions' }
SDL3TextInputEvent >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: ' text: ';
		print: self text bytesFromCString utf8Decoded
]
