Class {
	#name : 'S3SDLMappedEvent',
	#superclass : 'S3Structure',
	#category : 'SDL3-Own',
	#package : 'SDL3',
	#tag : 'Own'
}

{ #category : 'printing' }
S3SDLMappedEvent >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: ' time: ';
		print: self timestamp;
		nextPutAll: ' type: ';
		print: self type item

]

{ #category : 'accessing - structure variables' }
S3SDLMappedEvent >> timestamp [

	^ self subclassResponsibility
]

{ #category : 'accessing - structure variables' }
S3SDLMappedEvent >> type [

	^ self subclassResponsibility
]
