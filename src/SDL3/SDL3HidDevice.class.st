Class {
	#name : 'SDL3HidDevice',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3HidDevice >> dispose [

	self ffiCall: #(void SDL_hid_device_dispose(SDL_hid_device* self))
]
