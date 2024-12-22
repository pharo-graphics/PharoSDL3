Class {
	#name : 'S3SDL_GPUSamplerMipmapMode',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_GPU_SAMPLERMIPMAPMODE_LINEAR',
		'SDL_GPU_SAMPLERMIPMAPMODE_NEAREST'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
S3SDL_GPUSamplerMipmapMode class >> SDL_GPU_SAMPLERMIPMAPMODE_LINEAR [
	"This method was automatically generated"
	^ SDL_GPU_SAMPLERMIPMAPMODE_LINEAR
]

{ #category : 'accessing enum' }
S3SDL_GPUSamplerMipmapMode class >> SDL_GPU_SAMPLERMIPMAPMODE_NEAREST [
	"This method was automatically generated"
	^ SDL_GPU_SAMPLERMIPMAPMODE_NEAREST
]

{ #category : 'enum declaration' }
S3SDL_GPUSamplerMipmapMode class >> enumDecl [

	^ #(
	SDL_GPU_SAMPLERMIPMAPMODE_NEAREST 0
	SDL_GPU_SAMPLERMIPMAPMODE_LINEAR 1 )
]
