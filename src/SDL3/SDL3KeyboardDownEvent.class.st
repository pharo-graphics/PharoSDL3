"
I represent the `SDL_EVENT_KEY_DOWN` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3KeyboardDownEvent',
	#superclass : 'SDL3KeyboardEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3KeyboardDownEvent class >> eventType [

	^ SDL3EventType keyDown
]

{ #category : 'visitor' }
SDL3KeyboardDownEvent >> accept: aVisitor [

	^ aVisitor visitKeyboardDownEvent: self
]
