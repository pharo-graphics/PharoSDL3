"
I represent the `SDL_EVENT_PEN_BUTTON_UP` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3PenButtonUpEvent',
	#superclass : 'SDL3PenButtonEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3PenButtonUpEvent class >> eventType [

	^ SDL3EventType penButtonUp
]

{ #category : 'visitor' }
SDL3PenButtonUpEvent >> accept: aVisitor [

	^ aVisitor visitPenButtonUpEvent: self
]
