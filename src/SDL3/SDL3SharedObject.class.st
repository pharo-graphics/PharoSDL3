Class {
	#name : 'SDL3SharedObject',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3SharedObject >> dispose [

	self ffiCall: #(void SDL_SharedObject_dispose(SDL_SharedObject* self))
]
