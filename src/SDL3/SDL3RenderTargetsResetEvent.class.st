"
I am a FFI structure that represents the `SDL_EVENT_RENDER_TARGETS_RESET` SDL3 event. The accessing protocol is defined by my superclass.
"
Class {
	#name : 'SDL3RenderTargetsResetEvent',
	#superclass : 'SDL3RenderEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'visitor' }
SDL3RenderTargetsResetEvent >> accept: aVisitor [

	^ aVisitor visitRenderTargetsResetEvent: self
]
