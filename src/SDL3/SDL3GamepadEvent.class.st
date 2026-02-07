"
My subclasses are related to a gamepad.
"
Class {
	#name : 'SDL3GamepadEvent',
	#superclass : 'SDL3MappedEvent',
	#category : 'SDL3-Own',
	#package : 'SDL3',
	#tag : 'Own'
}

{ #category : 'visitor' }
SDL3GamepadEvent >> accept: aVisitor [

	^ aVisitor visitGamepadEvent: self
]
