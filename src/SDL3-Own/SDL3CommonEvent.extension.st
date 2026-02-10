Extension { #name : 'SDL3CommonEvent' }

{ #category : '*SDL3-Own' }
SDL3CommonEvent >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: ' type: ';
		nextPutAll: self typeName;
		nextPutAll: ' time: ';
		print: self timestamp
]
