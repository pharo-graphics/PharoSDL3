"
My subclasses are related to a joystick.
"
Class {
	#name : 'SDL3JoystickEvent',
	#superclass : 'SDL3MappedEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'visitor' }
SDL3JoystickEvent >> accept: aVisitor [

	^ aVisitor visitJoystickEvent: self
]
