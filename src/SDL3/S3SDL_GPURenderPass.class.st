Class {
	#name : 'S3SDL_GPURenderPass',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
S3SDL_GPURenderPass >> dispose [

	self ffiCall: #(void SDL_GPURenderPass_dispose(SDL_GPURenderPass* self))
]
