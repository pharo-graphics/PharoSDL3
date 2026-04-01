"
I represent the `SDL_EVENT_MOUSE_BUTTON_UP` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3MouseButtonUpEvent',
	#superclass : 'SDL3MouseButtonEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3MouseButtonUpEvent class >> eventType [

	^ SDL3EventType mouseButtonUp
]

{ #category : 'visitor' }
SDL3MouseButtonUpEvent >> accept: aVisitor [

	^ aVisitor visitMouseButtonUpEvent: self
]
