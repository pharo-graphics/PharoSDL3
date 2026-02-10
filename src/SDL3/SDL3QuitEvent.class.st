Class {
	#name : 'SDL3QuitEvent',
	#superclass : 'SDL3MappedEvent',
	#classVars : [
		'OFFSET_RESERVED',
		'OFFSET_TIMESTAMP',
		'OFFSET_TYPE'
	],
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'field definition' }
SDL3QuitEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp
	)
]

{ #category : 'visitor' }
SDL3QuitEvent >> accept: aVisitor [

	^ aVisitor visitQuitEvent: self
]

{ #category : 'accessing - structure variables' }
SDL3QuitEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]
