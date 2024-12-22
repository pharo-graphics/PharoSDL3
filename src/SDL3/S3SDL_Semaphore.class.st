Class {
	#name : 'S3SDL_Semaphore',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
S3SDL_Semaphore >> dispose [

	self ffiCall: #(void SDL_Semaphore_dispose(SDL_Semaphore* self))
]
