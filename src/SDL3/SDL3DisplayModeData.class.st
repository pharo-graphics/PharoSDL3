Class {
	#name : 'SDL3DisplayModeData',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3DisplayModeData >> dispose [

	self ffiCall: #(void SDL_DisplayModeData_dispose(SDL_DisplayModeData* self))
]
