"
I represent the `SDL_EVENT_KEYBOARD_ADDED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3KeyboardDeviceAddedEvent',
	#superclass : 'SDL3KeyboardDeviceEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3KeyboardDeviceAddedEvent class >> eventType [

	^ SDL3EventType keyboardAdded
]

{ #category : 'visitor' }
SDL3KeyboardDeviceAddedEvent >> accept: aVisitor [

	^ aVisitor visitKeyboardDeviceAddedEvent: self
]
