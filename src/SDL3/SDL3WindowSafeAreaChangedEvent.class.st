"
I am a FFI structure that represents the `SDL_EVENT_WINDOW_SAFE_AREA_CHANGED` SDL3 event. The accessing protocol is defined by my superclass.
"
Class {
	#name : 'SDL3WindowSafeAreaChangedEvent',
	#superclass : 'SDL3WindowEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'visitor' }
SDL3WindowSafeAreaChangedEvent >> accept: aVisitor [

	^ aVisitor visitWindowSafeAreaChangedEvent: self
]
