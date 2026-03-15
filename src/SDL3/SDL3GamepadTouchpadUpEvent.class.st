"
I represent the `SDL_EVENT_GAMEPAD_TOUCHPAD_UP` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3GamepadTouchpadUpEvent',
	#superclass : 'SDL3GamepadTouchpadEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3GamepadTouchpadUpEvent class >> eventType [

	^ SDL3EventType gamepadTouchpadUp
]

{ #category : 'visitor' }
SDL3GamepadTouchpadUpEvent >> accept: aVisitor [

	^ aVisitor visitGamepadTouchpadUpEvent: self
]
