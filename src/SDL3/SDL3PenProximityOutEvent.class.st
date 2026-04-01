"
I represent the `SDL_EVENT_PEN_PROXIMITY_OUT` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3PenProximityOutEvent',
	#superclass : 'SDL3PenProximityEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3PenProximityOutEvent class >> eventType [

	^ SDL3EventType penProximityOut
]

{ #category : 'visitor' }
SDL3PenProximityOutEvent >> accept: aVisitor [

	^ aVisitor visitPenProximityOutEvent: self
]
