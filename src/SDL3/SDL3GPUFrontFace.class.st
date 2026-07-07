"
I am a SDL3 FFI binding for `SDL_GPUFrontFace`.

Specifies the vertex winding that will cause a triangle to be determined to be front-facing.

See: https://wiki.libsdl.org/SDL3/SDL_GPUFrontFace
"
Class {
	#name : 'SDL3GPUFrontFace',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_GPU_FRONTFACE_CLOCKWISE',
		'SDL_GPU_FRONTFACE_COUNTER_CLOCKWISE'
	],
	#category : 'SDL3-Enumerations',
	#package : 'SDL3',
	#tag : 'Enumerations'
}

{ #category : 'accessing enum' }
SDL3GPUFrontFace class >> clockwise [
	"This method was automatically generated"
	^ SDL_GPU_FRONTFACE_CLOCKWISE
]

{ #category : 'accessing enum' }
SDL3GPUFrontFace class >> counterClockwise [
	"This method was automatically generated"
	^ SDL_GPU_FRONTFACE_COUNTER_CLOCKWISE
]

{ #category : 'enum declaration' }
SDL3GPUFrontFace class >> enumDecl [

	^ #(
	SDL_GPU_FRONTFACE_COUNTER_CLOCKWISE 0
	SDL_GPU_FRONTFACE_CLOCKWISE 1 )
]
