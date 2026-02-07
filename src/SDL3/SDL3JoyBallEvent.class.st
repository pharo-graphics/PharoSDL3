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
SDL3JoyBallEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3JoyBallEvent >> which [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WHICH
]

{ #category : 'accessing - structure variables' }
SDL3JoyBallEvent >> xrel [
	"This method was automatically generated"
	^handle signedShortAt: OFFSET_XREL
]

{ #category : 'accessing - structure variables' }
SDL3JoyBallEvent >> yrel [
	"This method was automatically generated"
	^handle signedShortAt: OFFSET_YREL
]
