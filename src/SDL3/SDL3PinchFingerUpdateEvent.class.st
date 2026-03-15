"
I represent the `SDL_EVENT_PINCH_UPDATE` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3PinchFingerUpdateEvent',
	#superclass : 'SDL3PinchFingerEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3PinchFingerUpdateEvent class >> eventType [

	^ SDL3EventType pinchUpdate
]

{ #category : 'visitor' }
SDL3PinchFingerUpdateEvent >> accept: aVisitor [

	^ aVisitor visitPinchFingerUpdateEvent: self
]
