"
I represent the `SDL_EVENT_WINDOW_MOUSE_ENTER` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3WindowMouseEnterEvent',
	#superclass : 'SDL3WindowEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3WindowMouseEnterEvent class >> eventType [

	^ SDL3EventType windowMouseEnter
]

{ #category : 'visitor' }
SDL3WindowMouseEnterEvent >> accept: aVisitor [

	^ aVisitor visitWindowMouseEnterEvent: self
]
