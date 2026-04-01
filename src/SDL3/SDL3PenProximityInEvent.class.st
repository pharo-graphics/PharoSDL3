"
I represent the `SDL_EVENT_PEN_PROXIMITY_IN` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3PenProximityInEvent',
	#superclass : 'SDL3PenProximityEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3PenProximityInEvent class >> eventType [

	^ SDL3EventType penProximityIn
]

{ #category : 'visitor' }
SDL3PenProximityInEvent >> accept: aVisitor [

	^ aVisitor visitPenProximityInEvent: self
]
