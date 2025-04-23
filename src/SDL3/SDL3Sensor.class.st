Class {
	#name : 'SDL3Sensor',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3Sensor >> dispose [

	self ffiCall: #(void SDL_Sensor_dispose(SDL_Sensor* self))
]
