Class {
	#name : 'SDL3GPURenderState',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3GPURenderState >> dispose [

	self ffiCall: #(void SDL_GPURenderState_dispose(SDL_GPURenderState* self))
]
