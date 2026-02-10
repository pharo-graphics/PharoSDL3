"
I am a FFI structure that represents the `SDL_EVENT_MOUSE_ADDED` SDL3 event. The accessing protocol is defined by my superclass.
"
Class {
	#name : 'SDL3MouseDeviceAddedEvent',
	#superclass : 'SDL3MouseDeviceEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'visitor' }
SDL3MouseDeviceAddedEvent >> accept: aVisitor [

	^ aVisitor visitMouseDeviceAddedEvent: self
]
