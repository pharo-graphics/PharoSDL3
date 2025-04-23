Class {
	#name : 'SDL3Renderer',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3Renderer >> dispose [

	self ffiCall: #(void SDL_Renderer_dispose(SDL_Renderer* self))
]
