"
I am a FFI structure that represents the `SDL_EVENT_MOUSE_BUTTON_DOWN` SDL3 event. The accessing protocol is defined by my superclass.
"
Class {
	#name : 'SDL3MouseButtonDownEvent',
	#superclass : 'SDL3MouseButtonEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'visitor' }
SDL3MouseButtonDownEvent >> accept: aVisitor [

	^ aVisitor visitMouseButtonDownEvent: self
]
