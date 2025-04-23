Class {
	#name : 'SDL3ColorRange',
	#superclass : 'SDL3Enumeration',
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
SDL3ColorRange class >> enumDecl [

	^ #(
	SDL_COLOR_RANGE_UNKNOWN 0
	SDL_COLOR_RANGE_LIMITED 1
	SDL_COLOR_RANGE_FULL 2 )
]

{ #category : 'accessing enum' }
SDL3ColorRange class >> full [
	"This method was automatically generated"
	^ SDL_COLOR_RANGE_FULL
]

{ #category : 'accessing enum' }
SDL3ColorRange class >> limited [
	"This method was automatically generated"
	^ SDL_COLOR_RANGE_LIMITED
]

{ #category : 'accessing enum' }
SDL3ColorRange class >> unknown [
	"This method was automatically generated"
	^ SDL_COLOR_RANGE_UNKNOWN
]
