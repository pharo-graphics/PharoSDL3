Extension { #name : 'SDL3MappedEvent' }

{ #category : '*SDL3-Own' }
SDL3MappedEvent class >> eventTypeSelectors [
	"Answer the `SDL3EventType` selectors associated to this event"

	^ #()
]

{ #category : '*SDL3-Own' }
SDL3MappedEvent class >> eventTypes [
	"Answer the `SDL3EventType`s that are associated to this event"

	^ self eventTypeSelectors collect: [ :each | SDL3EventType perform: each ]
]

{ #category : '*SDL3-Own' }
SDL3MappedEvent >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: ' time: ';
		print: self timestamp
]

{ #category : '*SDL3-Own' }
SDL3MappedEvent >> timestamp [

	^ self subclassResponsibility
]

{ #category : '*SDL3-Own' }
SDL3MappedEvent >> type [

	^ SDL3EventType fromInteger: self typeNumber
]

{ #category : '*SDL3-Own' }
SDL3MappedEvent >> typeName [
	"Answer a String that denotes my type. This is decoded from the first structure field."

	^ SDL3EventType itemAt: self typeNumber ifAbsent: [ '<Unknown event type>' ].
]

{ #category : '*SDL3-Own' }
SDL3MappedEvent >> typeNumber [
	"Answer the number that identifies my type. We know this is the first structure field."

	^ handle unsignedLongAt: 1
]
