"
I represent the `SDL_EVENT_PEN_BUTTON_DOWN` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3PenButtonDownEvent',
	#superclass : 'SDL3PenButtonEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3PenButtonDownEvent class >> eventType [

	^ SDL3EventType penButtonDown
]

{ #category : 'visitor' }
SDL3PenButtonDownEvent >> accept: aVisitor [

	^ aVisitor visitPenButtonDownEvent: self
]
