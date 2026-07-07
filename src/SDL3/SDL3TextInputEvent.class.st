"
I am a SDL3 FFI binding for `SDL_TextInputEvent`.

Keyboard text input event structure (event.text.*)

See: https://wiki.libsdl.org/SDL3/SDL_TextInputEvent
"
Class {
	#name : 'SDL3TextInputEvent',
	#superclass : 'SDL3TextEvent',
	#classVars : [
		'OFFSET_RESERVED',
		'OFFSET_TEXT',
		'OFFSET_TIMESTAMP',
		'OFFSET_TYPE',
		'OFFSET_WINDOWID'
	],
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3TextInputEvent class >> eventType [

	^ SDL3EventType textInput
]

{ #category : 'field definition' }
SDL3TextInputEvent class >> fieldsDesc [

	^ #(
	SDL_EventType type;
	Uint32 reserved;
	Uint64 timestamp;
	SDL_WindowID windowID;
	char* text
	)
]

{ #category : 'visitor' }
SDL3TextInputEvent >> accept: aVisitor [

	^ aVisitor visitTextInputEvent: self
]

{ #category : 'accessing - structure variables' }
SDL3TextInputEvent >> text [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_TEXT) type: ExternalType char asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3TextInputEvent >> timestamp [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_TIMESTAMP
]

{ #category : 'accessing - structure variables' }
SDL3TextInputEvent >> windowID [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WINDOWID
]
