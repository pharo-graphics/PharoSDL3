"
I represent the `SDL_EVENT_GAMEPAD_REMAPPED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3GamepadDeviceRemappedEvent',
	#superclass : 'SDL3GamepadDeviceEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3GamepadDeviceRemappedEvent class >> eventType [

	^ SDL3EventType gamepadRemapped
]

{ #category : 'visitor' }
SDL3GamepadDeviceRemappedEvent >> accept: aVisitor [

	^ aVisitor visitGamepadDeviceRemappedEvent: self
]
