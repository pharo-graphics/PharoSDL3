Class {
	#name : 'S3SDL_GPUFillMode',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_GPU_FILLMODE_FILL',
		'SDL_GPU_FILLMODE_LINE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'enum declaration' }
S3SDL_GPUFillMode class >> enumDecl [

	^ #(
	SDL_GPU_FILLMODE_FILL 0
	SDL_GPU_FILLMODE_LINE 1 )
]

{ #category : 'accessing enum' }
S3SDL_GPUFillMode class >> fill [
	"This method was automatically generated"
	^ SDL_GPU_FILLMODE_FILL
]

{ #category : 'accessing enum' }
S3SDL_GPUFillMode class >> line [
	"This method was automatically generated"
	^ SDL_GPU_FILLMODE_LINE
]
