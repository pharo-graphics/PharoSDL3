Class {
	#name : 'S3SDL_GPUDevice',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
S3SDL_GPUDevice >> dispose [

	self ffiCall: #(void SDL_GPUDevice_dispose(SDL_GPUDevice* self))
]
