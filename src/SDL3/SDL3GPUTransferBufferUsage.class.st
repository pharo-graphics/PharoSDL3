"
I am a SDL3 FFI binding for `SDL_GPUTransferBufferUsage`.

Specifies how a transfer buffer is intended to be used by the client.

See: https://wiki.libsdl.org/SDL3/SDL_GPUTransferBufferUsage
"
Class {
	#name : 'SDL3GPUTransferBufferUsage',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_GPU_TRANSFERBUFFERUSAGE_DOWNLOAD',
		'SDL_GPU_TRANSFERBUFFERUSAGE_UPLOAD'
	],
	#category : 'SDL3-Enumerations',
	#package : 'SDL3',
	#tag : 'Enumerations'
}

{ #category : 'accessing enum' }
SDL3GPUTransferBufferUsage class >> download [
	"This method was automatically generated"
	^ SDL_GPU_TRANSFERBUFFERUSAGE_DOWNLOAD
]

{ #category : 'enum declaration' }
SDL3GPUTransferBufferUsage class >> enumDecl [

	^ #(
	SDL_GPU_TRANSFERBUFFERUSAGE_UPLOAD 0
	SDL_GPU_TRANSFERBUFFERUSAGE_DOWNLOAD 1 )
]

{ #category : 'accessing enum' }
SDL3GPUTransferBufferUsage class >> upload [
	"This method was automatically generated"
	^ SDL_GPU_TRANSFERBUFFERUSAGE_UPLOAD
]
