"
I am a FFI structure that represents the `SDL_EVENT_DISPLAY_MOVED` SDL3 event. The accessing protocol is defined by my superclass.
"
Class {
	#name : 'SDL3DisplayMovedEvent',
	#superclass : 'SDL3DisplayEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'visitor' }
SDL3DisplayMovedEvent >> accept: aVisitor [

	^ aVisitor visitDisplayMovedEvent: self
]
