"
I am a SDL3 FFI binding for `SDL_AppResult`.

Return values for optional main callbacks.

See: https://wiki.libsdl.org/SDL3/SDL_AppResult
"
Class {
	#name : 'SDL3AppResult',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_APP_CONTINUE',
		'SDL_APP_FAILURE',
		'SDL_APP_SUCCESS'
	],
	#category : 'SDL3-Enumerations',
	#package : 'SDL3',
	#tag : 'Enumerations'
}

{ #category : 'accessing enum' }
SDL3AppResult class >> continue [
	"This method was automatically generated"
	^ SDL_APP_CONTINUE
]

{ #category : 'enum declaration' }
SDL3AppResult class >> enumDecl [

	^ #(
	SDL_APP_CONTINUE 0
	SDL_APP_SUCCESS 1
	SDL_APP_FAILURE 2 )
]

{ #category : 'accessing enum' }
SDL3AppResult class >> failure [
	"This method was automatically generated"
	^ SDL_APP_FAILURE
]

{ #category : 'accessing enum' }
SDL3AppResult class >> success [
	"This method was automatically generated"
	^ SDL_APP_SUCCESS
]
