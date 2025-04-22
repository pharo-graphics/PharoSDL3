Class {
	#name : 'S3SDL_GPUBlendOp',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_GPU_BLENDOP_ADD',
		'SDL_GPU_BLENDOP_INVALID',
		'SDL_GPU_BLENDOP_MAX',
		'SDL_GPU_BLENDOP_MIN',
		'SDL_GPU_BLENDOP_REVERSE_SUBTRACT',
		'SDL_GPU_BLENDOP_SUBTRACT'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
S3SDL_GPUBlendOp class >> add [
	"This method was automatically generated"
	^ SDL_GPU_BLENDOP_ADD
]

{ #category : 'enum declaration' }
S3SDL_GPUBlendOp class >> enumDecl [

	^ #(
	SDL_GPU_BLENDOP_INVALID 0
	SDL_GPU_BLENDOP_ADD 1
	SDL_GPU_BLENDOP_SUBTRACT 2
	SDL_GPU_BLENDOP_REVERSE_SUBTRACT 3
	SDL_GPU_BLENDOP_MIN 4
	SDL_GPU_BLENDOP_MAX 5 )
]

{ #category : 'accessing enum' }
S3SDL_GPUBlendOp class >> invalid [
	"This method was automatically generated"
	^ SDL_GPU_BLENDOP_INVALID
]

{ #category : 'accessing enum' }
S3SDL_GPUBlendOp class >> max [
	"This method was automatically generated"
	^ SDL_GPU_BLENDOP_MAX
]

{ #category : 'accessing enum' }
S3SDL_GPUBlendOp class >> min [
	"This method was automatically generated"
	^ SDL_GPU_BLENDOP_MIN
]

{ #category : 'accessing enum' }
S3SDL_GPUBlendOp class >> reverseSubtract [
	"This method was automatically generated"
	^ SDL_GPU_BLENDOP_REVERSE_SUBTRACT
]

{ #category : 'accessing enum' }
S3SDL_GPUBlendOp class >> subtract [
	"This method was automatically generated"
	^ SDL_GPU_BLENDOP_SUBTRACT
]
