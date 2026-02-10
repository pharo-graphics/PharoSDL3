"
I am a FFI structure that represents the `SDL_EVENT_KEYBOARD_REMOVED` SDL3 event. The accessing protocol is defined by my superclass.
"
Class {
	#name : 'SDL3KeyboardDeviceRemovedEvent',
	#superclass : 'SDL3KeyboardDeviceEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'visitor' }
SDL3KeyboardDeviceRemovedEvent >> accept: aVisitor [

	^ aVisitor visitKeyboardDeviceRemovedEvent: self
]
