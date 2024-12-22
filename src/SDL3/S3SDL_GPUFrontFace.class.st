Class {
	#name : 'S3SDL_GPUFrontFace',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_GPU_FRONTFACE_CLOCKWISE',
		'SDL_GPU_FRONTFACE_COUNTER_CLOCKWISE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
S3SDL_GPUFrontFace class >> SDL_GPU_FRONTFACE_CLOCKWISE [
	"This method was automatically generated"
	^ SDL_GPU_FRONTFACE_CLOCKWISE
]

{ #category : 'accessing enum' }
S3SDL_GPUFrontFace class >> SDL_GPU_FRONTFACE_COUNTER_CLOCKWISE [
	"This method was automatically generated"
	^ SDL_GPU_FRONTFACE_COUNTER_CLOCKWISE
]

{ #category : 'enum declaration' }
S3SDL_GPUFrontFace class >> enumDecl [

	^ #(
	SDL_GPU_FRONTFACE_COUNTER_CLOCKWISE 0
	SDL_GPU_FRONTFACE_CLOCKWISE 1 )
]
