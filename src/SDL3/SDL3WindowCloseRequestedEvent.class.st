"
I represent the `SDL_EVENT_WINDOW_CLOSE_REQUESTED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3WindowCloseRequestedEvent',
	#superclass : 'SDL3WindowEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3WindowCloseRequestedEvent class >> eventType [

	^ SDL3EventType windowCloseRequested
]

{ #category : 'visitor' }
SDL3WindowCloseRequestedEvent >> accept: aVisitor [

	^ aVisitor visitWindowCloseRequestedEvent: self
]
