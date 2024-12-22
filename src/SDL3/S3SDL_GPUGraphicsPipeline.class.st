Class {
	#name : 'S3SDL_GPUGraphicsPipeline',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
S3SDL_GPUGraphicsPipeline >> dispose [

	self ffiCall: #(void SDL_GPUGraphicsPipeline_dispose(SDL_GPUGraphicsPipeline* self))
]
