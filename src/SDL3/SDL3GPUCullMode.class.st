"
I am a SDL3 FFI binding for `SDL_GPUCullMode`.

Specifies the facing direction in which triangle faces will be culled.

See: https://wiki.libsdl.org/SDL3/SDL_GPUCullMode
"
Class {
	#name : 'SDL3GPUCullMode',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_GPU_CULLMODE_BACK',
		'SDL_GPU_CULLMODE_FRONT',
		'SDL_GPU_CULLMODE_NONE'
	],
	#category : 'SDL3-Enumerations',
	#package : 'SDL3',
	#tag : 'Enumerations'
}

{ #category : 'accessing enum' }
SDL3GPUCullMode class >> back [
	"This method was automatically generated"
	^ SDL_GPU_CULLMODE_BACK
]

{ #category : 'enum declaration' }
SDL3GPUCullMode class >> enumDecl [

	^ #(
	SDL_GPU_CULLMODE_NONE 0
	SDL_GPU_CULLMODE_FRONT 1
	SDL_GPU_CULLMODE_BACK 2 )
]

{ #category : 'accessing enum' }
SDL3GPUCullMode class >> front [
	"This method was automatically generated"
	^ SDL_GPU_CULLMODE_FRONT
]

{ #category : 'accessing enum' }
SDL3GPUCullMode class >> none [
	"This method was automatically generated"
	^ SDL_GPU_CULLMODE_NONE
]
