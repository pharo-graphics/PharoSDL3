Class {
	#name : 'SDL3Semaphore',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3Semaphore >> dispose [

	self ffiCall: #(void SDL_Semaphore_dispose(SDL_Semaphore* self))
]
