"
I represent the `SDL_EVENT_WINDOW_SAFE_AREA_CHANGED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3WindowSafeAreaChangedEvent',
	#superclass : 'SDL3WindowEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3WindowSafeAreaChangedEvent class >> eventType [

	^ SDL3EventType windowSafeAreaChanged
]

{ #category : 'visitor' }
SDL3WindowSafeAreaChangedEvent >> accept: aVisitor [

	^ aVisitor visitWindowSafeAreaChangedEvent: self
]
