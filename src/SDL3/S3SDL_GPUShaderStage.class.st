Class {
	#name : 'S3SDL_GPUShaderStage',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_GPU_SHADERSTAGE_FRAGMENT',
		'SDL_GPU_SHADERSTAGE_VERTEX'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'enum declaration' }
S3SDL_GPUShaderStage class >> enumDecl [

	^ #(
	SDL_GPU_SHADERSTAGE_VERTEX 0
	SDL_GPU_SHADERSTAGE_FRAGMENT 1 )
]

{ #category : 'accessing enum' }
S3SDL_GPUShaderStage class >> fragment [
	"This method was automatically generated"
	^ SDL_GPU_SHADERSTAGE_FRAGMENT
]

{ #category : 'accessing enum' }
S3SDL_GPUShaderStage class >> vertex [
	"This method was automatically generated"
	^ SDL_GPU_SHADERSTAGE_VERTEX
]
