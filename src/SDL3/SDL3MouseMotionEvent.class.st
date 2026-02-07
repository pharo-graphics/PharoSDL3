Class {
	#name : 'SDL3MouseMotionEvent',
	#superclass : 'SDL3MouseEvent',
	#classVars : [
		'OFFSET_RESERVED',
		'OFFSET_STATE',
		'OFFSET_TIMESTAMP',
		'OFFSET_TYPE',
		'OFFSET_WHICH',
		'OFFSET_WINDOWID',
		'OFFSET_X',
		'OFFSET_XREL',
		'OFFSET_Y',
		'OFFSET_YREL'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3MouseMotionEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp;
	SDL_WindowID windowID;
	SDL_MouseID which;
	SDL_MouseButtonFlags state;
	float x;
	float y;
	float xrel;
	float yrel
	)
]

{ #category : 'accessing - structure variables' }
SDL3MouseMotionEvent >> state [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_STATE
]

{ #category : 'accessing - structure variables' }
SDL3MouseMotionEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3MouseMotionEvent >> which [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WHICH
]

{ #category : 'accessing - structure variables' }
SDL3MouseMotionEvent >> windowID [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WINDOWID
]

{ #category : 'accessing - structure variables' }
SDL3MouseMotionEvent >> x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
SDL3MouseMotionEvent >> xrel [
	"This method was automatically generated"
	^handle floatAt: OFFSET_XREL
]

{ #category : 'accessing - structure variables' }
SDL3MouseMotionEvent >> y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
SDL3MouseMotionEvent >> yrel [
	"This method was automatically generated"
	^handle floatAt: OFFSET_YREL
]
