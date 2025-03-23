Class {
	#name : 'S3SDL_PenAxisEvent',
	#superclass : 'S3Structure',
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
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_PenAxisEvent class >> fieldsDesc [

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

{ #category : 'accessing - structure variables' }
S3SDL_PenAxisEvent >> axis [
	"This method was automatically generated"
	^S3SDL_PenAxis fromInteger: (handle unsignedLongAt: OFFSET_AXIS)
]

{ #category : 'accessing - structure variables' }
S3SDL_PenAxisEvent >> axis: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_AXIS put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_PenAxisEvent >> pen_state [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_PEN_STATE
]

{ #category : 'accessing - structure variables' }
S3SDL_PenAxisEvent >> pen_state: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_PEN_STATE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_PenAxisEvent >> reserved [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
S3SDL_PenAxisEvent >> reserved: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_RESERVED put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_PenAxisEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
S3SDL_PenAxisEvent >> timestamp: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_TIMESTAMP put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_PenAxisEvent >> type [
	"This method was automatically generated"
	^S3SDL_EventType fromInteger: (handle unsignedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
S3SDL_PenAxisEvent >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_PenAxisEvent >> value [
	"This method was automatically generated"
	^handle floatAt: OFFSET_VALUE
]

{ #category : 'accessing - structure variables' }
S3SDL_PenAxisEvent >> value: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_VALUE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_PenAxisEvent >> which [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WHICH
]

{ #category : 'accessing - structure variables' }
S3SDL_PenAxisEvent >> which: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_WHICH put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_PenAxisEvent >> windowID [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WINDOWID
]

{ #category : 'accessing - structure variables' }
S3SDL_PenAxisEvent >> windowID: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_WINDOWID put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_PenAxisEvent >> x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
S3SDL_PenAxisEvent >> x: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_PenAxisEvent >> y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
S3SDL_PenAxisEvent >> y: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Y put: anObject
]
