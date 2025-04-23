Class {
	#name : 'SDL3GPUFrontFace',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_GPU_FRONTFACE_CLOCKWISE',
		'SDL_GPU_FRONTFACE_COUNTER_CLOCKWISE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'enum declaration' }
SDL3GPUFrontFace class >> enumDecl [

	^ #(
	SDL_GPU_FRONTFACE_COUNTER_CLOCKWISE 0
	SDL_GPU_FRONTFACE_CLOCKWISE 1 )
]

{ #category : 'accessing enum' }
SDL3GPUFrontFace class >> lockwise [
	"This method was automatically generated"
	^ SDL_GPU_FRONTFACE_CLOCKWISE
]

{ #category : 'accessing enum' }
SDL3GPUFrontFace class >> ounterClockwise [
	"This method was automatically generated"
	^ SDL_GPU_FRONTFACE_COUNTER_CLOCKWISE
]
