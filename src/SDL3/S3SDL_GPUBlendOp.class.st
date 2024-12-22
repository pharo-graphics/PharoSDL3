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
S3SDL_GPUBlendOp class >> SDL_GPU_BLENDOP_ADD [
	"This method was automatically generated"
	^ SDL_GPU_BLENDOP_ADD
]

{ #category : 'accessing enum' }
S3SDL_GPUBlendOp class >> SDL_GPU_BLENDOP_INVALID [
	"This method was automatically generated"
	^ SDL_GPU_BLENDOP_INVALID
]

{ #category : 'accessing enum' }
S3SDL_GPUBlendOp class >> SDL_GPU_BLENDOP_MAX [
	"This method was automatically generated"
	^ SDL_GPU_BLENDOP_MAX
]

{ #category : 'accessing enum' }
S3SDL_GPUBlendOp class >> SDL_GPU_BLENDOP_MIN [
	"This method was automatically generated"
	^ SDL_GPU_BLENDOP_MIN
]

{ #category : 'accessing enum' }
S3SDL_GPUBlendOp class >> SDL_GPU_BLENDOP_REVERSE_SUBTRACT [
	"This method was automatically generated"
	^ SDL_GPU_BLENDOP_REVERSE_SUBTRACT
]

{ #category : 'accessing enum' }
S3SDL_GPUBlendOp class >> SDL_GPU_BLENDOP_SUBTRACT [
	"This method was automatically generated"
	^ SDL_GPU_BLENDOP_SUBTRACT
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
