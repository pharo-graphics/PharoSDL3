Class {
	#name : 'SDL3Process',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3Process >> dispose [

	self ffiCall: #(void SDL_Process_dispose(SDL_Process* self))
]
