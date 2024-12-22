Class {
	#name : 'S3SDL_FlipMode',
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

{ #category : 'accessing enum' }
S3SDL_FlipMode class >> SDL_FLIP_HORIZONTAL [
	"This method was automatically generated"
	^ SDL_FLIP_HORIZONTAL
]

{ #category : 'accessing enum' }
S3SDL_FlipMode class >> SDL_FLIP_NONE [
	"This method was automatically generated"
	^ SDL_FLIP_NONE
]

{ #category : 'accessing enum' }
S3SDL_FlipMode class >> SDL_FLIP_VERTICAL [
	"This method was automatically generated"
	^ SDL_FLIP_VERTICAL
]

{ #category : 'enum declaration' }
S3SDL_FlipMode class >> enumDecl [

	^ #(
	SDL_FLIP_NONE 0
	SDL_FLIP_HORIZONTAL 1
	SDL_FLIP_VERTICAL 2 )
]
