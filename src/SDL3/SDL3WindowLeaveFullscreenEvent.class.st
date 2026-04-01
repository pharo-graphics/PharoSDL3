"
I represent the `SDL_EVENT_WINDOW_LEAVE_FULLSCREEN` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3WindowLeaveFullscreenEvent',
	#superclass : 'SDL3WindowEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3WindowLeaveFullscreenEvent class >> eventType [

	^ SDL3EventType windowLeaveFullscreen
]

{ #category : 'visitor' }
SDL3WindowLeaveFullscreenEvent >> accept: aVisitor [

	^ aVisitor visitWindowLeaveFullscreenEvent: self
]
