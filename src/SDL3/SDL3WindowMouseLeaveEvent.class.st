"
I represent the `SDL_EVENT_WINDOW_MOUSE_LEAVE` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3WindowMouseLeaveEvent',
	#superclass : 'SDL3WindowEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3WindowMouseLeaveEvent class >> eventType [

	^ SDL3EventType windowMouseLeave
]

{ #category : 'visitor' }
SDL3WindowMouseLeaveEvent >> accept: aVisitor [

	^ aVisitor visitWindowMouseLeaveEvent: self
]
