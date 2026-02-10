"
I am a FFI structure that represents the `SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION` SDL3 event. The accessing protocol is defined by my superclass.
"
Class {
	#name : 'SDL3GamepadTouchpadMotionEvent',
	#superclass : 'SDL3GamepadTouchpadEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'visitor' }
SDL3GamepadTouchpadMotionEvent >> accept: aVisitor [

	^ aVisitor visitGamepadTouchpadMotionEvent: self
]
