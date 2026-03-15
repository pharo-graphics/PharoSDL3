"
I represent the `SDL_EVENT_WINDOW_SHOWN` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3WindowShownEvent',
	#superclass : 'SDL3WindowEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3WindowShownEvent class >> eventType [

	^ SDL3EventType windowShown
]

{ #category : 'visitor' }
SDL3WindowShownEvent >> accept: aVisitor [

	^ aVisitor visitWindowShownEvent: self
]
