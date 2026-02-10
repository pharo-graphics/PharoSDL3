"
I am a FFI structure that represents the `SDL_EVENT_WINDOW_RESTORED` SDL3 event. The accessing protocol is defined by my superclass.
"
Class {
	#name : 'SDL3WindowRestoredEvent',
	#superclass : 'SDL3WindowEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'visitor' }
SDL3WindowRestoredEvent >> accept: aVisitor [

	^ aVisitor visitWindowRestoredEvent: self
]
