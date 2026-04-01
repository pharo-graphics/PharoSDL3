"
I represent the `SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3AudioDeviceFormatChangedEvent',
	#superclass : 'SDL3AudioDeviceEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3AudioDeviceFormatChangedEvent class >> eventType [

	^ SDL3EventType audioDeviceFormatChanged
]

{ #category : 'visitor' }
SDL3AudioDeviceFormatChangedEvent >> accept: aVisitor [

	^ aVisitor visitAudioDeviceFormatChangedEvent: self
]
