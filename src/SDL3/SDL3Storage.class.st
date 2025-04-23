Class {
	#name : 'SDL3Storage',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3Storage >> dispose [

	self ffiCall: #(void SDL_Storage_dispose(SDL_Storage* self))
]
