"
I represent the `SDL_EVENT_WINDOW_MAXIMIZED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3WindowMaximizedEvent',
	#superclass : 'SDL3WindowEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3WindowMaximizedEvent class >> eventType [

	^ SDL3EventType windowMaximized
]

{ #category : 'visitor' }
SDL3WindowMaximizedEvent >> accept: aVisitor [

	^ aVisitor visitWindowMaximizedEvent: self
]
