"
I represent the `SDL_EVENT_DISPLAY_DESKTOP_MODE_CHANGED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3DisplayDesktopModeChangedEvent',
	#superclass : 'SDL3DisplayEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3DisplayDesktopModeChangedEvent class >> eventType [

	^ SDL3EventType displayDesktopModeChanged
]

{ #category : 'visitor' }
SDL3DisplayDesktopModeChangedEvent >> accept: aVisitor [

	^ aVisitor visitDisplayDesktopModeChangedEvent: self
]
