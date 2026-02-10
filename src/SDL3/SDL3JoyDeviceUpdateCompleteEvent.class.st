"
I am a FFI structure that represents the `SDL_EVENT_JOYSTICK_UPDATE_COMPLETE` SDL3 event. The accessing protocol is defined by my superclass.
"
Class {
	#name : 'SDL3JoyDeviceUpdateCompleteEvent',
	#superclass : 'SDL3JoyDeviceEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'visitor' }
SDL3JoyDeviceUpdateCompleteEvent >> accept: aVisitor [

	^ aVisitor visitJoyDeviceUpdateCompleteEvent: self
]
