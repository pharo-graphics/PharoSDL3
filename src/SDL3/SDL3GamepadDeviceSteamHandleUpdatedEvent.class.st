"
I am a FFI structure that represents the `SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED` SDL3 event. The accessing protocol is defined by my superclass.
"
Class {
	#name : 'SDL3GamepadDeviceSteamHandleUpdatedEvent',
	#superclass : 'SDL3GamepadDeviceEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'visitor' }
SDL3GamepadDeviceSteamHandleUpdatedEvent >> accept: aVisitor [

	^ aVisitor visitGamepadDeviceSteamHandleUpdatedEvent: self
]
