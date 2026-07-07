"
I am a SDL3 FFI binding for `SDL_GPUFilter`.

Specifies a filter operation used by a sampler.

See: https://wiki.libsdl.org/SDL3/SDL_GPUFilter
"
Class {
	#name : 'SDL3GPUFilter',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_GPU_FILTER_LINEAR',
		'SDL_GPU_FILTER_NEAREST'
	],
	#category : 'SDL3-Enumerations',
	#package : 'SDL3',
	#tag : 'Enumerations'
}

{ #category : 'enum declaration' }
SDL3GPUFilter class >> enumDecl [

	^ #(
	SDL_GPU_FILTER_NEAREST 0
	SDL_GPU_FILTER_LINEAR 1 )
]

{ #category : 'accessing enum' }
SDL3GPUFilter class >> linear [
	"This method was automatically generated"
	^ SDL_GPU_FILTER_LINEAR
]

{ #category : 'accessing enum' }
SDL3GPUFilter class >> nearest [
	"This method was automatically generated"
	^ SDL_GPU_FILTER_NEAREST
]
