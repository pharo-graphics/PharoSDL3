Class {
	#name : 'SDL3GPUTransferBuffer',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3GPUTransferBuffer >> dispose [

	self ffiCall: #(void SDL_GPUTransferBuffer_dispose(SDL_GPUTransferBuffer* self))
]
