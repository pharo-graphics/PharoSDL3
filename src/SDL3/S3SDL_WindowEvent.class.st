Class {
	#name : 'S3SDL_WindowEvent',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_DATA1',
		'OFFSET_DATA2',
		'OFFSET_RESERVED',
		'OFFSET_TIMESTAMP',
		'OFFSET_TYPE',
		'OFFSET_WINDOWID'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_WindowEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp;
	SDL_WindowID windowID;
	Sint32 data1;
	Sint32 data2
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_WindowEvent >> data1 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_DATA1
]

{ #category : 'accessing - structure variables' }
S3SDL_WindowEvent >> data1: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_DATA1 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_WindowEvent >> data2 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_DATA2
]

{ #category : 'accessing - structure variables' }
S3SDL_WindowEvent >> data2: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_DATA2 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_WindowEvent >> reserved [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
S3SDL_WindowEvent >> reserved: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_RESERVED put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_WindowEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
S3SDL_WindowEvent >> timestamp: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_TIMESTAMP put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_WindowEvent >> type [
	"This method was automatically generated"
	^S3SDL_EventType fromInteger: (handle unsignedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
S3SDL_WindowEvent >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_WindowEvent >> windowID [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WINDOWID
]

{ #category : 'accessing - structure variables' }
S3SDL_WindowEvent >> windowID: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_WINDOWID put: anObject
]
