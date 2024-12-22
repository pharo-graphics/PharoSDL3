Class {
	#name : 'S3SDL_Condition',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
S3SDL_Condition >> dispose [

	self ffiCall: #(void SDL_Condition_dispose(SDL_Condition* self))
]
