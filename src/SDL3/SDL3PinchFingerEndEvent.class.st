"
I represent the `SDL_EVENT_PINCH_END` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3PinchFingerEndEvent',
	#superclass : 'SDL3PinchFingerEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3PinchFingerEndEvent class >> eventType [

	^ SDL3EventType pinchEnd
]

{ #category : 'visitor' }
SDL3PinchFingerEndEvent >> accept: aVisitor [

	^ aVisitor visitPinchFingerEndEvent: self
]
