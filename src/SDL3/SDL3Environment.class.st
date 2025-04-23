Class {
	#name : 'SDL3Environment',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3Environment >> dispose [

	self ffiCall: #(void SDL_Environment_dispose(SDL_Environment* self))
]
