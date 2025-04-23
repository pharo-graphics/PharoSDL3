Class {
	#name : 'SDL3GPUCubeMapFace',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_GPU_CUBEMAPFACE_NEGATIVEX',
		'SDL_GPU_CUBEMAPFACE_NEGATIVEY',
		'SDL_GPU_CUBEMAPFACE_NEGATIVEZ',
		'SDL_GPU_CUBEMAPFACE_POSITIVEX',
		'SDL_GPU_CUBEMAPFACE_POSITIVEY',
		'SDL_GPU_CUBEMAPFACE_POSITIVEZ'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'enum declaration' }
SDL3GPUCubeMapFace class >> enumDecl [

	^ #(
	SDL_GPU_CUBEMAPFACE_POSITIVEX 0
	SDL_GPU_CUBEMAPFACE_NEGATIVEX 1
	SDL_GPU_CUBEMAPFACE_POSITIVEY 2
	SDL_GPU_CUBEMAPFACE_NEGATIVEY 3
	SDL_GPU_CUBEMAPFACE_POSITIVEZ 4
	SDL_GPU_CUBEMAPFACE_NEGATIVEZ 5 )
]

{ #category : 'accessing enum' }
SDL3GPUCubeMapFace class >> negativeX [
	"This method was automatically generated"
	^ SDL_GPU_CUBEMAPFACE_NEGATIVEX
]

{ #category : 'accessing enum' }
SDL3GPUCubeMapFace class >> negativeY [
	"This method was automatically generated"
	^ SDL_GPU_CUBEMAPFACE_NEGATIVEY
]

{ #category : 'accessing enum' }
SDL3GPUCubeMapFace class >> negativeZ [
	"This method was automatically generated"
	^ SDL_GPU_CUBEMAPFACE_NEGATIVEZ
]

{ #category : 'accessing enum' }
SDL3GPUCubeMapFace class >> positiveX [
	"This method was automatically generated"
	^ SDL_GPU_CUBEMAPFACE_POSITIVEX
]

{ #category : 'accessing enum' }
SDL3GPUCubeMapFace class >> positiveY [
	"This method was automatically generated"
	^ SDL_GPU_CUBEMAPFACE_POSITIVEY
]

{ #category : 'accessing enum' }
SDL3GPUCubeMapFace class >> positiveZ [
	"This method was automatically generated"
	^ SDL_GPU_CUBEMAPFACE_POSITIVEZ
]
