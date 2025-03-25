Class {
	#name : 'S3SDL_GamepadTouchpadEvent',
	#superclass : 'S3SDLMappedEvent',
	#classVars : [
		'OFFSET_FINGER',
		'OFFSET_PRESSURE',
		'OFFSET_RESERVED',
		'OFFSET_TIMESTAMP',
		'OFFSET_TOUCHPAD',
		'OFFSET_TYPE',
		'OFFSET_WHICH',
		'OFFSET_X',
		'OFFSET_Y'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_GamepadTouchpadEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp;
	SDL_JoystickID which;
	Sint32 touchpad;
	Sint32 finger;
	float x;
	float y;
	float pressure
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_GamepadTouchpadEvent >> finger [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_FINGER
]

{ #category : 'accessing - structure variables' }
S3SDL_GamepadTouchpadEvent >> finger: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_FINGER put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GamepadTouchpadEvent >> pressure [
	"This method was automatically generated"
	^handle floatAt: OFFSET_PRESSURE
]

{ #category : 'accessing - structure variables' }
S3SDL_GamepadTouchpadEvent >> pressure: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_PRESSURE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GamepadTouchpadEvent >> reserved [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
S3SDL_GamepadTouchpadEvent >> reserved: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_RESERVED put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GamepadTouchpadEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
S3SDL_GamepadTouchpadEvent >> timestamp: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_TIMESTAMP put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GamepadTouchpadEvent >> touchpad [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_TOUCHPAD
]

{ #category : 'accessing - structure variables' }
S3SDL_GamepadTouchpadEvent >> touchpad: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TOUCHPAD put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GamepadTouchpadEvent >> type [
	"This method was automatically generated"
	^S3SDL_EventType fromInteger: (handle unsignedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
S3SDL_GamepadTouchpadEvent >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_GamepadTouchpadEvent >> which [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WHICH
]

{ #category : 'accessing - structure variables' }
S3SDL_GamepadTouchpadEvent >> which: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_WHICH put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GamepadTouchpadEvent >> x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
S3SDL_GamepadTouchpadEvent >> x: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GamepadTouchpadEvent >> y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
S3SDL_GamepadTouchpadEvent >> y: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Y put: anObject
]
