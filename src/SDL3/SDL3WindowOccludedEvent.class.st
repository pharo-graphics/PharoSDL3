"
I represent the `SDL_EVENT_WINDOW_OCCLUDED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3WindowOccludedEvent',
	#superclass : 'SDL3WindowEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3WindowOccludedEvent class >> eventType [

	^ SDL3EventType windowOccluded
]

{ #category : 'visitor' }
SDL3WindowOccludedEvent >> accept: aVisitor [

	^ aVisitor visitWindowOccludedEvent: self
]
