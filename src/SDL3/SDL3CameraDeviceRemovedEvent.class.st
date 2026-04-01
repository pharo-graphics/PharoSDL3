"
I represent the `SDL_EVENT_CAMERA_DEVICE_REMOVED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3CameraDeviceRemovedEvent',
	#superclass : 'SDL3CameraDeviceEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3CameraDeviceRemovedEvent class >> eventType [

	^ SDL3EventType cameraDeviceRemoved
]

{ #category : 'visitor' }
SDL3CameraDeviceRemovedEvent >> accept: aVisitor [

	^ aVisitor visitCameraDeviceRemovedEvent: self
]
