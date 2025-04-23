Class {
	#name : 'SDL3TimeFormat',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_TIME_FORMAT_12HR',
		'SDL_TIME_FORMAT_24HR'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
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
