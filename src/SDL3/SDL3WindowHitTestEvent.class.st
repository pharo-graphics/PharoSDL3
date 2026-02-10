"
I am a FFI structure that represents the `SDL_EVENT_WINDOW_HIT_TEST` SDL3 event. The accessing protocol is defined by my superclass.
"
Class {
	#name : 'SDL3WindowHitTestEvent',
	#superclass : 'SDL3WindowEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'visitor' }
SDL3WindowHitTestEvent >> accept: aVisitor [

	^ aVisitor visitWindowHitTestEvent: self
]
