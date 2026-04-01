"
I represent the `SDL_EVENT_PEN_UP` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3PenTouchUpEvent',
	#superclass : 'SDL3PenTouchEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3PenTouchUpEvent class >> eventType [

	^ SDL3EventType penUp
]

{ #category : 'visitor' }
SDL3PenTouchUpEvent >> accept: aVisitor [

	^ aVisitor visitPenTouchUpEvent: self
]
