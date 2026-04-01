"
I represent the `SDL_EVENT_GAMEPAD_UPDATE_COMPLETE` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3GamepadDeviceUpdateCompleteEvent',
	#superclass : 'SDL3GamepadDeviceEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3GamepadDeviceUpdateCompleteEvent class >> eventType [

	^ SDL3EventType gamepadUpdateComplete
]

{ #category : 'visitor' }
SDL3GamepadDeviceUpdateCompleteEvent >> accept: aVisitor [

	^ aVisitor visitGamepadDeviceUpdateCompleteEvent: self
]
