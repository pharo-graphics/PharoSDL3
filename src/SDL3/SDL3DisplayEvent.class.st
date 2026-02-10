Class {
	#name : 'SDL3DisplayEvent',
	#superclass : 'SDL3MappedEvent',
	#classVars : [
		'OFFSET_DATA1',
		'OFFSET_DATA2',
		'OFFSET_DISPLAYID',
		'OFFSET_RESERVED',
		'OFFSET_TIMESTAMP',
		'OFFSET_TYPE'
	],
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'field definition' }
SDL3DisplayEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp;
	SDL_DisplayID displayID;
	Sint32 data1;
	Sint32 data2
	)
]

{ #category : 'visitor' }
SDL3DisplayEvent >> accept: aVisitor [

	^ aVisitor visitDisplayEvent: self
]

{ #category : 'accessing - structure variables' }
SDL3DisplayEvent >> data1 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_DATA1
]

{ #category : 'accessing - structure variables' }
SDL3DisplayEvent >> data2 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_DATA2
]

{ #category : 'accessing - structure variables' }
SDL3DisplayEvent >> displayID [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_DISPLAYID
]

{ #category : 'accessing - structure variables' }
SDL3DisplayEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]
