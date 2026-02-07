Class {
	#name : 'SDL3JoyHatEvent',
	#superclass : 'SDL3JoystickEvent',
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
SDL3JoyHatEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp;
	SDL_JoystickID which;
	Uint8 hat;
	Uint8 value;
	Uint8 padding1;
	Uint8 padding2
	)
]

{ #category : 'accessing - structure variables' }
SDL3JoyHatEvent >> hat [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_HAT
]

{ #category : 'accessing - structure variables' }
SDL3JoyHatEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3JoyHatEvent >> value [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_VALUE
]

{ #category : 'accessing - structure variables' }
SDL3JoyHatEvent >> which [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WHICH
]
