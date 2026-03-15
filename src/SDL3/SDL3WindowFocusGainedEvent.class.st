"
I represent the `SDL_EVENT_WINDOW_FOCUS_GAINED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3WindowFocusGainedEvent',
	#superclass : 'SDL3WindowEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3WindowFocusGainedEvent class >> eventType [

	^ SDL3EventType windowFocusGained
]

{ #category : 'visitor' }
SDL3WindowFocusGainedEvent >> accept: aVisitor [

	^ aVisitor visitWindowFocusGainedEvent: self
]
