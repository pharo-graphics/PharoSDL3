"
I represent the `SDL_EVENT_JOYSTICK_BUTTON_DOWN` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3JoyButtonDownEvent',
	#superclass : 'SDL3JoyButtonEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3JoyButtonDownEvent class >> eventType [

	^ SDL3EventType joystickButtonDown
]

{ #category : 'visitor' }
SDL3JoyButtonDownEvent >> accept: aVisitor [

	^ aVisitor visitJoyButtonDownEvent: self
]
