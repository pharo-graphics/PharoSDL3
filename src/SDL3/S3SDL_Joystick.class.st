Class {
	#name : 'S3SDL_Joystick',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
S3SDL_Joystick >> dispose [

	self ffiCall: #(void SDL_Joystick_dispose(SDL_Joystick* self))
]
