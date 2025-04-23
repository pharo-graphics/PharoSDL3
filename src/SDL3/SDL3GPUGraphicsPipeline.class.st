Class {
	#name : 'SDL3GPUGraphicsPipeline',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3GPUGraphicsPipeline >> dispose [

	self ffiCall: #(void SDL_GPUGraphicsPipeline_dispose(SDL_GPUGraphicsPipeline* self))
]
