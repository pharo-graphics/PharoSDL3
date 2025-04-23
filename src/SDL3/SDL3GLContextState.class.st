Class {
	#name : 'SDL3GLContextState',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3GLContextState >> dispose [

	self ffiCall: #(void SDL_GLContextState_dispose(SDL_GLContextState* self))
]
