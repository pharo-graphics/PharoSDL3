Class {
	#name : 'SDL3GPUCopyPass',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3GPUCopyPass >> dispose [

	self ffiCall: #(void SDL_GPUCopyPass_dispose(SDL_GPUCopyPass* self))
]
