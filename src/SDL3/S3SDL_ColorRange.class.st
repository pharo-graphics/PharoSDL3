Class {
	#name : 'S3SDL_ColorRange',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_COLOR_RANGE_FULL',
		'SDL_COLOR_RANGE_LIMITED',
		'SDL_COLOR_RANGE_UNKNOWN'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'enum declaration' }
S3SDL_ColorRange class >> enumDecl [

	^ #(
	SDL_COLOR_RANGE_UNKNOWN 0
	SDL_COLOR_RANGE_LIMITED 1
	SDL_COLOR_RANGE_FULL 2 )
]

{ #category : 'accessing enum' }
S3SDL_ColorRange class >> full [
	"This method was automatically generated"
	^ SDL_COLOR_RANGE_FULL
]

{ #category : 'accessing enum' }
S3SDL_ColorRange class >> limited [
	"This method was automatically generated"
	^ SDL_COLOR_RANGE_LIMITED
]

{ #category : 'accessing enum' }
S3SDL_ColorRange class >> unknown [
	"This method was automatically generated"
	^ SDL_COLOR_RANGE_UNKNOWN
]
