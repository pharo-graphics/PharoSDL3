Class {
	#name : 'SDL3PenTouchEvent',
	#superclass : 'SDL3PenEvent',
	#classVars : [
		'OFFSET_DOWN',
		'OFFSET_ERASER',
		'OFFSET_PEN_STATE',
		'OFFSET_RESERVED',
		'OFFSET_TIMESTAMP',
		'OFFSET_TYPE',
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
SDL3PenTouchEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp;
	SDL_WindowID windowID;
	SDL_PenID which;
	SDL_PenInputFlags pen_state;
	float x;
	float y;
	bool eraser;
	bool down
	)
]

{ #category : 'visitor' }
SDL3PenTouchEvent >> accept: aVisitor [

	^ aVisitor visitPenTouchEvent: self
]

{ #category : 'accessing - structure variables' }
SDL3PenTouchEvent >> down [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_DOWN
]

{ #category : 'accessing - structure variables' }
SDL3PenTouchEvent >> eraser [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_ERASER
]

{ #category : 'accessing - structure variables' }
SDL3PenTouchEvent >> penState [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_PEN_STATE
]

{ #category : 'accessing - structure variables' }
SDL3PenTouchEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3PenTouchEvent >> which [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WHICH
]

{ #category : 'accessing - structure variables' }
SDL3PenTouchEvent >> windowID [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WINDOWID
]

{ #category : 'accessing - structure variables' }
SDL3PenTouchEvent >> x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
SDL3PenTouchEvent >> y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]
