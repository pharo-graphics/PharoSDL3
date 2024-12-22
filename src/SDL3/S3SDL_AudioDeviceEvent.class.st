Class {
	#name : 'S3SDL_AudioDeviceEvent',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_PADDING1',
		'OFFSET_PADDING2',
		'OFFSET_PADDING3',
		'OFFSET_RECORDING',
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
S3SDL_AudioDeviceEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	int reserved;
	int timestamp;
	int which;
	int recording;
	int padding1;
	int padding2;
	int padding3
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_AudioDeviceEvent >> padding1 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_PADDING1
]

{ #category : 'accessing - structure variables' }
S3SDL_AudioDeviceEvent >> padding1: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_PADDING1 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_AudioDeviceEvent >> padding2 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_PADDING2
]

{ #category : 'accessing - structure variables' }
S3SDL_AudioDeviceEvent >> padding2: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_PADDING2 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_AudioDeviceEvent >> padding3 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_PADDING3
]

{ #category : 'accessing - structure variables' }
S3SDL_AudioDeviceEvent >> padding3: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_PADDING3 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_AudioDeviceEvent >> recording [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_RECORDING
]

{ #category : 'accessing - structure variables' }
S3SDL_AudioDeviceEvent >> recording: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_RECORDING put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_AudioDeviceEvent >> reserved [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
S3SDL_AudioDeviceEvent >> reserved: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_RESERVED put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_AudioDeviceEvent >> timestamp [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
S3SDL_AudioDeviceEvent >> timestamp: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TIMESTAMP put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_AudioDeviceEvent >> type [
	"This method was automatically generated"
	^S3SDL_EventType fromInteger: (handle unsignedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
S3SDL_AudioDeviceEvent >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_AudioDeviceEvent >> which [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_WHICH
]

{ #category : 'accessing - structure variables' }
S3SDL_AudioDeviceEvent >> which: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_WHICH put: anObject
]
