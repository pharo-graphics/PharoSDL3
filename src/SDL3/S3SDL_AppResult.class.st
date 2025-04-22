Class {
	#name : 'S3SDL_AppResult',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_APP_CONTINUE',
		'SDL_APP_FAILURE',
		'SDL_APP_SUCCESS'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
S3SDL_AppResult class >> continue [
	"This method was automatically generated"
	^ SDL_APP_CONTINUE
]

{ #category : 'enum declaration' }
S3SDL_AppResult class >> enumDecl [

	^ #(
	SDL_APP_CONTINUE 0
	SDL_APP_SUCCESS 1
	SDL_APP_FAILURE 2 )
]

{ #category : 'accessing enum' }
S3SDL_AppResult class >> failure [
	"This method was automatically generated"
	^ SDL_APP_FAILURE
]

{ #category : 'accessing enum' }
S3SDL_AppResult class >> success [
	"This method was automatically generated"
	^ SDL_APP_SUCCESS
]
