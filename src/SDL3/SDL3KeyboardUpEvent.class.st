"
I represent the `SDL_EVENT_KEY_UP` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3KeyboardUpEvent',
	#superclass : 'SDL3KeyboardEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3KeyboardUpEvent class >> eventType [

	^ SDL3EventType keyUp
]

{ #category : 'visitor' }
SDL3KeyboardUpEvent >> accept: aVisitor [

	^ aVisitor visitKeyboardUpEvent: self
]
