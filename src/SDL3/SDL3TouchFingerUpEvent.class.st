"
I represent the `SDL_EVENT_FINGER_UP` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3TouchFingerUpEvent',
	#superclass : 'SDL3TouchFingerEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3TouchFingerUpEvent class >> eventType [

	^ SDL3EventType fingerUp
]

{ #category : 'visitor' }
SDL3TouchFingerUpEvent >> accept: aVisitor [

	^ aVisitor visitTouchFingerUpEvent: self
]
