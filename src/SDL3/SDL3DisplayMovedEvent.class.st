"
I represent the `SDL_EVENT_DISPLAY_MOVED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3DisplayMovedEvent',
	#superclass : 'SDL3DisplayEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3DisplayMovedEvent class >> eventType [

	^ SDL3EventType displayMoved
]

{ #category : 'visitor' }
SDL3DisplayMovedEvent >> accept: aVisitor [

	^ aVisitor visitDisplayMovedEvent: self
]
