Class {
	#name : 'S3SDL_Renderer',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
S3SDL_Renderer >> dispose [

	self ffiCall: #(void SDL_Renderer_dispose(SDL_Renderer* self))
]
