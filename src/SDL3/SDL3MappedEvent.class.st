Class {
	#name : 'SDL3MappedEvent',
	#superclass : 'S3Structure',
	#category : 'SDL3-Own',
	#package : 'SDL3',
	#tag : 'Own'
}

{ #category : 'printing' }
SDL3MappedEvent >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: ' time: ';
		print: self timestamp;
		nextPutAll: ' type: ';
		print: self type item

]

{ #category : 'accessing - structure variables' }
SDL3MappedEvent >> timestamp [

	^ self subclassResponsibility
]

{ #category : 'accessing - structure variables' }
SDL3MappedEvent >> type [

	^ self subclassResponsibility
]
