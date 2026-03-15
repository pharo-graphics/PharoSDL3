"
I represent the `SDL_EVENT_FINGER_CANCELED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3TouchFingerCanceledEvent',
	#superclass : 'SDL3TouchFingerEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3TouchFingerCanceledEvent class >> eventType [

	^ SDL3EventType fingerCanceled
]

{ #category : 'visitor' }
SDL3TouchFingerCanceledEvent >> accept: aVisitor [

	^ aVisitor visitTouchFingerCanceledEvent: self
]
