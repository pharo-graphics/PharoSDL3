Class {
	#name : 'SDL3RWLock',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3RWLock >> dispose [

	self ffiCall: #(void SDL_RWLock_dispose(SDL_RWLock* self))
]
