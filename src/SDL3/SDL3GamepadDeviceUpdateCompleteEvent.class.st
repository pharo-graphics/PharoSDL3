"
I am a FFI structure that represents the `SDL_EVENT_GAMEPAD_UPDATE_COMPLETE` SDL3 event. The accessing protocol is defined by my superclass.
"
Class {
	#name : 'SDL3GamepadDeviceUpdateCompleteEvent',
	#superclass : 'SDL3GamepadDeviceEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'visitor' }
SDL3GamepadDeviceUpdateCompleteEvent >> accept: aVisitor [

	^ aVisitor visitGamepadDeviceUpdateCompleteEvent: self
]
