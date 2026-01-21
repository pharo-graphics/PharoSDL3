Class {
	#name : 'SDL3MouseButtonEvent',
	#superclass : 'SDL3MouseEvent',
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
SDL3MouseButtonEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp;
	SDL_WindowID windowID;
	SDL_MouseID which;
	Uint8 button;
	bool down;
	Uint8 clicks;
	Uint8 padding;
	float x;
	float y
	)
]

{ #category : 'accessing - structure variables' }
SDL3MouseButtonEvent >> button [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_BUTTON
]

{ #category : 'accessing - structure variables' }
SDL3MouseButtonEvent >> clicks [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_CLICKS
]

{ #category : 'accessing - structure variables' }
SDL3MouseButtonEvent >> down [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_DOWN
]

{ #category : 'accessing - structure variables' }
SDL3MouseButtonEvent >> padding [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING
]

{ #category : 'accessing - structure variables' }
SDL3MouseButtonEvent >> reserved [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
SDL3MouseButtonEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3MouseButtonEvent >> which [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WHICH
]

{ #category : 'accessing - structure variables' }
SDL3MouseButtonEvent >> windowID [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WINDOWID
]

{ #category : 'accessing - structure variables' }
SDL3MouseButtonEvent >> x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
SDL3MouseButtonEvent >> y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]
