Class {
	#name : 'SDL3AudioStream',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3AudioStream >> dispose [

	self ffiCall: #(void SDL_AudioStream_dispose(SDL_AudioStream* self))
]
