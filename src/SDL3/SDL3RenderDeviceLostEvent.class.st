"
I represent the `SDL_EVENT_RENDER_DEVICE_LOST` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3RenderDeviceLostEvent',
	#superclass : 'SDL3RenderEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3RenderDeviceLostEvent class >> eventType [

	^ SDL3EventType renderDeviceLost
]

{ #category : 'visitor' }
SDL3RenderDeviceLostEvent >> accept: aVisitor [

	^ aVisitor visitRenderDeviceLostEvent: self
]
