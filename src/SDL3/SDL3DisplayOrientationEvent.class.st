"
I represent the `SDL_EVENT_DISPLAY_ORIENTATION` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3DisplayOrientationEvent',
	#superclass : 'SDL3DisplayEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3DisplayOrientationEvent class >> eventType [

	^ SDL3EventType displayOrientation
]

{ #category : 'visitor' }
SDL3DisplayOrientationEvent >> accept: aVisitor [

	^ aVisitor visitDisplayOrientationEvent: self
]
