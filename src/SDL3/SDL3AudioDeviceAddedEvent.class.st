"
I represent the `SDL_EVENT_AUDIO_DEVICE_ADDED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3AudioDeviceAddedEvent',
	#superclass : 'SDL3AudioDeviceEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3AudioDeviceAddedEvent class >> eventType [

	^ SDL3EventType audioDeviceAdded
]

{ #category : 'visitor' }
SDL3AudioDeviceAddedEvent >> accept: aVisitor [

	^ aVisitor visitAudioDeviceAddedEvent: self
]
