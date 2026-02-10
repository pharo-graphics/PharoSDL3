Class {
	#name : 'SDL3KeyboardEvent',
	#superclass : 'SDL3WindowIDEvent',
	#classVars : [
		'OFFSET_DOWN',
		'OFFSET_KEY',
		'OFFSET_MOD',
		'OFFSET_RAW',
		'OFFSET_REPEAT',
		'OFFSET_RESERVED',
		'OFFSET_SCANCODE',
		'OFFSET_TIMESTAMP',
		'OFFSET_TYPE',
		'OFFSET_WHICH',
		'OFFSET_WINDOWID'
	],
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'field definition' }
SDL3KeyboardEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp;
	SDL_WindowID windowID;
	SDL_KeyboardID which;
	SDL_Scancode scancode;
	SDL_Keycode key;
	SDL_Keymod mod;
	Uint16 raw;
	bool down;
	bool repeat
	)
]

{ #category : 'visitor' }
SDL3KeyboardEvent >> accept: aVisitor [

	^ aVisitor visitKeyboardEvent: self
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardEvent >> down [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_DOWN
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardEvent >> key [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_KEY
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardEvent >> mod [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_MOD
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardEvent >> raw [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_RAW
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardEvent >> repeat [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_REPEAT
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardEvent >> scancode [
	"This method was automatically generated"
	^SDL3Scancode fromInteger: (handle unsignedLongAt: OFFSET_SCANCODE)
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardEvent >> which [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WHICH
]

{ #category : 'accessing - structure variables' }
SDL3KeyboardEvent >> windowID [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WINDOWID
]
