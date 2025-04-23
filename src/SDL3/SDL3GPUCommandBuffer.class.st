Class {
	#name : 'SDL3GPUCommandBuffer',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3GPUCommandBuffer >> dispose [

	self ffiCall: #(void SDL_GPUCommandBuffer_dispose(SDL_GPUCommandBuffer* self))
]
