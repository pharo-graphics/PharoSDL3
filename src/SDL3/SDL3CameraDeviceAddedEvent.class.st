"
I am a FFI structure that represents the `SDL_EVENT_CAMERA_DEVICE_ADDED` SDL3 event. The accessing protocol is defined by my superclass.
"
Class {
	#name : 'SDL3CameraDeviceAddedEvent',
	#superclass : 'SDL3CameraDeviceEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'visitor' }
SDL3CameraDeviceAddedEvent >> accept: aVisitor [

	^ aVisitor visitCameraDeviceAddedEvent: self
]
