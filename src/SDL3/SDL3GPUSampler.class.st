Class {
	#name : 'SDL3GPUSampler',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3GPUSampler >> dispose [

	self ffiCall: #(void SDL_GPUSampler_dispose(SDL_GPUSampler* self))
]
