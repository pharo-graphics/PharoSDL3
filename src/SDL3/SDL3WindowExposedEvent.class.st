"
I represent the `SDL_EVENT_WINDOW_EXPOSED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3WindowExposedEvent',
	#superclass : 'SDL3WindowEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3WindowExposedEvent class >> eventType [

	^ SDL3EventType windowExposed
]

{ #category : 'visitor' }
SDL3WindowExposedEvent >> accept: aVisitor [

	^ aVisitor visitWindowExposedEvent: self
]
