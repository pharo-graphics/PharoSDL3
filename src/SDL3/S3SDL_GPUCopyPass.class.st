Class {
	#name : 'S3SDL_GPUCopyPass',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
S3SDL_GPUCopyPass >> dispose [

	self ffiCall: #(void SDL_GPUCopyPass_dispose(SDL_GPUCopyPass* self))
]
