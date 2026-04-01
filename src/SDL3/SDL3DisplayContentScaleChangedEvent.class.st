"
I represent the `SDL_EVENT_DISPLAY_CONTENT_SCALE_CHANGED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3DisplayContentScaleChangedEvent',
	#superclass : 'SDL3DisplayEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3DisplayContentScaleChangedEvent class >> eventType [

	^ SDL3EventType displayContentScaleChanged
]

{ #category : 'visitor' }
SDL3DisplayContentScaleChangedEvent >> accept: aVisitor [

	^ aVisitor visitDisplayContentScaleChangedEvent: self
]
