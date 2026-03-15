"
I represent the `SDL_EVENT_WINDOW_METAL_VIEW_RESIZED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3WindowMetalViewResizedEvent',
	#superclass : 'SDL3WindowEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3WindowMetalViewResizedEvent class >> eventType [

	^ SDL3EventType windowMetalViewResized
]

{ #category : 'visitor' }
SDL3WindowMetalViewResizedEvent >> accept: aVisitor [

	^ aVisitor visitWindowMetalViewResizedEvent: self
]
