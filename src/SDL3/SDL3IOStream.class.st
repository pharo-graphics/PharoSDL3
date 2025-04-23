Class {
	#name : 'SDL3IOStream',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3IOStream >> dispose [

	self ffiCall: #(void SDL_IOStream_dispose(SDL_IOStream* self))
]
