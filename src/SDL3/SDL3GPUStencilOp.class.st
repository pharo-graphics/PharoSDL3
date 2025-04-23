Class {
	#name : 'SDL3GPUStencilOp',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_GPU_STENCILOP_DECREMENT_AND_CLAMP',
		'SDL_GPU_STENCILOP_DECREMENT_AND_WRAP',
		'SDL_GPU_STENCILOP_INCREMENT_AND_CLAMP',
		'SDL_GPU_STENCILOP_INCREMENT_AND_WRAP',
		'SDL_GPU_STENCILOP_INVALID',
		'SDL_GPU_STENCILOP_INVERT',
		'SDL_GPU_STENCILOP_KEEP',
		'SDL_GPU_STENCILOP_REPLACE',
		'SDL_GPU_STENCILOP_ZERO'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
SDL3GPUStencilOp class >> decrementAndClamp [
	"This method was automatically generated"
	^ SDL_GPU_STENCILOP_DECREMENT_AND_CLAMP
]

{ #category : 'accessing enum' }
SDL3GPUStencilOp class >> decrementAndWrap [
	"This method was automatically generated"
	^ SDL_GPU_STENCILOP_DECREMENT_AND_WRAP
]

{ #category : 'enum declaration' }
SDL3GPUStencilOp class >> enumDecl [

	^ #(
	SDL_GPU_STENCILOP_INVALID 0
	SDL_GPU_STENCILOP_KEEP 1
	SDL_GPU_STENCILOP_ZERO 2
	SDL_GPU_STENCILOP_REPLACE 3
	SDL_GPU_STENCILOP_INCREMENT_AND_CLAMP 4
	SDL_GPU_STENCILOP_DECREMENT_AND_CLAMP 5
	SDL_GPU_STENCILOP_INVERT 6
	SDL_GPU_STENCILOP_INCREMENT_AND_WRAP 7
	SDL_GPU_STENCILOP_DECREMENT_AND_WRAP 8 )
]

{ #category : 'accessing enum' }
SDL3GPUStencilOp class >> incrementAndClamp [
	"This method was automatically generated"
	^ SDL_GPU_STENCILOP_INCREMENT_AND_CLAMP
]

{ #category : 'accessing enum' }
SDL3GPUStencilOp class >> incrementAndWrap [
	"This method was automatically generated"
	^ SDL_GPU_STENCILOP_INCREMENT_AND_WRAP
]

{ #category : 'accessing enum' }
SDL3GPUStencilOp class >> invalid [
	"This method was automatically generated"
	^ SDL_GPU_STENCILOP_INVALID
]

{ #category : 'accessing enum' }
SDL3GPUStencilOp class >> invert [
	"This method was automatically generated"
	^ SDL_GPU_STENCILOP_INVERT
]

{ #category : 'accessing enum' }
SDL3GPUStencilOp class >> keep [
	"This method was automatically generated"
	^ SDL_GPU_STENCILOP_KEEP
]

{ #category : 'accessing enum' }
SDL3GPUStencilOp class >> replace [
	"This method was automatically generated"
	^ SDL_GPU_STENCILOP_REPLACE
]

{ #category : 'accessing enum' }
SDL3GPUStencilOp class >> zero [
	"This method was automatically generated"
	^ SDL_GPU_STENCILOP_ZERO
]
