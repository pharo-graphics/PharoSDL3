Class {
	#name : 'S3SDL_GPUTexture',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
S3SDL_GPUTexture >> dispose [

	self ffiCall: #(void SDL_GPUTexture_dispose(SDL_GPUTexture* self))
]
