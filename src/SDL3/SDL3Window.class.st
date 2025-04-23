Class {
	#name : 'SDL3Window',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3Window >> dispose [

	self ffiCall: #(void SDL_Window_dispose(SDL_Window* self))
]
