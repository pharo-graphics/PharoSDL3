"
I am a FFI structure that represents the `SDL_EVENT_FINGER_DOWN` SDL3 event. The accessing protocol is defined by my superclass.
"
Class {
	#name : 'SDL3TouchFingerDownEvent',
	#superclass : 'SDL3TouchFingerEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'visitor' }
SDL3TouchFingerDownEvent >> accept: aVisitor [

	^ aVisitor visitTouchFingerDownEvent: self
]
