"
I represent the `SDL_EVENT_DISPLAY_USABLE_BOUNDS_CHANGED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3DisplayUsableBoundsChangedEvent',
	#superclass : 'SDL3DisplayEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3DisplayUsableBoundsChangedEvent class >> eventType [

	^ SDL3EventType displayUsableBoundsChanged
]

{ #category : 'visitor' }
SDL3DisplayUsableBoundsChangedEvent >> accept: aVisitor [

	^ aVisitor visitDisplayUsableBoundsChangedEvent: self
]
