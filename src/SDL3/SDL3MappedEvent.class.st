"
I am the superclass of all events in SDL3 FFI bindings.

SDL3 originally provides SDL3Event which is a union of all events.
"
Class {
	#name : 'SDL3MappedEvent',
	#superclass : 'SDL3Structure',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3MappedEvent class >> eventType [
	"Answer the `SDL3EventType` associated to this event. Non-leaf subclasses and `SDL3CommonEvent` answer nil."

	^ nil
]

{ #category : 'visitor' }
SDL3MappedEvent >> accept: aVisitor [

	^ aVisitor visitMappedEvent: self
]
