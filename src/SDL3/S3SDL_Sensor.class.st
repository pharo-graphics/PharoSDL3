Class {
	#name : 'S3SDL_Sensor',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
S3SDL_Sensor >> dispose [

	self ffiCall: #(void SDL_Sensor_dispose(SDL_Sensor* self))
]
