"
I represent the `SDL_EVENT_MOUSE_REMOVED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3MouseDeviceRemovedEvent',
	#superclass : 'SDL3MouseDeviceEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3MouseDeviceRemovedEvent class >> eventType [

	^ SDL3EventType mouseRemoved
]

{ #category : 'visitor' }
SDL3MouseDeviceRemovedEvent >> accept: aVisitor [

	^ aVisitor visitMouseDeviceRemovedEvent: self
]
