Class {
	#name : 'S3SDL_ColorType',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_COLOR_TYPE_RGB',
		'SDL_COLOR_TYPE_UNKNOWN',
		'SDL_COLOR_TYPE_YCBCR'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'enum declaration' }
S3SDL_ColorType class >> enumDecl [

	^ #(
	SDL_COLOR_TYPE_UNKNOWN 0
	SDL_COLOR_TYPE_RGB 1
	SDL_COLOR_TYPE_YCBCR 2 )
]

{ #category : 'accessing enum' }
S3SDL_ColorType class >> rgb [
	"This method was automatically generated"
	^ SDL_COLOR_TYPE_RGB
]

{ #category : 'accessing enum' }
S3SDL_ColorType class >> unknown [
	"This method was automatically generated"
	^ SDL_COLOR_TYPE_UNKNOWN
]

{ #category : 'accessing enum' }
S3SDL_ColorType class >> ycbcr [
	"This method was automatically generated"
	^ SDL_COLOR_TYPE_YCBCR
]
