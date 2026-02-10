"
My subclasses are related to a pluggable device
"
Class {
	#name : 'SDL3DeviceEvent',
	#superclass : 'SDL3MappedEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'visitor' }
SDL3DeviceEvent >> accept: aVisitor [

	^ aVisitor visitDeviceEvent: self
]
