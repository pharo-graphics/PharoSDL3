"
I represent the `SDL_EVENT_GAMEPAD_BUTTON_DOWN` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3GamepadButtonDownEvent',
	#superclass : 'SDL3GamepadButtonEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3GamepadButtonDownEvent class >> eventType [

	^ SDL3EventType gamepadButtonDown
]

{ #category : 'visitor' }
SDL3GamepadButtonDownEvent >> accept: aVisitor [

	^ aVisitor visitGamepadButtonDownEvent: self
]
