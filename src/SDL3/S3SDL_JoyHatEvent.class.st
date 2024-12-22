Class {
	#name : 'S3SDL_JoyHatEvent',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_HAT',
		'OFFSET_PADDING1',
		'OFFSET_PADDING2',
		'OFFSET_RESERVED',
		'OFFSET_TIMESTAMP',
		'OFFSET_TYPE',
		'OFFSET_VALUE',
		'OFFSET_WHICH'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_JoyHatEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	int reserved;
	int timestamp;
	int which;
	int hat;
	int value;
	int padding1;
	int padding2
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyHatEvent >> hat [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_HAT
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyHatEvent >> hat: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_HAT put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyHatEvent >> padding1 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_PADDING1
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyHatEvent >> padding1: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_PADDING1 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyHatEvent >> padding2 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_PADDING2
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyHatEvent >> padding2: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_PADDING2 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyHatEvent >> reserved [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyHatEvent >> reserved: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_RESERVED put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyHatEvent >> timestamp [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyHatEvent >> timestamp: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TIMESTAMP put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyHatEvent >> type [
	"This method was automatically generated"
	^S3SDL_EventType fromInteger: (handle unsignedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyHatEvent >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyHatEvent >> value [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_VALUE
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyHatEvent >> value: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_VALUE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyHatEvent >> which [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_WHICH
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyHatEvent >> which: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_WHICH put: anObject
]
