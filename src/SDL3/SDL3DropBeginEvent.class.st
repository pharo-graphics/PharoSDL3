"
I represent the `SDL_EVENT_DROP_BEGIN` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3DropBeginEvent',
	#superclass : 'SDL3DropEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3DropBeginEvent class >> eventType [

	^ SDL3EventType dropBegin
]

{ #category : 'visitor' }
SDL3DropBeginEvent >> accept: aVisitor [

	^ aVisitor visitDropBeginEvent: self
]
