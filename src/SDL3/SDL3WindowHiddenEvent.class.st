"
I represent the `SDL_EVENT_WINDOW_HIDDEN` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3WindowHiddenEvent',
	#superclass : 'SDL3WindowEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3WindowHiddenEvent class >> eventType [

	^ SDL3EventType windowHidden
]

{ #category : 'visitor' }
SDL3WindowHiddenEvent >> accept: aVisitor [

	^ aVisitor visitWindowHiddenEvent: self
]
