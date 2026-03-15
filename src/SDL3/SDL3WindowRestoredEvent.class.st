"
I represent the `SDL_EVENT_WINDOW_RESTORED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3WindowRestoredEvent',
	#superclass : 'SDL3WindowEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3WindowRestoredEvent class >> eventType [

	^ SDL3EventType windowRestored
]

{ #category : 'visitor' }
SDL3WindowRestoredEvent >> accept: aVisitor [

	^ aVisitor visitWindowRestoredEvent: self
]
