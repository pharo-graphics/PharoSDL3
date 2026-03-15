"
I represent the `SDL_EVENT_GAMEPAD_REMOVED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3GamepadDeviceRemovedEvent',
	#superclass : 'SDL3GamepadDeviceEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3GamepadDeviceRemovedEvent class >> eventType [

	^ SDL3EventType gamepadRemoved
]

{ #category : 'visitor' }
SDL3GamepadDeviceRemovedEvent >> accept: aVisitor [

	^ aVisitor visitGamepadDeviceRemovedEvent: self
]
