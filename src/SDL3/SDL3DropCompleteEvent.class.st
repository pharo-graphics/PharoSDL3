"
I represent the `SDL_EVENT_DROP_COMPLETE` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3DropCompleteEvent',
	#superclass : 'SDL3DropEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3DropCompleteEvent class >> eventType [

	^ SDL3EventType dropComplete
]

{ #category : 'visitor' }
SDL3DropCompleteEvent >> accept: aVisitor [

	^ aVisitor visitDropCompleteEvent: self
]
