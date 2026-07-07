"
I am a SDL3 FFI binding for `SDL_GPUVertexInputRate`.

Specifies the rate at which vertex attributes are pulled from buffers.

See: https://wiki.libsdl.org/SDL3/SDL_GPUVertexInputRate
"
Class {
	#name : 'SDL3GPUVertexInputRate',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_GPU_VERTEXINPUTRATE_INSTANCE',
		'SDL_GPU_VERTEXINPUTRATE_VERTEX'
	],
	#category : 'SDL3-Enumerations',
	#package : 'SDL3',
	#tag : 'Enumerations'
}

{ #category : 'enum declaration' }
SDL3GPUVertexInputRate class >> enumDecl [

	^ #(
	SDL_GPU_VERTEXINPUTRATE_VERTEX 0
	SDL_GPU_VERTEXINPUTRATE_INSTANCE 1 )
]

{ #category : 'accessing enum' }
SDL3GPUVertexInputRate class >> instance [
	"This method was automatically generated"
	^ SDL_GPU_VERTEXINPUTRATE_INSTANCE
]

{ #category : 'accessing enum' }
SDL3GPUVertexInputRate class >> vertex [
	"This method was automatically generated"
	^ SDL_GPU_VERTEXINPUTRATE_VERTEX
]
