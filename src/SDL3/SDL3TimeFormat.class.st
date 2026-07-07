"
I am a SDL3 FFI binding for `SDL_TimeFormat`.

The preferred time format of the current system locale.

See: https://wiki.libsdl.org/SDL3/SDL_TimeFormat
"
Class {
	#name : 'SDL3TimeFormat',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_TIME_FORMAT_12HR',
		'SDL_TIME_FORMAT_24HR'
	],
	#category : 'SDL3-Enumerations',
	#package : 'SDL3',
	#tag : 'Enumerations'
}

{ #category : 'accessing enum' }
SDL3TimeFormat class >> at12hr [
	"This method was automatically generated"
	^ SDL_TIME_FORMAT_12HR
]

{ #category : 'accessing enum' }
SDL3TimeFormat class >> at24hr [
	"This method was automatically generated"
	^ SDL_TIME_FORMAT_24HR
]

{ #category : 'enum declaration' }
SDL3TimeFormat class >> enumDecl [

	^ #(
	SDL_TIME_FORMAT_24HR 0
	SDL_TIME_FORMAT_12HR 1 )
]
