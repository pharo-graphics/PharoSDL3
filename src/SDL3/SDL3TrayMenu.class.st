Class {
	#name : 'SDL3TrayMenu',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3TrayMenu >> dispose [

	self ffiCall: #(void SDL_TrayMenu_dispose(SDL_TrayMenu* self))
]
