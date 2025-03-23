Class {
	#name : 'S3SDL_Environment',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
S3SDL_Environment >> dispose [

	self ffiCall: #(void SDL_Environment_dispose(SDL_Environment* self))
]
