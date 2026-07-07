"
I am a SDL3 FFI binding for `SDL_GPUShaderStage`.

Specifies which stage a shader program corresponds to.

See: https://wiki.libsdl.org/SDL3/SDL_GPUShaderStage
"
Class {
	#name : 'SDL3GPUShaderStage',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_GPU_SHADERSTAGE_FRAGMENT',
		'SDL_GPU_SHADERSTAGE_VERTEX'
	],
	#category : 'SDL3-Enumerations',
	#package : 'SDL3',
	#tag : 'Enumerations'
}

{ #category : 'enum declaration' }
SDL3GPUShaderStage class >> enumDecl [

	^ #(
	SDL_GPU_SHADERSTAGE_VERTEX 0
	SDL_GPU_SHADERSTAGE_FRAGMENT 1 )
]

{ #category : 'accessing enum' }
SDL3GPUShaderStage class >> fragment [
	"This method was automatically generated"
	^ SDL_GPU_SHADERSTAGE_FRAGMENT
]

{ #category : 'accessing enum' }
SDL3GPUShaderStage class >> vertex [
	"This method was automatically generated"
	^ SDL_GPU_SHADERSTAGE_VERTEX
]
