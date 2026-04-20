Class {
	#name : 'SDL3ColorType',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_COLOR_TYPE_RGB',
		'SDL_COLOR_TYPE_UNKNOWN',
		'SDL_COLOR_TYPE_YCBCR'
	],
	#category : 'SDL3-Enumerations',
	#package : 'SDL3',
	#tag : 'Enumerations'
}

{ #category : 'enum declaration' }
SDL3ColorType class >> enumDecl [

	^ #(
	SDL_COLOR_TYPE_UNKNOWN 0
	SDL_COLOR_TYPE_RGB 1
	SDL_COLOR_TYPE_YCBCR 2 )
]

{ #category : 'accessing enum' }
SDL3ColorType class >> rgb [
	"This method was automatically generated"
	^ SDL_COLOR_TYPE_RGB
]

{ #category : 'accessing enum' }
SDL3ColorType class >> unknown [
	"This method was automatically generated"
	^ SDL_COLOR_TYPE_UNKNOWN
]

{ #category : 'accessing enum' }
SDL3ColorType class >> ycbcr [
	"This method was automatically generated"
	^ SDL_COLOR_TYPE_YCBCR
]
