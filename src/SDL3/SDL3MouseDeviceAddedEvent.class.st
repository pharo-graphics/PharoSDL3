"
I represent the `SDL_EVENT_MOUSE_ADDED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3MouseDeviceAddedEvent',
	#superclass : 'SDL3MouseDeviceEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3MouseDeviceAddedEvent class >> eventType [

	^ SDL3EventType mouseAdded
]

{ #category : 'visitor' }
SDL3MouseDeviceAddedEvent >> accept: aVisitor [

	^ aVisitor visitMouseDeviceAddedEvent: self
]
