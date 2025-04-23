Class {
	#name : 'SDL3Mutex',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3Mutex >> dispose [

	self ffiCall: #(void SDL_Mutex_dispose(SDL_Mutex* self))
]
