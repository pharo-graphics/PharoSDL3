Class {
	#name : 'S3SDL_TouchFingerEvent',
	#superclass : 'S3Structure',
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
S3SDL_TouchFingerEvent class >> fieldsDesc [

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
S3SDL_TouchFingerEvent >> dx [
	"This method was automatically generated"
	^handle floatAt: OFFSET_DX
]

{ #category : 'accessing - structure variables' }
S3SDL_TouchFingerEvent >> dx: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_DX put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_TouchFingerEvent >> dy [
	"This method was automatically generated"
	^handle floatAt: OFFSET_DY
]

{ #category : 'accessing - structure variables' }
S3SDL_TouchFingerEvent >> dy: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_DY put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_TouchFingerEvent >> fingerID [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_FINGERID
]

{ #category : 'accessing - structure variables' }
S3SDL_TouchFingerEvent >> fingerID: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_FINGERID put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_TouchFingerEvent >> pressure [
	"This method was automatically generated"
	^handle floatAt: OFFSET_PRESSURE
]

{ #category : 'accessing - structure variables' }
S3SDL_TouchFingerEvent >> pressure: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_PRESSURE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_TouchFingerEvent >> reserved [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
S3SDL_TouchFingerEvent >> reserved: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_RESERVED put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_TouchFingerEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
S3SDL_TouchFingerEvent >> timestamp: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_TIMESTAMP put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_TouchFingerEvent >> touchID [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TOUCHID
]

{ #category : 'accessing - structure variables' }
S3SDL_TouchFingerEvent >> touchID: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_TOUCHID put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_TouchFingerEvent >> type [
	"This method was automatically generated"
	^S3SDL_EventType fromInteger: (handle unsignedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
S3SDL_TouchFingerEvent >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_TouchFingerEvent >> windowID [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WINDOWID
]

{ #category : 'accessing - structure variables' }
S3SDL_TouchFingerEvent >> windowID: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_WINDOWID put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_TouchFingerEvent >> x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
S3SDL_TouchFingerEvent >> x: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_TouchFingerEvent >> y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
S3SDL_TouchFingerEvent >> y: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Y put: anObject
]
