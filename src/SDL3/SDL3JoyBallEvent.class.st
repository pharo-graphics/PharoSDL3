Class {
	#name : 'SDL3JoyBallEvent',
	#superclass : 'SDL3MappedEvent',
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
SDL3JoyBallEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp;
	SDL_JoystickID which;
	Uint8 ball;
	Uint8 padding1;
	Uint8 padding2;
	Uint8 padding3;
	Sint16 xrel;
	Sint16 yrel
	)
]

{ #category : 'accessing - structure variables' }
SDL3JoyBallEvent >> ball [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_BALL
]

{ #category : 'accessing - structure variables' }
SDL3JoyBallEvent >> ball: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_BALL put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3JoyBallEvent >> padding1 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING1
]

{ #category : 'accessing - structure variables' }
SDL3JoyBallEvent >> padding1: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING1 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3JoyBallEvent >> padding2 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING2
]

{ #category : 'accessing - structure variables' }
SDL3JoyBallEvent >> padding2: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING2 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3JoyBallEvent >> padding3 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING3
]

{ #category : 'accessing - structure variables' }
SDL3JoyBallEvent >> padding3: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING3 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3JoyBallEvent >> reserved [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
SDL3JoyBallEvent >> reserved: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_RESERVED put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3JoyBallEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3JoyBallEvent >> timestamp: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_TIMESTAMP put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3JoyBallEvent >> type [
	"This method was automatically generated"
	^SDL3EventType fromInteger: (handle unsignedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
SDL3JoyBallEvent >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3JoyBallEvent >> which [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WHICH
]

{ #category : 'accessing - structure variables' }
SDL3JoyBallEvent >> which: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_WHICH put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3JoyBallEvent >> xrel [
	"This method was automatically generated"
	^handle signedShortAt: OFFSET_XREL
]

{ #category : 'accessing - structure variables' }
SDL3JoyBallEvent >> xrel: anObject [
	"This method was automatically generated"
	handle signedShortAt: OFFSET_XREL put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3JoyBallEvent >> yrel [
	"This method was automatically generated"
	^handle signedShortAt: OFFSET_YREL
]

{ #category : 'accessing - structure variables' }
SDL3JoyBallEvent >> yrel: anObject [
	"This method was automatically generated"
	handle signedShortAt: OFFSET_YREL put: anObject
]
