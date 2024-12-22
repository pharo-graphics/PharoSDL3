Class {
	#name : 'S3SDL_JoyDeviceEvent',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_RESERVED',
		'OFFSET_TIMESTAMP',
		'OFFSET_TYPE',
		'OFFSET_WHICH'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_JoyDeviceEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	int reserved;
	int timestamp;
	int which
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyDeviceEvent >> reserved [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyDeviceEvent >> reserved: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_RESERVED put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyDeviceEvent >> timestamp [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyDeviceEvent >> timestamp: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TIMESTAMP put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyDeviceEvent >> type [
	"This method was automatically generated"
	^S3SDL_EventType fromInteger: (handle unsignedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyDeviceEvent >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyDeviceEvent >> which [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_WHICH
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyDeviceEvent >> which: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_WHICH put: anObject
]
