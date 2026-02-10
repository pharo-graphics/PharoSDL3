"
I am a FFI structure that represents the `SDL_EVENT_GAMEPAD_BUTTON_DOWN` SDL3 event. The accessing protocol is defined by my superclass.
"
Class {
	#name : 'SDL3GamepadButtonDownEvent',
	#superclass : 'SDL3GamepadButtonEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'visitor' }
SDL3GamepadButtonDownEvent >> accept: aVisitor [

	^ aVisitor visitGamepadButtonDownEvent: self
]
