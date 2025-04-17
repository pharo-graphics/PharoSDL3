Class {
	#name : 'S3SDL_AsyncIO',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
S3SDL_AsyncIO >> dispose [

	self ffiCall: #(void SDL_AsyncIO_dispose(SDL_AsyncIO* self))
]
