Class {
	#name : 'S3SDL_GPULoadOp',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_GPU_LOADOP_CLEAR',
		'SDL_GPU_LOADOP_DONT_CARE',
		'SDL_GPU_LOADOP_LOAD'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
S3SDL_GPULoadOp class >> SDL_GPU_LOADOP_CLEAR [
	"This method was automatically generated"
	^ SDL_GPU_LOADOP_CLEAR
]

{ #category : 'accessing enum' }
S3SDL_GPULoadOp class >> SDL_GPU_LOADOP_DONT_CARE [
	"This method was automatically generated"
	^ SDL_GPU_LOADOP_DONT_CARE
]

{ #category : 'accessing enum' }
S3SDL_GPULoadOp class >> SDL_GPU_LOADOP_LOAD [
	"This method was automatically generated"
	^ SDL_GPU_LOADOP_LOAD
]

{ #category : 'enum declaration' }
S3SDL_GPULoadOp class >> enumDecl [

	^ #(
	SDL_GPU_LOADOP_LOAD 0
	SDL_GPU_LOADOP_CLEAR 1
	SDL_GPU_LOADOP_DONT_CARE 2 )
]
