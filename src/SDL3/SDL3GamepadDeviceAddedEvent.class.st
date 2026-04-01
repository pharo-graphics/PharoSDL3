"
I represent the `SDL_EVENT_GAMEPAD_ADDED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3GamepadDeviceAddedEvent',
	#superclass : 'SDL3GamepadDeviceEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3GamepadDeviceAddedEvent class >> eventType [

	^ SDL3EventType gamepadAdded
]

{ #category : 'visitor' }
SDL3GamepadDeviceAddedEvent >> accept: aVisitor [

	^ aVisitor visitGamepadDeviceAddedEvent: self
]
