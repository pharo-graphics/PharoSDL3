"
I represent the `SDL_EVENT_WINDOW_RESIZED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3WindowResizedEvent',
	#superclass : 'SDL3WindowEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3WindowResizedEvent class >> eventType [

	^ SDL3EventType windowResized
]

{ #category : 'visitor' }
SDL3WindowResizedEvent >> accept: aVisitor [

	^ aVisitor visitWindowResizedEvent: self
]
