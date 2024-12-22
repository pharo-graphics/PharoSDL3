Class {
	#name : 'S3SDL_Cursor',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
S3SDL_Cursor >> dispose [

	self ffiCall: #(void SDL_Cursor_dispose(SDL_Cursor* self))
]
