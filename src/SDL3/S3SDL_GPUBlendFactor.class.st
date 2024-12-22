Class {
	#name : 'S3SDL_GPUBlendFactor',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_GPU_BLENDFACTOR_CONSTANT_COLOR',
		'SDL_GPU_BLENDFACTOR_DST_ALPHA',
		'SDL_GPU_BLENDFACTOR_DST_COLOR',
		'SDL_GPU_BLENDFACTOR_INVALID',
		'SDL_GPU_BLENDFACTOR_ONE',
		'SDL_GPU_BLENDFACTOR_ONE_MINUS_CONSTANT_COLOR',
		'SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_ALPHA',
		'SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_COLOR',
		'SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA',
		'SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_COLOR',
		'SDL_GPU_BLENDFACTOR_SRC_ALPHA',
		'SDL_GPU_BLENDFACTOR_SRC_ALPHA_SATURATE',
		'SDL_GPU_BLENDFACTOR_SRC_COLOR',
		'SDL_GPU_BLENDFACTOR_ZERO'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
S3SDL_GPUBlendFactor class >> SDL_GPU_BLENDFACTOR_CONSTANT_COLOR [
	"This method was automatically generated"
	^ SDL_GPU_BLENDFACTOR_CONSTANT_COLOR
]

{ #category : 'accessing enum' }
S3SDL_GPUBlendFactor class >> SDL_GPU_BLENDFACTOR_DST_ALPHA [
	"This method was automatically generated"
	^ SDL_GPU_BLENDFACTOR_DST_ALPHA
]

{ #category : 'accessing enum' }
S3SDL_GPUBlendFactor class >> SDL_GPU_BLENDFACTOR_DST_COLOR [
	"This method was automatically generated"
	^ SDL_GPU_BLENDFACTOR_DST_COLOR
]

{ #category : 'accessing enum' }
S3SDL_GPUBlendFactor class >> SDL_GPU_BLENDFACTOR_INVALID [
	"This method was automatically generated"
	^ SDL_GPU_BLENDFACTOR_INVALID
]

{ #category : 'accessing enum' }
S3SDL_GPUBlendFactor class >> SDL_GPU_BLENDFACTOR_ONE [
	"This method was automatically generated"
	^ SDL_GPU_BLENDFACTOR_ONE
]

{ #category : 'accessing enum' }
S3SDL_GPUBlendFactor class >> SDL_GPU_BLENDFACTOR_ONE_MINUS_CONSTANT_COLOR [
	"This method was automatically generated"
	^ SDL_GPU_BLENDFACTOR_ONE_MINUS_CONSTANT_COLOR
]

{ #category : 'accessing enum' }
S3SDL_GPUBlendFactor class >> SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_ALPHA [
	"This method was automatically generated"
	^ SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_ALPHA
]

{ #category : 'accessing enum' }
S3SDL_GPUBlendFactor class >> SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_COLOR [
	"This method was automatically generated"
	^ SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_COLOR
]

{ #category : 'accessing enum' }
S3SDL_GPUBlendFactor class >> SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA [
	"This method was automatically generated"
	^ SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA
]

{ #category : 'accessing enum' }
S3SDL_GPUBlendFactor class >> SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_COLOR [
	"This method was automatically generated"
	^ SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_COLOR
]

{ #category : 'accessing enum' }
S3SDL_GPUBlendFactor class >> SDL_GPU_BLENDFACTOR_SRC_ALPHA [
	"This method was automatically generated"
	^ SDL_GPU_BLENDFACTOR_SRC_ALPHA
]

{ #category : 'accessing enum' }
S3SDL_GPUBlendFactor class >> SDL_GPU_BLENDFACTOR_SRC_ALPHA_SATURATE [
	"This method was automatically generated"
	^ SDL_GPU_BLENDFACTOR_SRC_ALPHA_SATURATE
]

{ #category : 'accessing enum' }
S3SDL_GPUBlendFactor class >> SDL_GPU_BLENDFACTOR_SRC_COLOR [
	"This method was automatically generated"
	^ SDL_GPU_BLENDFACTOR_SRC_COLOR
]

{ #category : 'accessing enum' }
S3SDL_GPUBlendFactor class >> SDL_GPU_BLENDFACTOR_ZERO [
	"This method was automatically generated"
	^ SDL_GPU_BLENDFACTOR_ZERO
]

{ #category : 'enum declaration' }
S3SDL_GPUBlendFactor class >> enumDecl [

	^ #(
	SDL_GPU_BLENDFACTOR_INVALID 0
	SDL_GPU_BLENDFACTOR_ZERO 1
	SDL_GPU_BLENDFACTOR_ONE 2
	SDL_GPU_BLENDFACTOR_SRC_COLOR 3
	SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_COLOR 4
	SDL_GPU_BLENDFACTOR_DST_COLOR 5
	SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_COLOR 6
	SDL_GPU_BLENDFACTOR_SRC_ALPHA 7
	SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA 8
	SDL_GPU_BLENDFACTOR_DST_ALPHA 9
	SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_ALPHA 10
	SDL_GPU_BLENDFACTOR_CONSTANT_COLOR 11
	SDL_GPU_BLENDFACTOR_ONE_MINUS_CONSTANT_COLOR 12
	SDL_GPU_BLENDFACTOR_SRC_ALPHA_SATURATE 13 )
]
