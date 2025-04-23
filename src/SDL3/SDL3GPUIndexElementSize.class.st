Class {
	#name : 'SDL3GPUIndexElementSize',
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
SDL3GPUIndexElementSize class >> at16bit [
	"This method was automatically generated"
	^ SDL_GPU_INDEXELEMENTSIZE_16BIT
]

{ #category : 'accessing enum' }
SDL3GPUIndexElementSize class >> at32bit [
	"This method was automatically generated"
	^ SDL_GPU_INDEXELEMENTSIZE_32BIT
]

{ #category : 'enum declaration' }
SDL3GPUIndexElementSize class >> enumDecl [

	^ #(
	SDL_GPU_INDEXELEMENTSIZE_16BIT 0
	SDL_GPU_INDEXELEMENTSIZE_32BIT 1 )
]
