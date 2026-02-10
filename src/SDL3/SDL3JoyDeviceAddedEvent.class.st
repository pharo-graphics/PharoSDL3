"
I am a FFI structure that represents the `SDL_EVENT_JOYSTICK_ADDED` SDL3 event. The accessing protocol is defined by my superclass.
"
Class {
	#name : 'SDL3JoyDeviceAddedEvent',
	#superclass : 'SDL3JoyDeviceEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'visitor' }
SDL3JoyDeviceAddedEvent >> accept: aVisitor [

	^ aVisitor visitJoyDeviceAddedEvent: self
]
