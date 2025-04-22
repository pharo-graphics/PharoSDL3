Class {
	#name : 'S3SDL_GPUVertexInputRate',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_GPU_VERTEXINPUTRATE_INSTANCE',
		'SDL_GPU_VERTEXINPUTRATE_VERTEX'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'enum declaration' }
S3SDL_GPUVertexInputRate class >> enumDecl [

	^ #(
	SDL_GPU_VERTEXINPUTRATE_VERTEX 0
	SDL_GPU_VERTEXINPUTRATE_INSTANCE 1 )
]

{ #category : 'accessing enum' }
S3SDL_GPUVertexInputRate class >> instance [
	"This method was automatically generated"
	^ SDL_GPU_VERTEXINPUTRATE_INSTANCE
]

{ #category : 'accessing enum' }
S3SDL_GPUVertexInputRate class >> vertex [
	"This method was automatically generated"
	^ SDL_GPU_VERTEXINPUTRATE_VERTEX
]
