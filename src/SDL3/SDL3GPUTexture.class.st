Class {
	#name : 'SDL3GPUTexture',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3GPUTexture >> dispose [

	self ffiCall: #(void SDL_GPUTexture_dispose(SDL_GPUTexture* self))
]
