Class {
	#name : 'SDL3GPUFence',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3GPUFence >> dispose [

	self ffiCall: #(void SDL_GPUFence_dispose(SDL_GPUFence* self))
]
