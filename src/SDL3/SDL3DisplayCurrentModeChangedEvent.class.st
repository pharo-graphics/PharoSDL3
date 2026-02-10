"
I am a FFI structure that represents the `SDL_EVENT_DISPLAY_CURRENT_MODE_CHANGED` SDL3 event. The accessing protocol is defined by my superclass.
"
Class {
	#name : 'SDL3DisplayCurrentModeChangedEvent',
	#superclass : 'SDL3DisplayEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'visitor' }
SDL3DisplayCurrentModeChangedEvent >> accept: aVisitor [

	^ aVisitor visitDisplayCurrentModeChangedEvent: self
]
