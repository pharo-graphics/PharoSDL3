Class {
	#name : 'S3SDL_AudioStream',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
S3SDL_AudioStream >> dispose [

	self ffiCall: #(void SDL_AudioStream_dispose(SDL_AudioStream* self))
]
