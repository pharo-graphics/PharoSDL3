"
I represent the `SDL_EVENT_WINDOW_DESTROYED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3WindowDestroyedEvent',
	#superclass : 'SDL3WindowEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3WindowDestroyedEvent class >> eventType [

	^ SDL3EventType windowDestroyed
]

{ #category : 'visitor' }
SDL3WindowDestroyedEvent >> accept: aVisitor [

	^ aVisitor visitWindowDestroyedEvent: self
]
