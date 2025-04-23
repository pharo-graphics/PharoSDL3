Class {
	#name : 'SDL3GPUTextureType',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_GPU_TEXTURETYPE_2D',
		'SDL_GPU_TEXTURETYPE_2D_ARRAY',
		'SDL_GPU_TEXTURETYPE_3D',
		'SDL_GPU_TEXTURETYPE_CUBE',
		'SDL_GPU_TEXTURETYPE_CUBE_ARRAY'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
SDL3GPUTextureType class >> at2d [
	"This method was automatically generated"
	^ SDL_GPU_TEXTURETYPE_2D
]

{ #category : 'accessing enum' }
SDL3GPUTextureType class >> at2dArray [
	"This method was automatically generated"
	^ SDL_GPU_TEXTURETYPE_2D_ARRAY
]

{ #category : 'accessing enum' }
SDL3GPUTextureType class >> at3d [
	"This method was automatically generated"
	^ SDL_GPU_TEXTURETYPE_3D
]

{ #category : 'accessing enum' }
SDL3GPUTextureType class >> atCube [
	"This method was automatically generated"
	^ SDL_GPU_TEXTURETYPE_CUBE
]

{ #category : 'accessing enum' }
SDL3GPUTextureType class >> atCubeArray [
	"This method was automatically generated"
	^ SDL_GPU_TEXTURETYPE_CUBE_ARRAY
]

{ #category : 'enum declaration' }
SDL3GPUTextureType class >> enumDecl [

	^ #(
	SDL_GPU_TEXTURETYPE_2D 0
	SDL_GPU_TEXTURETYPE_2D_ARRAY 1
	SDL_GPU_TEXTURETYPE_3D 2
	SDL_GPU_TEXTURETYPE_CUBE 3
	SDL_GPU_TEXTURETYPE_CUBE_ARRAY 4 )
]
