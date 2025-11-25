Extension { #name : 'SDL3KeyboardEvent' }

{ #category : '*SDL3-Own' }
SDL3KeyboardEvent class >> eventTypeSelectors [

	^ #(#keyUp #keyDown)
]

{ #category : '*SDL3-Own' }
SDL3KeyboardEvent >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: ' scancode: ';
		print: self scancode item
]
