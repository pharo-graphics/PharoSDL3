"
I am a SDL3 FFI binding for `SDL_GPUFillMode`.

Specifies the fill mode of the graphics pipeline.

See: https://wiki.libsdl.org/SDL3/SDL_GPUFillMode
"
Class {
	#name : 'SDL3GPUFillMode',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_GPU_FILLMODE_FILL',
		'SDL_GPU_FILLMODE_LINE'
	],
	#category : 'SDL3-Enumerations',
	#package : 'SDL3',
	#tag : 'Enumerations'
}

{ #category : 'enum declaration' }
SDL3GPUFillMode class >> enumDecl [

	^ #(
	SDL_GPU_FILLMODE_FILL 0
	SDL_GPU_FILLMODE_LINE 1 )
]

{ #category : 'accessing enum' }
SDL3GPUFillMode class >> fill [
	"This method was automatically generated"
	^ SDL_GPU_FILLMODE_FILL
]

{ #category : 'accessing enum' }
SDL3GPUFillMode class >> line [
	"This method was automatically generated"
	^ SDL_GPU_FILLMODE_LINE
]
