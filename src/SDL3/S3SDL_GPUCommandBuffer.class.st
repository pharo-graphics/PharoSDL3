Class {
	#name : 'S3SDL_GPUCommandBuffer',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
S3SDL_GPUCommandBuffer >> dispose [

	self ffiCall: #(void SDL_GPUCommandBuffer_dispose(SDL_GPUCommandBuffer* self))
]
