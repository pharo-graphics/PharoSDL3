Class {
	#name : 'SDL3JoyDeviceEvent',
	#superclass : 'SDL3DeviceEvent',
	#classVars : [
		'OFFSET_RESERVED',
		'OFFSET_TIMESTAMP',
		'OFFSET_TYPE',
		'OFFSET_WHICH'
	],
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'field definition' }
SDL3JoyDeviceEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp;
	SDL_JoystickID which
	)
]

{ #category : 'visitor' }
SDL3JoyDeviceEvent >> accept: aVisitor [

	^ aVisitor visitJoyDeviceEvent: self
]

{ #category : 'accessing - structure variables' }
SDL3JoyDeviceEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3JoyDeviceEvent >> which [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WHICH
]
