"
I represent the `SDL_EVENT_RENDER_TARGETS_RESET` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3RenderTargetsResetEvent',
	#superclass : 'SDL3RenderEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3RenderTargetsResetEvent class >> eventType [

	^ SDL3EventType renderTargetsReset
]

{ #category : 'visitor' }
SDL3RenderTargetsResetEvent >> accept: aVisitor [

	^ aVisitor visitRenderTargetsResetEvent: self
]
