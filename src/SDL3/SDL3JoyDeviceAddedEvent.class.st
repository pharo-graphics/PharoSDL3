"
I represent the `SDL_EVENT_JOYSTICK_ADDED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3JoyDeviceAddedEvent',
	#superclass : 'SDL3JoyDeviceEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3JoyDeviceAddedEvent class >> eventType [

	^ SDL3EventType joystickAdded
]

{ #category : 'visitor' }
SDL3JoyDeviceAddedEvent >> accept: aVisitor [

	^ aVisitor visitJoyDeviceAddedEvent: self
]
