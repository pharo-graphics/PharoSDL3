"
I represent the `SDL_EVENT_WINDOW_DISPLAY_SCALE_CHANGED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3WindowDisplayScaleChangedEvent',
	#superclass : 'SDL3WindowEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3WindowDisplayScaleChangedEvent class >> eventType [

	^ SDL3EventType windowDisplayScaleChanged
]

{ #category : 'visitor' }
SDL3WindowDisplayScaleChangedEvent >> accept: aVisitor [

	^ aVisitor visitWindowDisplayScaleChangedEvent: self
]
