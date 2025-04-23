Class {
	#name : 'SDL3GPUComputePipeline',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3GPUComputePipeline >> dispose [

	self ffiCall: #(void SDL_GPUComputePipeline_dispose(SDL_GPUComputePipeline* self))
]
