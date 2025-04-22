Class {
	#name : 'S3SDL_GPUFilter',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_GPU_FILTER_LINEAR',
		'SDL_GPU_FILTER_NEAREST'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'enum declaration' }
S3SDL_GPUFilter class >> enumDecl [

	^ #(
	SDL_GPU_FILTER_NEAREST 0
	SDL_GPU_FILTER_LINEAR 1 )
]

{ #category : 'accessing enum' }
S3SDL_GPUFilter class >> linear [
	"This method was automatically generated"
	^ SDL_GPU_FILTER_LINEAR
]

{ #category : 'accessing enum' }
S3SDL_GPUFilter class >> nearest [
	"This method was automatically generated"
	^ SDL_GPU_FILTER_NEAREST
]
