Class {
	#name : 'S3SDL_RWLock',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
S3SDL_RWLock >> dispose [

	self ffiCall: #(void SDL_RWLock_dispose(SDL_RWLock* self))
]
