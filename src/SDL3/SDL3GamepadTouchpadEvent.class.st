Class {
	#name : 'SDL3GamepadTouchpadEvent',
	#superclass : 'SDL3MappedEvent',
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
SDL3GamepadTouchpadEvent class >> fieldsDesc [

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
SDL3GamepadTouchpadEvent >> finger [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_FINGER
]

{ #category : 'accessing - structure variables' }
SDL3GamepadTouchpadEvent >> pressure [
	"This method was automatically generated"
	^handle floatAt: OFFSET_PRESSURE
]

{ #category : 'accessing - structure variables' }
SDL3GamepadTouchpadEvent >> reserved [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
SDL3GamepadTouchpadEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3GamepadTouchpadEvent >> touchpad [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_TOUCHPAD
]

{ #category : 'accessing - structure variables' }
SDL3GamepadTouchpadEvent >> which [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WHICH
]

{ #category : 'accessing - structure variables' }
SDL3GamepadTouchpadEvent >> x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
SDL3GamepadTouchpadEvent >> y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]
