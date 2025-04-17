Class {
	#name : 'S3SDL_TrayMenu',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
S3SDL_TrayMenu >> dispose [

	self ffiCall: #(void SDL_TrayMenu_dispose(SDL_TrayMenu* self))
]
