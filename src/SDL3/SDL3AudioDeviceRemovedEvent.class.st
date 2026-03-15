"
I represent the `SDL_EVENT_AUDIO_DEVICE_REMOVED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3AudioDeviceRemovedEvent',
	#superclass : 'SDL3AudioDeviceEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3AudioDeviceRemovedEvent class >> eventType [

	^ SDL3EventType audioDeviceRemoved
]

{ #category : 'visitor' }
SDL3AudioDeviceRemovedEvent >> accept: aVisitor [

	^ aVisitor visitAudioDeviceRemovedEvent: self
]
