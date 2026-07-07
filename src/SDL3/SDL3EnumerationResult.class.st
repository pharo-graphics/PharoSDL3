"
I am a SDL3 FFI binding for `SDL_EnumerationResult`.

Possible results from an enumeration callback.

See: https://wiki.libsdl.org/SDL3/SDL_EnumerationResult
"
Class {
	#name : 'SDL3EnumerationResult',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_ENUM_CONTINUE',
		'SDL_ENUM_FAILURE',
		'SDL_ENUM_SUCCESS'
	],
	#category : 'SDL3-Enumerations',
	#package : 'SDL3',
	#tag : 'Enumerations'
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
