Class {
	#name : 'S3SDL_GPUBuffer',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
S3SDL_GPUBuffer >> dispose [

	self ffiCall: #(void SDL_GPUBuffer_dispose(SDL_GPUBuffer* self))
]
