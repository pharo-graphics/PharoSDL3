Class {
	#name : 'SDL3Joystick',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3Joystick >> dispose [

	self ffiCall: #(void SDL_Joystick_dispose(SDL_Joystick* self))
]
