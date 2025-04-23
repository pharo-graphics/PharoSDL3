Class {
	#name : 'SDL3Tray',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3Tray >> dispose [

	self ffiCall: #(void SDL_Tray_dispose(SDL_Tray* self))
]
