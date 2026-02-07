Class {
	#name : 'SDL3DropEvent',
	#superclass : 'SDL3WindowIDEvent',
	#classVars : [
		'OFFSET_DATA',
		'OFFSET_RESERVED',
		'OFFSET_SOURCE',
		'OFFSET_TIMESTAMP',
		'OFFSET_TYPE',
		'OFFSET_WINDOWID',
		'OFFSET_X',
		'OFFSET_Y'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3DropEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp;
	SDL_WindowID windowID;
	float x;
	float y;
	char* source;
	char* data
	)
]

{ #category : 'visitor' }
SDL3DropEvent >> accept: aVisitor [

	^ aVisitor visitDropEvent: self
]

{ #category : 'accessing - structure variables' }
SDL3DropEvent >> data [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_DATA) type: ExternalType char asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3DropEvent >> source [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_SOURCE) type: ExternalType char asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3DropEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3DropEvent >> windowID [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WINDOWID
]

{ #category : 'accessing - structure variables' }
SDL3DropEvent >> x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
SDL3DropEvent >> y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]
