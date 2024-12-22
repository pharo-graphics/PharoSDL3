Class {
	#name : 'S3SDL_JoyBatteryEvent',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_PERCENT',
		'OFFSET_RESERVED',
		'OFFSET_STATE',
		'OFFSET_TIMESTAMP',
		'OFFSET_TYPE',
		'OFFSET_WHICH'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_JoyBatteryEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	int reserved;
	int timestamp;
	int which;
	int state;
	int percent
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyBatteryEvent >> percent [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_PERCENT
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyBatteryEvent >> percent: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_PERCENT put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyBatteryEvent >> reserved [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyBatteryEvent >> reserved: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_RESERVED put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyBatteryEvent >> state [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_STATE
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyBatteryEvent >> state: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_STATE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyBatteryEvent >> timestamp [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyBatteryEvent >> timestamp: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TIMESTAMP put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyBatteryEvent >> type [
	"This method was automatically generated"
	^S3SDL_EventType fromInteger: (handle unsignedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyBatteryEvent >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyBatteryEvent >> which [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_WHICH
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyBatteryEvent >> which: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_WHICH put: anObject
]
