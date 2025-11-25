Class {
	#name : 'SDL3MouseWheelEvent',
	#superclass : 'SDL3MouseEvent',
	#classVars : [
		'OFFSET_DIRECTION',
		'OFFSET_INTEGER_X',
		'OFFSET_INTEGER_Y',
		'OFFSET_MOUSE_X',
		'OFFSET_MOUSE_Y',
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
SDL3MouseWheelEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp;
	SDL_WindowID windowID;
	SDL_MouseID which;
	float x;
	float y;
	SDL_MouseWheelDirection direction;
	float mouse_x;
	float mouse_y;
	Sint32 integer_x;
	Sint32 integer_y
	)
]

{ #category : 'accessing - structure variables' }
SDL3MouseWheelEvent >> direction [
	"This method was automatically generated"
	^SDL3MouseWheelDirection fromInteger: (handle unsignedLongAt: OFFSET_DIRECTION)
]

{ #category : 'accessing - structure variables' }
SDL3MouseWheelEvent >> integerX [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_INTEGER_X
]

{ #category : 'accessing - structure variables' }
SDL3MouseWheelEvent >> integerY [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_INTEGER_Y
]

{ #category : 'accessing - structure variables' }
SDL3MouseWheelEvent >> mouseX [
	"This method was automatically generated"
	^handle floatAt: OFFSET_MOUSE_X
]

{ #category : 'accessing - structure variables' }
SDL3MouseWheelEvent >> mouseY [
	"This method was automatically generated"
	^handle floatAt: OFFSET_MOUSE_Y
]

{ #category : 'accessing - structure variables' }
SDL3MouseWheelEvent >> reserved [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
SDL3MouseWheelEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3MouseWheelEvent >> which [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WHICH
]

{ #category : 'accessing - structure variables' }
SDL3MouseWheelEvent >> windowID [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WINDOWID
]

{ #category : 'accessing - structure variables' }
SDL3MouseWheelEvent >> x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
SDL3MouseWheelEvent >> y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]
