"
I am a SDL3 FFI binding for `SDL_GPULoadOp`.

Specifies how the contents of a texture attached to a render pass are treated at the beginning of the render pass.

See: https://wiki.libsdl.org/SDL3/SDL_GPULoadOp
"
Class {
	#name : 'SDL3GPULoadOp',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_GPU_LOADOP_CLEAR',
		'SDL_GPU_LOADOP_DONT_CARE',
		'SDL_GPU_LOADOP_LOAD'
	],
	#category : 'SDL3-Enumerations',
	#package : 'SDL3',
	#tag : 'Enumerations'
}

{ #category : 'accessing enum' }
SDL3GPULoadOp class >> clear [
	"This method was automatically generated"
	^ SDL_GPU_LOADOP_CLEAR
]

{ #category : 'accessing enum' }
SDL3GPULoadOp class >> dontCare [
	"This method was automatically generated"
	^ SDL_GPU_LOADOP_DONT_CARE
]

{ #category : 'enum declaration' }
SDL3GPULoadOp class >> enumDecl [

	^ #(
	SDL_GPU_LOADOP_LOAD 0
	SDL_GPU_LOADOP_CLEAR 1
	SDL_GPU_LOADOP_DONT_CARE 2 )
]

{ #category : 'accessing enum' }
SDL3GPULoadOp class >> load [
	"This method was automatically generated"
	^ SDL_GPU_LOADOP_LOAD
]
