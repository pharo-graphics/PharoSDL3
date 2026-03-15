"
I represent the `SDL_EVENT_RENDER_DEVICE_RESET` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3RenderDeviceResetEvent',
	#superclass : 'SDL3RenderEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3RenderDeviceResetEvent class >> eventType [

	^ SDL3EventType renderDeviceReset
]

{ #category : 'visitor' }
SDL3RenderDeviceResetEvent >> accept: aVisitor [

	^ aVisitor visitRenderDeviceResetEvent: self
]
