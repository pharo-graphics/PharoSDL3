Class {
	#name : 'SDL3GPUSampleCount',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_GPU_SAMPLECOUNT_1',
		'SDL_GPU_SAMPLECOUNT_2',
		'SDL_GPU_SAMPLECOUNT_4',
		'SDL_GPU_SAMPLECOUNT_8'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
SDL3GPUSampleCount class >> eight [
	"This method was automatically generated"
	^ SDL_GPU_SAMPLECOUNT_8
]

{ #category : 'enum declaration' }
SDL3GPUSampleCount class >> enumDecl [

	^ #(
	SDL_GPU_SAMPLECOUNT_1 0
	SDL_GPU_SAMPLECOUNT_2 1
	SDL_GPU_SAMPLECOUNT_4 2
	SDL_GPU_SAMPLECOUNT_8 3 )
]

{ #category : 'accessing enum' }
SDL3GPUSampleCount class >> four [
	"This method was automatically generated"
	^ SDL_GPU_SAMPLECOUNT_4
]

{ #category : 'accessing enum' }
SDL3GPUSampleCount class >> one [
	"This method was automatically generated"
	^ SDL_GPU_SAMPLECOUNT_1
]

{ #category : 'accessing enum' }
SDL3GPUSampleCount class >> two [
	"This method was automatically generated"
	^ SDL_GPU_SAMPLECOUNT_2
]
