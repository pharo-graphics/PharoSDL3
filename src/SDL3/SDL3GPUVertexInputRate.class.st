Class {
	#name : 'SDL3GPUVertexInputRate',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_GPU_VERTEXINPUTRATE_INSTANCE',
		'SDL_GPU_VERTEXINPUTRATE_VERTEX'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
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
