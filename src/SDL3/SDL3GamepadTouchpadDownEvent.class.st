"
I am a FFI structure that represents the `SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN` SDL3 event. The accessing protocol is defined by my superclass.
"
Class {
	#name : 'SDL3GamepadTouchpadDownEvent',
	#superclass : 'SDL3GamepadTouchpadEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'visitor' }
SDL3GamepadTouchpadDownEvent >> accept: aVisitor [

	^ aVisitor visitGamepadTouchpadDownEvent: self
]
