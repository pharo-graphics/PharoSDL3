"
I represent the `SDL_EVENT_GAMEPAD_BUTTON_UP` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3GamepadButtonUpEvent',
	#superclass : 'SDL3GamepadButtonEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3GamepadButtonUpEvent class >> eventType [

	^ SDL3EventType gamepadButtonUp
]

{ #category : 'visitor' }
SDL3GamepadButtonUpEvent >> accept: aVisitor [

	^ aVisitor visitGamepadButtonUpEvent: self
]
