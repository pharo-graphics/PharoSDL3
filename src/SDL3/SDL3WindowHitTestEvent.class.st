"
I represent the `SDL_EVENT_WINDOW_HIT_TEST` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3WindowHitTestEvent',
	#superclass : 'SDL3WindowEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3WindowHitTestEvent class >> eventType [

	^ SDL3EventType windowHitTest
]

{ #category : 'visitor' }
SDL3WindowHitTestEvent >> accept: aVisitor [

	^ aVisitor visitWindowHitTestEvent: self
]
