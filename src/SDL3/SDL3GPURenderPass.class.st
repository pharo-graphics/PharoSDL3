Class {
	#name : 'SDL3GPURenderPass',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3GPURenderPass >> dispose [

	self ffiCall: #(void SDL_GPURenderPass_dispose(SDL_GPURenderPass* self))
]
