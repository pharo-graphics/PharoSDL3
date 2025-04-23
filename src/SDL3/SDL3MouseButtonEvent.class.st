Class {
	#name : 'SDL3MouseButtonEvent',
	#superclass : 'SDL3MappedEvent',
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
SDL3MouseButtonEvent >> button: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_BUTTON put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3MouseButtonEvent >> clicks [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_CLICKS
]

{ #category : 'accessing - structure variables' }
SDL3MouseButtonEvent >> clicks: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_CLICKS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3MouseButtonEvent >> down [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_DOWN
]

{ #category : 'accessing - structure variables' }
SDL3MouseButtonEvent >> down: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_DOWN put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3MouseButtonEvent >> padding [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING
]

{ #category : 'accessing - structure variables' }
SDL3MouseButtonEvent >> padding: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3MouseButtonEvent >> reserved [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_RESERVED
]

{ #category : 'accessing - structure variables' }
SDL3MouseButtonEvent >> reserved: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_RESERVED put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3MouseButtonEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3MouseButtonEvent >> timestamp: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_TIMESTAMP put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3MouseButtonEvent >> type [
	"This method was automatically generated"
	^SDL3EventType fromInteger: (handle unsignedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
SDL3MouseButtonEvent >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3MouseButtonEvent >> which [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WHICH
]

{ #category : 'accessing - structure variables' }
SDL3MouseButtonEvent >> which: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_WHICH put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3MouseButtonEvent >> windowID [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WINDOWID
]

{ #category : 'accessing - structure variables' }
SDL3MouseButtonEvent >> windowID: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_WINDOWID put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3MouseButtonEvent >> x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
SDL3MouseButtonEvent >> x: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3MouseButtonEvent >> y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
SDL3MouseButtonEvent >> y: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Y put: anObject
]
