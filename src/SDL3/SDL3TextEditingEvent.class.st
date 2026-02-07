Class {
	#name : 'SDL3TextEditingEvent',
	#superclass : 'SDL3TextEvent',
	#classVars : [
		'OFFSET_LENGTH',
		'OFFSET_RESERVED',
		'OFFSET_START',
		'OFFSET_TEXT',
		'OFFSET_TIMESTAMP',
		'OFFSET_TYPE',
		'OFFSET_WINDOWID'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3TextEditingEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp;
	SDL_WindowID windowID;
	char* text;
	Sint32 start;
	Sint32 length
	)
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingEvent >> length [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_LENGTH
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingEvent >> start [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_START
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingEvent >> text [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_TEXT) type: ExternalType char asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3TextEditingEvent >> windowID [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WINDOWID
]
