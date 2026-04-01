"
I represent the `SDL_EVENT_JOYSTICK_UPDATE_COMPLETE` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3JoyDeviceUpdateCompleteEvent',
	#superclass : 'SDL3JoyDeviceEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3JoyDeviceUpdateCompleteEvent class >> eventType [

	^ SDL3EventType joystickUpdateComplete
]

{ #category : 'visitor' }
SDL3JoyDeviceUpdateCompleteEvent >> accept: aVisitor [

	^ aVisitor visitJoyDeviceUpdateCompleteEvent: self
]
