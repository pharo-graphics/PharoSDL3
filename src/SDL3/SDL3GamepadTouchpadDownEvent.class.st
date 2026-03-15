"
I represent the `SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3GamepadTouchpadDownEvent',
	#superclass : 'SDL3GamepadTouchpadEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3GamepadTouchpadDownEvent class >> eventType [

	^ SDL3EventType gamepadTouchpadDown
]

{ #category : 'visitor' }
SDL3GamepadTouchpadDownEvent >> accept: aVisitor [

	^ aVisitor visitGamepadTouchpadDownEvent: self
]
