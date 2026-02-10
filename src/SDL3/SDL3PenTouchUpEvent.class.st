"
I am a FFI structure that represents the `SDL_EVENT_PEN_UP` SDL3 event. The accessing protocol is defined by my superclass.
"
Class {
	#name : 'SDL3PenTouchUpEvent',
	#superclass : 'SDL3PenTouchEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'visitor' }
SDL3PenTouchUpEvent >> accept: aVisitor [

	^ aVisitor visitPenTouchUpEvent: self
]
