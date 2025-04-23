Class {
	#name : 'SDL3GPUStoreOp',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_GPU_STOREOP_DONT_CARE',
		'SDL_GPU_STOREOP_RESOLVE',
		'SDL_GPU_STOREOP_RESOLVE_AND_STORE',
		'SDL_GPU_STOREOP_STORE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
SDL3GPUStoreOp class >> dontCare [
	"This method was automatically generated"
	^ SDL_GPU_STOREOP_DONT_CARE
]

{ #category : 'enum declaration' }
SDL3GPUStoreOp class >> enumDecl [

	^ #(
	SDL_GPU_STOREOP_STORE 0
	SDL_GPU_STOREOP_DONT_CARE 1
	SDL_GPU_STOREOP_RESOLVE 2
	SDL_GPU_STOREOP_RESOLVE_AND_STORE 3 )
]

{ #category : 'accessing enum' }
SDL3GPUStoreOp class >> resolve [
	"This method was automatically generated"
	^ SDL_GPU_STOREOP_RESOLVE
]

{ #category : 'accessing enum' }
SDL3GPUStoreOp class >> resolveAndStore [
	"This method was automatically generated"
	^ SDL_GPU_STOREOP_RESOLVE_AND_STORE
]

{ #category : 'accessing enum' }
SDL3GPUStoreOp class >> store [
	"This method was automatically generated"
	^ SDL_GPU_STOREOP_STORE
]
