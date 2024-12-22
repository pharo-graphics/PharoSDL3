Class {
	#name : 'S3SDL_hid_device',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
S3SDL_hid_device >> dispose [

	self ffiCall: #(void SDL_hid_device_dispose(SDL_hid_device* self))
]
