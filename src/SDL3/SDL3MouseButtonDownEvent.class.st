"
I represent the `SDL_EVENT_MOUSE_BUTTON_DOWN` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3MouseButtonDownEvent',
	#superclass : 'SDL3MouseButtonEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3MouseButtonDownEvent class >> eventType [

	^ SDL3EventType mouseButtonDown
]

{ #category : 'visitor' }
SDL3MouseButtonDownEvent >> accept: aVisitor [

	^ aVisitor visitMouseButtonDownEvent: self
]
