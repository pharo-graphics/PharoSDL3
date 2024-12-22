Class {
	#name : 'S3SDL_MouseButtonEvent',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_BUTTON',
		'OFFSET_CLICKS',
		'OFFSET_DOWN',
		'OFFSET_PADDING',
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
S3SDL_MouseButtonEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	int reserved;
	int timestamp;
	int windowID;
	int which;
	int button;
	int down;
	int clicks;
	int padding;
	float x;
	float y
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseButtonEvent >> button [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_BUTTON
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseButtonEvent >> button: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_BUTTON put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseButtonEvent >> clicks [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_CLICKS
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseButtonEvent >> clicks: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_CLICKS put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseButtonEvent >> down [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_DOWN
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseButtonEvent >> down: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_DOWN put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseButtonEvent >> padding [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_PADDING
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseButtonEvent >> padding: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_PADDING put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseButtonEvent >> reserved [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseButtonEvent >> reserved: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_RESERVED put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseButtonEvent >> timestamp [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseButtonEvent >> timestamp: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TIMESTAMP put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseButtonEvent >> type [
	"This method was automatically generated"
	^S3SDL_EventType fromInteger: (handle unsignedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseButtonEvent >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseButtonEvent >> which [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_WHICH
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseButtonEvent >> which: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_WHICH put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseButtonEvent >> windowID [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_WINDOWID
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseButtonEvent >> windowID: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_WINDOWID put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseButtonEvent >> x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseButtonEvent >> x: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseButtonEvent >> y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
S3SDL_MouseButtonEvent >> y: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Y put: anObject
]
