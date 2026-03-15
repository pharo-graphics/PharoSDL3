"
I represent the `SDL_EVENT_DROP_POSITION` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3DropPositionEvent',
	#superclass : 'SDL3DropEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3DropPositionEvent class >> eventType [

	^ SDL3EventType dropPosition
]

{ #category : 'visitor' }
SDL3DropPositionEvent >> accept: aVisitor [

	^ aVisitor visitDropPositionEvent: self
]
