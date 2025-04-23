Class {
	#name : 'SDL3GPUDevice',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3GPUDevice >> dispose [

	self ffiCall: #(void SDL_GPUDevice_dispose(SDL_GPUDevice* self))
]
