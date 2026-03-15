"
I represent the `SDL_EVENT_CAMERA_DEVICE_APPROVED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3CameraDeviceApprovedEvent',
	#superclass : 'SDL3CameraDeviceEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3CameraDeviceApprovedEvent class >> eventType [

	^ SDL3EventType cameraDeviceApproved
]

{ #category : 'visitor' }
SDL3CameraDeviceApprovedEvent >> accept: aVisitor [

	^ aVisitor visitCameraDeviceApprovedEvent: self
]
