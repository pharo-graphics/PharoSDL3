"
I represent the `SDL_EVENT_DISPLAY_ADDED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3DisplayAddedEvent',
	#superclass : 'SDL3DisplayEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3DisplayAddedEvent class >> eventType [

	^ SDL3EventType displayAdded
]

{ #category : 'visitor' }
SDL3DisplayAddedEvent >> accept: aVisitor [

	^ aVisitor visitDisplayAddedEvent: self
]
