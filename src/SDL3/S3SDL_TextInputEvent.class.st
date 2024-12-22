Class {
	#name : 'S3SDL_TextInputEvent',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_RESERVED',
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
S3SDL_TextInputEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	int reserved;
	int timestamp;
	int windowID;
	char* text
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_TextInputEvent >> reserved [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
S3SDL_TextInputEvent >> reserved: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_RESERVED put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_TextInputEvent >> text [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_TEXT) type: ExternalType char asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_TextInputEvent >> text: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_TEXT put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
S3SDL_TextInputEvent >> timestamp [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
S3SDL_TextInputEvent >> timestamp: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TIMESTAMP put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_TextInputEvent >> type [
	"This method was automatically generated"
	^S3SDL_EventType fromInteger: (handle unsignedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
S3SDL_TextInputEvent >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_TextInputEvent >> windowID [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_WINDOWID
]

{ #category : 'accessing - structure variables' }
S3SDL_TextInputEvent >> windowID: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_WINDOWID put: anObject
]
