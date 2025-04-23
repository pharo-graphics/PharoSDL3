Class {
	#name : 'SDL3FlipMode',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_FLIP_HORIZONTAL',
		'SDL_FLIP_NONE',
		'SDL_FLIP_VERTICAL'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'enum declaration' }
SDL3FlipMode class >> enumDecl [

	^ #(
	SDL_FLIP_NONE 0
	SDL_FLIP_HORIZONTAL 1
	SDL_FLIP_VERTICAL 2 )
]

{ #category : 'accessing enum' }
SDL3FlipMode class >> horizontal [
	"This method was automatically generated"
	^ SDL_FLIP_HORIZONTAL
]

{ #category : 'accessing enum' }
SDL3FlipMode class >> none [
	"This method was automatically generated"
	^ SDL_FLIP_NONE
]

{ #category : 'accessing enum' }
SDL3FlipMode class >> vertical [
	"This method was automatically generated"
	^ SDL_FLIP_VERTICAL
]
