Class {
	#name : 'SDL3GPUBuffer',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3GPUBuffer >> dispose [

	self ffiCall: #(void SDL_GPUBuffer_dispose(SDL_GPUBuffer* self))
]
