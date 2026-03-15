"
I represent the `SDL_EVENT_WINDOW_DISPLAY_CHANGED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3WindowDisplayChangedEvent',
	#superclass : 'SDL3WindowEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3WindowDisplayChangedEvent class >> eventType [

	^ SDL3EventType windowDisplayChanged
]

{ #category : 'visitor' }
SDL3WindowDisplayChangedEvent >> accept: aVisitor [

	^ aVisitor visitWindowDisplayChangedEvent: self
]
