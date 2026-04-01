"
I represent the `SDL_EVENT_DISPLAY_CURRENT_MODE_CHANGED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3DisplayCurrentModeChangedEvent',
	#superclass : 'SDL3DisplayEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3DisplayCurrentModeChangedEvent class >> eventType [

	^ SDL3EventType displayCurrentModeChanged
]

{ #category : 'visitor' }
SDL3DisplayCurrentModeChangedEvent >> accept: aVisitor [

	^ aVisitor visitDisplayCurrentModeChangedEvent: self
]
