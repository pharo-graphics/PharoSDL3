Class {
	#name : 'SDL3AsyncIOQueue',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3AsyncIOQueue >> dispose [

	self ffiCall: #(void SDL_AsyncIOQueue_dispose(SDL_AsyncIOQueue* self))
]
