"
I represent the `SDL_EVENT_CAMERA_DEVICE_ADDED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3CameraDeviceAddedEvent',
	#superclass : 'SDL3CameraDeviceEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3CameraDeviceAddedEvent class >> eventType [

	^ SDL3EventType cameraDeviceAdded
]

{ #category : 'visitor' }
SDL3CameraDeviceAddedEvent >> accept: aVisitor [

	^ aVisitor visitCameraDeviceAddedEvent: self
]
