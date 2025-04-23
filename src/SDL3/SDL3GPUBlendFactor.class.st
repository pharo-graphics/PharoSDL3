Class {
	#name : 'SDL3GPUBlendFactor',
	#superclass : 'SDL3Enumeration',
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
SDL3GPUBlendFactor class >> constantColor [
	"This method was automatically generated"
	^ SDL_GPU_BLENDFACTOR_CONSTANT_COLOR
]

{ #category : 'accessing enum' }
SDL3GPUBlendFactor class >> dstAlpha [
	"This method was automatically generated"
	^ SDL_GPU_BLENDFACTOR_DST_ALPHA
]

{ #category : 'accessing enum' }
SDL3GPUBlendFactor class >> dstColor [
	"This method was automatically generated"
	^ SDL_GPU_BLENDFACTOR_DST_COLOR
]

{ #category : 'enum declaration' }
SDL3GPUBlendFactor class >> enumDecl [

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

{ #category : 'accessing enum' }
SDL3GPUBlendFactor class >> invalid [
	"This method was automatically generated"
	^ SDL_GPU_BLENDFACTOR_INVALID
]

{ #category : 'accessing enum' }
SDL3GPUBlendFactor class >> one [
	"This method was automatically generated"
	^ SDL_GPU_BLENDFACTOR_ONE
]

{ #category : 'accessing enum' }
SDL3GPUBlendFactor class >> oneMinusConstantColor [
	"This method was automatically generated"
	^ SDL_GPU_BLENDFACTOR_ONE_MINUS_CONSTANT_COLOR
]

{ #category : 'accessing enum' }
SDL3GPUBlendFactor class >> oneMinusDstAlpha [
	"This method was automatically generated"
	^ SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_ALPHA
]

{ #category : 'accessing enum' }
SDL3GPUBlendFactor class >> oneMinusDstColor [
	"This method was automatically generated"
	^ SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_COLOR
]

{ #category : 'accessing enum' }
SDL3GPUBlendFactor class >> oneMinusSrcAlpha [
	"This method was automatically generated"
	^ SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA
]

{ #category : 'accessing enum' }
SDL3GPUBlendFactor class >> oneMinusSrcColor [
	"This method was automatically generated"
	^ SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_COLOR
]

{ #category : 'accessing enum' }
SDL3GPUBlendFactor class >> srcAlpha [
	"This method was automatically generated"
	^ SDL_GPU_BLENDFACTOR_SRC_ALPHA
]

{ #category : 'accessing enum' }
SDL3GPUBlendFactor class >> srcAlphaSaturate [
	"This method was automatically generated"
	^ SDL_GPU_BLENDFACTOR_SRC_ALPHA_SATURATE
]

{ #category : 'accessing enum' }
SDL3GPUBlendFactor class >> srcColor [
	"This method was automatically generated"
	^ SDL_GPU_BLENDFACTOR_SRC_COLOR
]

{ #category : 'accessing enum' }
SDL3GPUBlendFactor class >> zero [
	"This method was automatically generated"
	^ SDL_GPU_BLENDFACTOR_ZERO
]
