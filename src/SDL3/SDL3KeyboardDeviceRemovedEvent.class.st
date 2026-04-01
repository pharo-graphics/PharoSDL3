"
I represent the `SDL_EVENT_KEYBOARD_REMOVED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3KeyboardDeviceRemovedEvent',
	#superclass : 'SDL3KeyboardDeviceEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3KeyboardDeviceRemovedEvent class >> eventType [

	^ SDL3EventType keyboardRemoved
]

{ #category : 'visitor' }
SDL3KeyboardDeviceRemovedEvent >> accept: aVisitor [

	^ aVisitor visitKeyboardDeviceRemovedEvent: self
]
