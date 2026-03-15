"
I represent the `SDL_EVENT_WINDOW_HDR_STATE_CHANGED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3WindowHdrStateChangedEvent',
	#superclass : 'SDL3WindowEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3WindowHdrStateChangedEvent class >> eventType [

	^ SDL3EventType windowHdrStateChanged
]

{ #category : 'visitor' }
SDL3WindowHdrStateChangedEvent >> accept: aVisitor [

	^ aVisitor visitWindowHdrStateChangedEvent: self
]
