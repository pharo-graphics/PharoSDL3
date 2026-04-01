"
I represent the `SDL_EVENT_DROP_TEXT` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3DropTextEvent',
	#superclass : 'SDL3DropEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3DropTextEvent class >> eventType [

	^ SDL3EventType dropText
]

{ #category : 'visitor' }
SDL3DropTextEvent >> accept: aVisitor [

	^ aVisitor visitDropTextEvent: self
]
