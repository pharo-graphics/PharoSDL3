Class {
	#name : 'SDL3Thread',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3Thread >> dispose [

	self ffiCall: #(void SDL_Thread_dispose(SDL_Thread* self))
]
