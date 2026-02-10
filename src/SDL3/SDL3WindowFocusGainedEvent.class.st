"
I am a FFI structure that represents the `SDL_EVENT_WINDOW_FOCUS_GAINED` SDL3 event. The accessing protocol is defined by my superclass.
"
Class {
	#name : 'SDL3WindowFocusGainedEvent',
	#superclass : 'SDL3WindowEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'visitor' }
SDL3WindowFocusGainedEvent >> accept: aVisitor [

	^ aVisitor visitWindowFocusGainedEvent: self
]
