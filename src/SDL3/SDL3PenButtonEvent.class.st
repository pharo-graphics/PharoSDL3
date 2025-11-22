Class {
	#name : 'SDL3PenButtonEvent',
	#superclass : 'SDL3WindowIDEvent',
	#classVars : [
		'OFFSET_BUTTON',
		'OFFSET_DOWN',
		'OFFSET_PEN_STATE',
		'OFFSET_RESERVED',
		'OFFSET_TIMESTAMP',
		'OFFSET_TYPE',
		'OFFSET_WHICH',
		'OFFSET_WINDOWID',
		'OFFSET_X',
		'OFFSET_Y'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3PenButtonEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp;
	SDL_WindowID windowID;
	SDL_PenID which;
	SDL_PenInputFlags pen_state;
	float x;
	float y;
	Uint8 button;
	bool down
	)
]

{ #category : 'accessing - structure variables' }
SDL3PenButtonEvent >> button [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_BUTTON
]

{ #category : 'accessing - structure variables' }
SDL3PenButtonEvent >> button: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_BUTTON put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3PenButtonEvent >> down [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_DOWN
]

{ #category : 'accessing - structure variables' }
SDL3PenButtonEvent >> down: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_DOWN put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3PenButtonEvent >> penState [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_PEN_STATE
]

{ #category : 'accessing - structure variables' }
SDL3PenButtonEvent >> penState: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_PEN_STATE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3PenButtonEvent >> reserved [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
SDL3PenButtonEvent >> reserved: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_RESERVED put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3PenButtonEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3PenButtonEvent >> timestamp: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_TIMESTAMP put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3PenButtonEvent >> type [
	"This method was automatically generated"
	^SDL3EventType fromInteger: (handle unsignedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
SDL3PenButtonEvent >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3PenButtonEvent >> which [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WHICH
]

{ #category : 'accessing - structure variables' }
SDL3PenButtonEvent >> which: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_WHICH put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3PenButtonEvent >> windowID [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WINDOWID
]

{ #category : 'accessing - structure variables' }
SDL3PenButtonEvent >> windowID: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_WINDOWID put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3PenButtonEvent >> x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
SDL3PenButtonEvent >> x: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3PenButtonEvent >> y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
SDL3PenButtonEvent >> y: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Y put: anObject
]
