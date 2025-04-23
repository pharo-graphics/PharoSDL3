Class {
	#name : 'SDL3GPUSamplerMipmapMode',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_GPU_SAMPLERMIPMAPMODE_LINEAR',
		'SDL_GPU_SAMPLERMIPMAPMODE_NEAREST'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'enum declaration' }
SDL3GPUSamplerMipmapMode class >> enumDecl [

	^ #(
	SDL_GPU_SAMPLERMIPMAPMODE_NEAREST 0
	SDL_GPU_SAMPLERMIPMAPMODE_LINEAR 1 )
]

{ #category : 'accessing enum' }
SDL3GPUSamplerMipmapMode class >> linear [
	"This method was automatically generated"
	^ SDL_GPU_SAMPLERMIPMAPMODE_LINEAR
]

{ #category : 'accessing enum' }
SDL3GPUSamplerMipmapMode class >> nearest [
	"This method was automatically generated"
	^ SDL_GPU_SAMPLERMIPMAPMODE_NEAREST
]
