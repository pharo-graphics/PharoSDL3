Class {
	#name : 'S3SDL_Storage',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
S3SDL_Storage >> dispose [

	self ffiCall: #(void SDL_Storage_dispose(SDL_Storage* self))
]
