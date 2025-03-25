Class {
	#name : 'S3SDL_DisplayEvent',
	#superclass : 'S3SDLMappedEvent',
	#classVars : [
		'OFFSET_DATA1',
		'OFFSET_DATA2',
		'OFFSET_DISPLAYID',
		'OFFSET_RESERVED',
		'OFFSET_TIMESTAMP',
		'OFFSET_TYPE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_DisplayEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp;
	SDL_DisplayID displayID;
	Sint32 data1;
	Sint32 data2
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_DisplayEvent >> data1 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_DATA1
]

{ #category : 'accessing - structure variables' }
S3SDL_DisplayEvent >> data1: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_DATA1 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_DisplayEvent >> data2 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_DATA2
]

{ #category : 'accessing - structure variables' }
S3SDL_DisplayEvent >> data2: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_DATA2 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_DisplayEvent >> displayID [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_DISPLAYID
]

{ #category : 'accessing - structure variables' }
S3SDL_DisplayEvent >> displayID: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_DISPLAYID put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_DisplayEvent >> reserved [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
S3SDL_DisplayEvent >> reserved: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_RESERVED put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_DisplayEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
S3SDL_DisplayEvent >> timestamp: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_TIMESTAMP put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_DisplayEvent >> type [
	"This method was automatically generated"
	^S3SDL_EventType fromInteger: (handle unsignedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
S3SDL_DisplayEvent >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject value
]
