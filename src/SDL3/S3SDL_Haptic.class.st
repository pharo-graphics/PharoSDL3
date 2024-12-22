Class {
	#name : 'S3SDL_Haptic',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
S3SDL_Haptic >> dispose [

	self ffiCall: #(void SDL_Haptic_dispose(SDL_Haptic* self))
]
