"
I represent the `SDL_EVENT_WINDOW_MOVED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3WindowMovedEvent',
	#superclass : 'SDL3WindowEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3WindowMovedEvent class >> eventType [

	^ SDL3EventType windowMoved
]

{ #category : 'visitor' }
SDL3WindowMovedEvent >> accept: aVisitor [

	^ aVisitor visitWindowMovedEvent: self
]
