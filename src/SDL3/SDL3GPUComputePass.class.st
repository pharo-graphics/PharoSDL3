Class {
	#name : 'SDL3GPUComputePass',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3GPUComputePass >> dispose [

	self ffiCall: #(void SDL_GPUComputePass_dispose(SDL_GPUComputePass* self))
]
