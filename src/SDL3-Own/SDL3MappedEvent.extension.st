Extension { #name : 'SDL3MappedEvent' }

{ #category : '*SDL3-Own' }
SDL3MappedEvent >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: ' time: ';
		print: self timestamp;
		nextPutAll: ' type: ';
		nextPutAll: self type item
]

{ #category : '*SDL3-Own' }
SDL3MappedEvent >> timestamp [

	^ self subclassResponsibility
]

{ #category : '*SDL3-Own' }
SDL3MappedEvent >> type [

	^ self subclassResponsibility
]
