Class {
	#name : 'S3SDL_JoyBallEvent',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_BALL',
		'OFFSET_PADDING1',
		'OFFSET_PADDING2',
		'OFFSET_PADDING3',
		'OFFSET_RESERVED',
		'OFFSET_TIMESTAMP',
		'OFFSET_TYPE',
		'OFFSET_WHICH',
		'OFFSET_XREL',
		'OFFSET_YREL'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_JoyBallEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	int reserved;
	int timestamp;
	int which;
	int ball;
	int padding1;
	int padding2;
	int padding3;
	int xrel;
	int yrel
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyBallEvent >> ball [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_BALL
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyBallEvent >> ball: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_BALL put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyBallEvent >> padding1 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_PADDING1
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyBallEvent >> padding1: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_PADDING1 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyBallEvent >> padding2 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_PADDING2
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyBallEvent >> padding2: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_PADDING2 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyBallEvent >> padding3 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_PADDING3
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyBallEvent >> padding3: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_PADDING3 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyBallEvent >> reserved [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyBallEvent >> reserved: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_RESERVED put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyBallEvent >> timestamp [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyBallEvent >> timestamp: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TIMESTAMP put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyBallEvent >> type [
	"This method was automatically generated"
	^S3SDL_EventType fromInteger: (handle unsignedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyBallEvent >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyBallEvent >> which [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_WHICH
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyBallEvent >> which: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_WHICH put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyBallEvent >> xrel [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_XREL
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyBallEvent >> xrel: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_XREL put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyBallEvent >> yrel [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_YREL
]

{ #category : 'accessing - structure variables' }
S3SDL_JoyBallEvent >> yrel: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_YREL put: anObject
]
