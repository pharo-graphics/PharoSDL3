Extension { #name : 'SDL3CommonEvent' }

{ #category : '*SDL3-Additions' }
SDL3CommonEvent >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: ' type: ';
		nextPutAll: self typeName;
		nextPutAll: ' time: ';
		print: self timestamp
]
