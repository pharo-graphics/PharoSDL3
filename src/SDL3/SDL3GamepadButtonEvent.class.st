Class {
	#name : 'SDL3GamepadButtonEvent',
	#superclass : 'SDL3MappedEvent',
	#classVars : [
		'OFFSET_BUTTON',
		'OFFSET_DOWN',
		'OFFSET_PADDING1',
		'OFFSET_PADDING2',
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
SDL3GamepadButtonEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp;
	SDL_JoystickID which;
	Uint8 button;
	bool down;
	Uint8 padding1;
	Uint8 padding2
	)
]

{ #category : 'accessing - structure variables' }
SDL3GamepadButtonEvent >> button [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_BUTTON
]

{ #category : 'accessing - structure variables' }
SDL3GamepadButtonEvent >> down [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_DOWN
]

{ #category : 'accessing - structure variables' }
SDL3GamepadButtonEvent >> padding1 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING1
]

{ #category : 'accessing - structure variables' }
SDL3GamepadButtonEvent >> padding2 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING2
]

{ #category : 'accessing - structure variables' }
SDL3GamepadButtonEvent >> reserved [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
SDL3GamepadButtonEvent >> timestamp [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3GamepadButtonEvent >> which [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WHICH
]
