Class {
	#name : 'S3SDL_GPUTextureType',
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
S3SDL_GPUTextureType class >> SDL_GPU_TEXTURETYPE_2D [
	"This method was automatically generated"
	^ SDL_GPU_TEXTURETYPE_2D
]

{ #category : 'accessing enum' }
S3SDL_GPUTextureType class >> SDL_GPU_TEXTURETYPE_2D_ARRAY [
	"This method was automatically generated"
	^ SDL_GPU_TEXTURETYPE_2D_ARRAY
]

{ #category : 'accessing enum' }
S3SDL_GPUTextureType class >> SDL_GPU_TEXTURETYPE_3D [
	"This method was automatically generated"
	^ SDL_GPU_TEXTURETYPE_3D
]

{ #category : 'accessing enum' }
S3SDL_GPUTextureType class >> SDL_GPU_TEXTURETYPE_CUBE [
	"This method was automatically generated"
	^ SDL_GPU_TEXTURETYPE_CUBE
]

{ #category : 'accessing enum' }
S3SDL_GPUTextureType class >> SDL_GPU_TEXTURETYPE_CUBE_ARRAY [
	"This method was automatically generated"
	^ SDL_GPU_TEXTURETYPE_CUBE_ARRAY
]

{ #category : 'enum declaration' }
S3SDL_GPUTextureType class >> enumDecl [

	^ #(
	SDL_GPU_TEXTURETYPE_2D 0
	SDL_GPU_TEXTURETYPE_2D_ARRAY 1
	SDL_GPU_TEXTURETYPE_3D 2
	SDL_GPU_TEXTURETYPE_CUBE 3
	SDL_GPU_TEXTURETYPE_CUBE_ARRAY 4 )
]
