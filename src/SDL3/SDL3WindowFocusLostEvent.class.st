"
I represent the `SDL_EVENT_WINDOW_FOCUS_LOST` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3WindowFocusLostEvent',
	#superclass : 'SDL3WindowEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3WindowFocusLostEvent class >> eventType [

	^ SDL3EventType windowFocusLost
]

{ #category : 'visitor' }
SDL3WindowFocusLostEvent >> accept: aVisitor [

	^ aVisitor visitWindowFocusLostEvent: self
]
