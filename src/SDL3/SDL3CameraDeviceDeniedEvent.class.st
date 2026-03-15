"
I represent the `SDL_EVENT_CAMERA_DEVICE_DENIED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3CameraDeviceDeniedEvent',
	#superclass : 'SDL3CameraDeviceEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3CameraDeviceDeniedEvent class >> eventType [

	^ SDL3EventType cameraDeviceDenied
]

{ #category : 'visitor' }
SDL3CameraDeviceDeniedEvent >> accept: aVisitor [

	^ aVisitor visitCameraDeviceDeniedEvent: self
]
