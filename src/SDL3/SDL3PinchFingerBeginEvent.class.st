"
I represent the `SDL_EVENT_PINCH_BEGIN` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3PinchFingerBeginEvent',
	#superclass : 'SDL3PinchFingerEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3PinchFingerBeginEvent class >> eventType [

	^ SDL3EventType pinchBegin
]

{ #category : 'visitor' }
SDL3PinchFingerBeginEvent >> accept: aVisitor [

	^ aVisitor visitPinchFingerBeginEvent: self
]
