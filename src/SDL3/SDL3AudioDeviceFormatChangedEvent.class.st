"
I am a FFI structure that represents the `SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED` SDL3 event. The accessing protocol is defined by my superclass.
"
Class {
	#name : 'SDL3AudioDeviceFormatChangedEvent',
	#superclass : 'SDL3AudioDeviceEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'visitor' }
SDL3AudioDeviceFormatChangedEvent >> accept: aVisitor [

	^ aVisitor visitAudioDeviceFormatChangedEvent: self
]
