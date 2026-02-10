"
I am a FFI structure that represents the `SDL_EVENT_DISPLAY_ADDED` SDL3 event. The accessing protocol is defined by my superclass.
"
Class {
	#name : 'SDL3DisplayAddedEvent',
	#superclass : 'SDL3DisplayEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'visitor' }
SDL3DisplayAddedEvent >> accept: aVisitor [

	^ aVisitor visitDisplayAddedEvent: self
]
