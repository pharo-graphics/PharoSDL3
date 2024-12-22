Class {
	#name : 'S3SDL_Camera',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
S3SDL_Camera >> dispose [

	self ffiCall: #(void SDL_Camera_dispose(SDL_Camera* self))
]
