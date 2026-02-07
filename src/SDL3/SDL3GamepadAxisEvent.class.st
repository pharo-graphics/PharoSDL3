Class {
	#name : 'SDL3GamepadAxisEvent',
	#superclass : 'SDL3GamepadEvent',
	#classVars : [
		'OFFSET_AXIS',
		'OFFSET_PADDING1',
		'OFFSET_PADDING2',
		'OFFSET_PADDING3',
		'OFFSET_PADDING4',
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
SDL3GamepadAxisEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp;
	SDL_JoystickID which;
	Uint8 axis;
	Uint8 padding1;
	Uint8 padding2;
	Uint8 padding3;
	Sint16 value;
	Uint16 padding4
	)
]

{ #category : 'accessing - structure variables' }
SDL3GamepadAxisEvent >> axis [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_AXIS
]

{ #category : 'accessing - structure variables' }
SDL3GamepadAxisEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3GamepadAxisEvent >> value [
	"This method was automatically generated"
	^handle signedShortAt: OFFSET_VALUE
]

{ #category : 'accessing - structure variables' }
SDL3GamepadAxisEvent >> which [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WHICH
]
