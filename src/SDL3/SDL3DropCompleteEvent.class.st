"
I am a FFI structure that represents the `SDL_EVENT_DROP_COMPLETE` SDL3 event. The accessing protocol is defined by my superclass.
"
Class {
	#name : 'SDL3DropCompleteEvent',
	#superclass : 'SDL3DropEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'visitor' }
SDL3DropCompleteEvent >> accept: aVisitor [

	^ aVisitor visitDropCompleteEvent: self
]
