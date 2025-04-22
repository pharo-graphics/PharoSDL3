Class {
	#name : 'S3SDL_GPUTransferBufferUsage',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_GPU_TRANSFERBUFFERUSAGE_DOWNLOAD',
		'SDL_GPU_TRANSFERBUFFERUSAGE_UPLOAD'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
S3SDL_GPUTransferBufferUsage class >> download [
	"This method was automatically generated"
	^ SDL_GPU_TRANSFERBUFFERUSAGE_DOWNLOAD
]

{ #category : 'enum declaration' }
S3SDL_GPUTransferBufferUsage class >> enumDecl [

	^ #(
	SDL_GPU_TRANSFERBUFFERUSAGE_UPLOAD 0
	SDL_GPU_TRANSFERBUFFERUSAGE_DOWNLOAD 1 )
]

{ #category : 'accessing enum' }
S3SDL_GPUTransferBufferUsage class >> upload [
	"This method was automatically generated"
	^ SDL_GPU_TRANSFERBUFFERUSAGE_UPLOAD
]
