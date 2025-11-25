Extension { #name : 'SDL3TextEditingEvent' }

{ #category : '*SDL3-Own' }
SDL3TextEditingEvent class >> eventTypeSelectors [

	^ #(#textEditing)
]

{ #category : '*SDL3-Own' }
SDL3TextEditingEvent >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: ' text: ';
		print: self text bytesFromCString utf8Decoded.
	aStream
		nextPutAll: ' start: ';
		print: self start.
	aStream
		nextPutAll: ' length: ';
		print: self length
]
