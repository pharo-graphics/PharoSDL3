"
I represent the `SDL_EVENT_JOYSTICK_BUTTON_UP` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3JoyButtonUpEvent',
	#superclass : 'SDL3JoyButtonEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3JoyButtonUpEvent class >> eventType [

	^ SDL3EventType joystickButtonUp
]

{ #category : 'visitor' }
SDL3JoyButtonUpEvent >> accept: aVisitor [

	^ aVisitor visitJoyButtonUpEvent: self
]
