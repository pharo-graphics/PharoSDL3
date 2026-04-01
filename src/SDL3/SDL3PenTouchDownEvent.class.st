"
I represent the `SDL_EVENT_PEN_DOWN` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3PenTouchDownEvent',
	#superclass : 'SDL3PenTouchEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3PenTouchDownEvent class >> eventType [

	^ SDL3EventType penDown
]

{ #category : 'visitor' }
SDL3PenTouchDownEvent >> accept: aVisitor [

	^ aVisitor visitPenTouchDownEvent: self
]
