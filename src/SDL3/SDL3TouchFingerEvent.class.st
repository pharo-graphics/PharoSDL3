Class {
	#name : 'SDL3TouchFingerEvent',
	#superclass : 'SDL3WindowIDEvent',
	#classVars : [
		'OFFSET_DX',
		'OFFSET_DY',
		'OFFSET_FINGERID',
		'OFFSET_PRESSURE',
		'OFFSET_RESERVED',
		'OFFSET_TIMESTAMP',
		'OFFSET_TOUCHID',
		'OFFSET_TYPE',
		'OFFSET_WINDOWID',
		'OFFSET_X',
		'OFFSET_Y'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3TouchFingerEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp;
	SDL_TouchID touchID;
	SDL_FingerID fingerID;
	float x;
	float y;
	float dx;
	float dy;
	float pressure;
	SDL_WindowID windowID
	)
]

{ #category : 'accessing - structure variables' }
SDL3TouchFingerEvent >> dx [
	"This method was automatically generated"
	^handle floatAt: OFFSET_DX
]

{ #category : 'accessing - structure variables' }
SDL3TouchFingerEvent >> dy [
	"This method was automatically generated"
	^handle floatAt: OFFSET_DY
]

{ #category : 'accessing - structure variables' }
SDL3TouchFingerEvent >> fingerID [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_FINGERID
]

{ #category : 'accessing - structure variables' }
SDL3TouchFingerEvent >> pressure [
	"This method was automatically generated"
	^handle floatAt: OFFSET_PRESSURE
]

{ #category : 'accessing - structure variables' }
SDL3TouchFingerEvent >> reserved [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
SDL3TouchFingerEvent >> timestamp [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3TouchFingerEvent >> touchID [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_TOUCHID
]

{ #category : 'accessing - structure variables' }
SDL3TouchFingerEvent >> windowID [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WINDOWID
]

{ #category : 'accessing - structure variables' }
SDL3TouchFingerEvent >> x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
SDL3TouchFingerEvent >> y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]
