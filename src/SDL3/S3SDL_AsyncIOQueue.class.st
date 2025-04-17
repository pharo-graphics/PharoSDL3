Class {
	#name : 'S3SDL_AsyncIOQueue',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
S3SDL_AsyncIOQueue >> dispose [

	self ffiCall: #(void SDL_AsyncIOQueue_dispose(SDL_AsyncIOQueue* self))
]
