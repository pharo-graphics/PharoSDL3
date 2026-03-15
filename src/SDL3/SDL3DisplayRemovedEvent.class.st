"
I represent the `SDL_EVENT_DISPLAY_REMOVED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3DisplayRemovedEvent',
	#superclass : 'SDL3DisplayEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3DisplayRemovedEvent class >> eventType [

	^ SDL3EventType displayRemoved
]

{ #category : 'visitor' }
SDL3DisplayRemovedEvent >> accept: aVisitor [

	^ aVisitor visitDisplayRemovedEvent: self
]
