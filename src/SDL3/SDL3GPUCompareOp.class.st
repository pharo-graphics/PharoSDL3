Class {
	#name : 'SDL3GPUCompareOp',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_GPU_COMPAREOP_ALWAYS',
		'SDL_GPU_COMPAREOP_EQUAL',
		'SDL_GPU_COMPAREOP_GREATER',
		'SDL_GPU_COMPAREOP_GREATER_OR_EQUAL',
		'SDL_GPU_COMPAREOP_INVALID',
		'SDL_GPU_COMPAREOP_LESS',
		'SDL_GPU_COMPAREOP_LESS_OR_EQUAL',
		'SDL_GPU_COMPAREOP_NEVER',
		'SDL_GPU_COMPAREOP_NOT_EQUAL'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
SDL3GPUCompareOp class >> always [
	"This method was automatically generated"
	^ SDL_GPU_COMPAREOP_ALWAYS
]

{ #category : 'enum declaration' }
SDL3GPUCompareOp class >> enumDecl [

	^ #(
	SDL_GPU_COMPAREOP_INVALID 0
	SDL_GPU_COMPAREOP_NEVER 1
	SDL_GPU_COMPAREOP_LESS 2
	SDL_GPU_COMPAREOP_EQUAL 3
	SDL_GPU_COMPAREOP_LESS_OR_EQUAL 4
	SDL_GPU_COMPAREOP_GREATER 5
	SDL_GPU_COMPAREOP_NOT_EQUAL 6
	SDL_GPU_COMPAREOP_GREATER_OR_EQUAL 7
	SDL_GPU_COMPAREOP_ALWAYS 8 )
]

{ #category : 'accessing enum' }
SDL3GPUCompareOp class >> equal [
	"This method was automatically generated"
	^ SDL_GPU_COMPAREOP_EQUAL
]

{ #category : 'accessing enum' }
SDL3GPUCompareOp class >> greater [
	"This method was automatically generated"
	^ SDL_GPU_COMPAREOP_GREATER
]

{ #category : 'accessing enum' }
SDL3GPUCompareOp class >> greaterOrEqual [
	"This method was automatically generated"
	^ SDL_GPU_COMPAREOP_GREATER_OR_EQUAL
]

{ #category : 'accessing enum' }
SDL3GPUCompareOp class >> invalid [
	"This method was automatically generated"
	^ SDL_GPU_COMPAREOP_INVALID
]

{ #category : 'accessing enum' }
SDL3GPUCompareOp class >> less [
	"This method was automatically generated"
	^ SDL_GPU_COMPAREOP_LESS
]

{ #category : 'accessing enum' }
SDL3GPUCompareOp class >> lessOrEqual [
	"This method was automatically generated"
	^ SDL_GPU_COMPAREOP_LESS_OR_EQUAL
]

{ #category : 'accessing enum' }
SDL3GPUCompareOp class >> never [
	"This method was automatically generated"
	^ SDL_GPU_COMPAREOP_NEVER
]

{ #category : 'accessing enum' }
SDL3GPUCompareOp class >> notEqual [
	"This method was automatically generated"
	^ SDL_GPU_COMPAREOP_NOT_EQUAL
]
