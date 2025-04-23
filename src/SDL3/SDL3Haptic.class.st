Class {
	#name : 'SDL3Haptic',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3Haptic >> dispose [

	self ffiCall: #(void SDL_Haptic_dispose(SDL_Haptic* self))
]
