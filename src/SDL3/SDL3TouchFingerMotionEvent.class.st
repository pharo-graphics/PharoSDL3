"
I represent the `SDL_EVENT_FINGER_MOTION` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3TouchFingerMotionEvent',
	#superclass : 'SDL3TouchFingerEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3TouchFingerMotionEvent class >> eventType [

	^ SDL3EventType fingerMotion
]

{ #category : 'visitor' }
SDL3TouchFingerMotionEvent >> accept: aVisitor [

	^ aVisitor visitTouchFingerMotionEvent: self
]
