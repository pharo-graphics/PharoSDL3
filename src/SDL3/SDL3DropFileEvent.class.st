"
I represent the `SDL_EVENT_DROP_FILE` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3DropFileEvent',
	#superclass : 'SDL3DropEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3DropFileEvent class >> eventType [

	^ SDL3EventType dropFile
]

{ #category : 'visitor' }
SDL3DropFileEvent >> accept: aVisitor [

	^ aVisitor visitDropFileEvent: self
]
