"
I represent the `SDL_EVENT_FINGER_DOWN` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3TouchFingerDownEvent',
	#superclass : 'SDL3TouchFingerEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3TouchFingerDownEvent class >> eventType [

	^ SDL3EventType fingerDown
]

{ #category : 'visitor' }
SDL3TouchFingerDownEvent >> accept: aVisitor [

	^ aVisitor visitTouchFingerDownEvent: self
]
