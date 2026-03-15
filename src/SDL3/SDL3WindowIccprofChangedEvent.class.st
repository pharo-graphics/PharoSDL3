"
I represent the `SDL_EVENT_WINDOW_ICCPROF_CHANGED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3WindowIccprofChangedEvent',
	#superclass : 'SDL3WindowEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3WindowIccprofChangedEvent class >> eventType [

	^ SDL3EventType windowIccprofChanged
]

{ #category : 'visitor' }
SDL3WindowIccprofChangedEvent >> accept: aVisitor [

	^ aVisitor visitWindowIccprofChangedEvent: self
]
