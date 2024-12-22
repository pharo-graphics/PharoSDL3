Class {
	#name : 'S3SDL_SharedObject',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
S3SDL_SharedObject >> dispose [

	self ffiCall: #(void SDL_SharedObject_dispose(SDL_SharedObject* self))
]
