Class {
	#name : 'S3SDL_MouseWheelEvent',
	#superclass : 'S3SDLMappedEvent',
	#classVars : [
		'OFFSET_DIRECTION',
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
S3SDL_MouseWheelEvent class >> fieldsDesc [

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
	float mouse_y
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseWheelEvent >> direction [
	"This method was automatically generated"
	^S3SDL_MouseWheelDirection fromInteger: (handle unsignedLongAt: OFFSET_DIRECTION)
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseWheelEvent >> direction: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_DIRECTION put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseWheelEvent >> mouse_x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_MOUSE_X
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseWheelEvent >> mouse_x: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_MOUSE_X put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseWheelEvent >> mouse_y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_MOUSE_Y
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseWheelEvent >> mouse_y: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_MOUSE_Y put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseWheelEvent >> reserved [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseWheelEvent >> reserved: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_RESERVED put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseWheelEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseWheelEvent >> timestamp: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_TIMESTAMP put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseWheelEvent >> type [
	"This method was automatically generated"
	^S3SDL_EventType fromInteger: (handle unsignedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseWheelEvent >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseWheelEvent >> which [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WHICH
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseWheelEvent >> which: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_WHICH put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseWheelEvent >> windowID [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WINDOWID
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseWheelEvent >> windowID: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_WINDOWID put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseWheelEvent >> x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseWheelEvent >> x: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseWheelEvent >> y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseWheelEvent >> y: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Y put: anObject
]
