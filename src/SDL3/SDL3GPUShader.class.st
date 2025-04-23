Class {
	#name : 'SDL3GPUShader',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3GPUShader >> dispose [

	self ffiCall: #(void SDL_GPUShader_dispose(SDL_GPUShader* self))
]
