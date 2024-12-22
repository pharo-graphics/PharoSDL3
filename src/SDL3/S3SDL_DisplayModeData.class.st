Class {
	#name : 'S3SDL_DisplayModeData',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
S3SDL_DisplayModeData >> dispose [

	self ffiCall: #(void SDL_DisplayModeData_dispose(SDL_DisplayModeData* self))
]
