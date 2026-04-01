"
I represent the `SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3GamepadTouchpadMotionEvent',
	#superclass : 'SDL3GamepadTouchpadEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3GamepadTouchpadMotionEvent class >> eventType [

	^ SDL3EventType gamepadTouchpadMotion
]

{ #category : 'visitor' }
SDL3GamepadTouchpadMotionEvent >> accept: aVisitor [

	^ aVisitor visitGamepadTouchpadMotionEvent: self
]
