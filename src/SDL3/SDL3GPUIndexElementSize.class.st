"
I am a SDL3 FFI binding for `SDL_GPUIndexElementSize`.

Specifies the size of elements in an index buffer.

See: https://wiki.libsdl.org/SDL3/SDL_GPUIndexElementSize
"
Class {
	#name : 'SDL3GPUIndexElementSize',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_GPU_INDEXELEMENTSIZE_16BIT',
		'SDL_GPU_INDEXELEMENTSIZE_32BIT'
	],
	#category : 'SDL3-Enumerations',
	#package : 'SDL3',
	#tag : 'Enumerations'
}

{ #category : 'accessing enum' }
SDL3GPUIndexElementSize class >> at16bit [
	"This method was automatically generated"
	^ SDL_GPU_INDEXELEMENTSIZE_16BIT
]

{ #category : 'accessing enum' }
SDL3GPUIndexElementSize class >> at32bit [
	"This method was automatically generated"
	^ SDL_GPU_INDEXELEMENTSIZE_32BIT
]

{ #category : 'enum declaration' }
SDL3GPUIndexElementSize class >> enumDecl [

	^ #(
	SDL_GPU_INDEXELEMENTSIZE_16BIT 0
	SDL_GPU_INDEXELEMENTSIZE_32BIT 1 )
]
