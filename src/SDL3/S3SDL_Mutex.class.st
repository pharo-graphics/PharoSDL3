Class {
	#name : 'S3SDL_Mutex',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
S3SDL_Mutex >> dispose [

	self ffiCall: #(void SDL_Mutex_dispose(SDL_Mutex* self))
]
