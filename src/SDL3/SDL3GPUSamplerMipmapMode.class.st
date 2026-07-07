"
I am a SDL3 FFI binding for `SDL_GPUSamplerMipmapMode`.

Specifies a mipmap mode used by a sampler.

See: https://wiki.libsdl.org/SDL3/SDL_GPUSamplerMipmapMode
"
Class {
	#name : 'SDL3GPUSamplerMipmapMode',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_GPU_SAMPLERMIPMAPMODE_LINEAR',
		'SDL_GPU_SAMPLERMIPMAPMODE_NEAREST'
	],
	#category : 'SDL3-Enumerations',
	#package : 'SDL3',
	#tag : 'Enumerations'
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
