Class {
	#name : 'S3SDL_GPUIndexElementSize',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_GPU_INDEXELEMENTSIZE_16BIT',
		'SDL_GPU_INDEXELEMENTSIZE_32BIT'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
S3SDL_GPUIndexElementSize class >> SDL_GPU_INDEXELEMENTSIZE_16BIT [
	"This method was automatically generated"
	^ SDL_GPU_INDEXELEMENTSIZE_16BIT
]

{ #category : 'accessing enum' }
S3SDL_GPUIndexElementSize class >> SDL_GPU_INDEXELEMENTSIZE_32BIT [
	"This method was automatically generated"
	^ SDL_GPU_INDEXELEMENTSIZE_32BIT
]

{ #category : 'enum declaration' }
S3SDL_GPUIndexElementSize class >> enumDecl [

	^ #(
	SDL_GPU_INDEXELEMENTSIZE_16BIT 0
	SDL_GPU_INDEXELEMENTSIZE_32BIT 1 )
]
