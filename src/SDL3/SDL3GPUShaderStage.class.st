Class {
	#name : 'SDL3GPUShaderStage',
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
SDL3GPUShaderStage class >> enumDecl [

	^ #(
	SDL_GPU_SHADERSTAGE_VERTEX 0
	SDL_GPU_SHADERSTAGE_FRAGMENT 1 )
]

{ #category : 'accessing enum' }
SDL3GPUShaderStage class >> fragment [
	"This method was automatically generated"
	^ SDL_GPU_SHADERSTAGE_FRAGMENT
]

{ #category : 'accessing enum' }
SDL3GPUShaderStage class >> vertex [
	"This method was automatically generated"
	^ SDL_GPU_SHADERSTAGE_VERTEX
]
