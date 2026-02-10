Class {
	#name : 'SDL3PenAxisEvent',
	#superclass : 'SDL3PenEvent',
	#classVars : [
		'OFFSET_AXIS',
		'OFFSET_PEN_STATE',
		'OFFSET_RESERVED',
		'OFFSET_TIMESTAMP',
		'OFFSET_TYPE',
		'OFFSET_VALUE',
		'OFFSET_WHICH',
		'OFFSET_WINDOWID',
		'OFFSET_X',
		'OFFSET_Y'
	],
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'field definition' }
SDL3PenAxisEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp;
	SDL_WindowID windowID;
	SDL_PenID which;
	SDL_PenInputFlags pen_state;
	float x;
	float y;
	SDL_PenAxis axis;
	float value
	)
]

{ #category : 'visitor' }
SDL3PenAxisEvent >> accept: aVisitor [

	^ aVisitor visitPenAxisEvent: self
]

{ #category : 'accessing - structure variables' }
SDL3PenAxisEvent >> axis [
	"This method was automatically generated"
	^SDL3PenAxis fromInteger: (handle unsignedLongAt: OFFSET_AXIS)
]

{ #category : 'accessing - structure variables' }
SDL3PenAxisEvent >> penState [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_PEN_STATE
]

{ #category : 'accessing - structure variables' }
SDL3PenAxisEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3PenAxisEvent >> value [
	"This method was automatically generated"
	^handle floatAt: OFFSET_VALUE
]

{ #category : 'accessing - structure variables' }
SDL3PenAxisEvent >> which [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WHICH
]

{ #category : 'accessing - structure variables' }
SDL3PenAxisEvent >> windowID [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WINDOWID
]

{ #category : 'accessing - structure variables' }
SDL3PenAxisEvent >> x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
SDL3PenAxisEvent >> y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]
