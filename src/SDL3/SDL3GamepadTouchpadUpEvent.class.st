"
I am a FFI structure that represents the `SDL_EVENT_GAMEPAD_TOUCHPAD_UP` SDL3 event. The accessing protocol is defined by my superclass.
"
Class {
	#name : 'SDL3GamepadTouchpadUpEvent',
	#superclass : 'SDL3GamepadTouchpadEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'visitor' }
SDL3GamepadTouchpadUpEvent >> accept: aVisitor [

	^ aVisitor visitGamepadTouchpadUpEvent: self
]
