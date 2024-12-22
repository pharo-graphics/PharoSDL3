Class {
	#name : 'S3SDL_ClipboardEvent',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_MIME_TYPES',
		'OFFSET_N_MIME_TYPES',
		'OFFSET_OWNER',
		'OFFSET_RESERVED',
		'OFFSET_TIMESTAMP',
		'OFFSET_TYPE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_ClipboardEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	int reserved;
	int timestamp;
	int owner;
	int n_mime_types;
	char** mime_types
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_ClipboardEvent >> mime_types [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_MIME_TYPES) type: ExternalType char asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_ClipboardEvent >> mime_types: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_MIME_TYPES put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
S3SDL_ClipboardEvent >> n_mime_types [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_N_MIME_TYPES
]

{ #category : 'accessing - structure variables' }
S3SDL_ClipboardEvent >> n_mime_types: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_N_MIME_TYPES put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_ClipboardEvent >> owner [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_OWNER
]

{ #category : 'accessing - structure variables' }
S3SDL_ClipboardEvent >> owner: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_OWNER put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_ClipboardEvent >> reserved [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
S3SDL_ClipboardEvent >> reserved: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_RESERVED put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_ClipboardEvent >> timestamp [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
S3SDL_ClipboardEvent >> timestamp: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TIMESTAMP put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_ClipboardEvent >> type [
	"This method was automatically generated"
	^S3SDL_EventType fromInteger: (handle unsignedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
S3SDL_ClipboardEvent >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject value
]
