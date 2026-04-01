"
I represent the `SDL_EVENT_JOYSTICK_REMOVED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3JoyDeviceRemovedEvent',
	#superclass : 'SDL3JoyDeviceEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3JoyDeviceRemovedEvent class >> eventType [

	^ SDL3EventType joystickRemoved
]

{ #category : 'visitor' }
SDL3JoyDeviceRemovedEvent >> accept: aVisitor [

	^ aVisitor visitJoyDeviceRemovedEvent: self
]
