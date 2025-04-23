Class {
	#name : 'SDL3EnumerationResult',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_ENUM_CONTINUE',
		'SDL_ENUM_FAILURE',
		'SDL_ENUM_SUCCESS'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
SDL3EnumerationResult class >> continue [
	"This method was automatically generated"
	^ SDL_ENUM_CONTINUE
]

{ #category : 'enum declaration' }
SDL3EnumerationResult class >> enumDecl [

	^ #(
	SDL_ENUM_CONTINUE 0
	SDL_ENUM_SUCCESS 1
	SDL_ENUM_FAILURE 2 )
]

{ #category : 'accessing enum' }
SDL3EnumerationResult class >> failure [
	"This method was automatically generated"
	^ SDL_ENUM_FAILURE
]

{ #category : 'accessing enum' }
SDL3EnumerationResult class >> success [
	"This method was automatically generated"
	^ SDL_ENUM_SUCCESS
]
