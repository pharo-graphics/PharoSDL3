"
I represent the `SDL_EVENT_WINDOW_MINIMIZED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3WindowMinimizedEvent',
	#superclass : 'SDL3WindowEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3WindowMinimizedEvent class >> eventType [

	^ SDL3EventType windowMinimized
]

{ #category : 'visitor' }
SDL3WindowMinimizedEvent >> accept: aVisitor [

	^ aVisitor visitWindowMinimizedEvent: self
]
