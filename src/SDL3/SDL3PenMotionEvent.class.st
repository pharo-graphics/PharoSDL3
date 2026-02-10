Class {
	#name : 'SDL3PenMotionEvent',
	#superclass : 'SDL3PenEvent',
	#classVars : [
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
SDL3PenMotionEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp;
	SDL_WindowID windowID;
	SDL_PenID which;
	SDL_PenInputFlags pen_state;
	float x;
	float y
	)
]

{ #category : 'visitor' }
SDL3PenMotionEvent >> accept: aVisitor [

	^ aVisitor visitPenMotionEvent: self
]

{ #category : 'accessing - structure variables' }
SDL3PenMotionEvent >> penState [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_PEN_STATE
]

{ #category : 'accessing - structure variables' }
SDL3PenMotionEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3PenMotionEvent >> which [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WHICH
]

{ #category : 'accessing - structure variables' }
SDL3PenMotionEvent >> windowID [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WINDOWID
]

{ #category : 'accessing - structure variables' }
SDL3PenMotionEvent >> x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
SDL3PenMotionEvent >> y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]
