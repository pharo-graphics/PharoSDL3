Class {
	#name : 'SDL3PinchFingerEvent',
	#superclass : 'SDL3WindowIDEvent',
	#classVars : [
		'OFFSET_RESERVED',
		'OFFSET_SCALE',
		'OFFSET_TIMESTAMP',
		'OFFSET_TYPE',
		'OFFSET_WINDOWID'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3PinchFingerEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp;
	float scale;
	SDL_WindowID windowID
	)
]

{ #category : 'accessing - structure variables' }
SDL3PinchFingerEvent >> reserved [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
SDL3PinchFingerEvent >> scale [
	"This method was automatically generated"
	^handle floatAt: OFFSET_SCALE
]

{ #category : 'accessing - structure variables' }
SDL3PinchFingerEvent >> timestamp [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3PinchFingerEvent >> windowID [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WINDOWID
]
