"
I am a FFI structure that represents the `SDL_EVENT_PEN_DOWN` SDL3 event. The accessing protocol is defined by my superclass.
"
Class {
	#name : 'SDL3PenTouchDownEvent',
	#superclass : 'SDL3PenTouchEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'visitor' }
SDL3PenTouchDownEvent >> accept: aVisitor [

	^ aVisitor visitPenTouchDownEvent: self
]
