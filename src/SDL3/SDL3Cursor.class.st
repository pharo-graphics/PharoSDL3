Class {
	#name : 'SDL3Cursor',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3Cursor >> dispose [

	self ffiCall: #(void SDL_Cursor_dispose(SDL_Cursor* self))
]
