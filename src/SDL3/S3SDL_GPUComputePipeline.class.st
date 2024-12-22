Class {
	#name : 'S3SDL_GPUComputePipeline',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
S3SDL_GPUComputePipeline >> dispose [

	self ffiCall: #(void SDL_GPUComputePipeline_dispose(SDL_GPUComputePipeline* self))
]
