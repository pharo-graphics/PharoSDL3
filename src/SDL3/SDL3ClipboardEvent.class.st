Class {
	#name : 'SDL3ClipboardEvent',
	#superclass : 'SDL3MappedEvent',
	#classVars : [
		'OFFSET_MIME_TYPES',
		'OFFSET_NUM_MIME_TYPES',
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
SDL3ClipboardEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp;
	bool owner;
	Sint32 num_mime_types;
	char** mime_types
	)
]

{ #category : 'accessing - structure variables' }
SDL3ClipboardEvent >> mimeTypes [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_MIME_TYPES) type: ExternalType char asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3ClipboardEvent >> mimeTypes: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_MIME_TYPES put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3ClipboardEvent >> numMimeTypes [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NUM_MIME_TYPES
]

{ #category : 'accessing - structure variables' }
SDL3ClipboardEvent >> numMimeTypes: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NUM_MIME_TYPES put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3ClipboardEvent >> owner [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_OWNER
]

{ #category : 'accessing - structure variables' }
SDL3ClipboardEvent >> owner: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_OWNER put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3ClipboardEvent >> reserved [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
SDL3ClipboardEvent >> reserved: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_RESERVED put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3ClipboardEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3ClipboardEvent >> timestamp: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_TIMESTAMP put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3ClipboardEvent >> type [
	"This method was automatically generated"
	^SDL3EventType fromInteger: (handle unsignedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
SDL3ClipboardEvent >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject value
]
