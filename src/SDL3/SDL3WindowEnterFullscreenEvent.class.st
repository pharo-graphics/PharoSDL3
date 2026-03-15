"
I represent the `SDL_EVENT_WINDOW_ENTER_FULLSCREEN` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3WindowEnterFullscreenEvent',
	#superclass : 'SDL3WindowEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3WindowEnterFullscreenEvent class >> eventType [

	^ SDL3EventType windowEnterFullscreen
]

{ #category : 'visitor' }
SDL3WindowEnterFullscreenEvent >> accept: aVisitor [

	^ aVisitor visitWindowEnterFullscreenEvent: self
]
