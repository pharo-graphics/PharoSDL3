Class {
	#name : 'SDL3ProcessIO',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_PROCESS_STDIO_APP',
		'SDL_PROCESS_STDIO_INHERITED',
		'SDL_PROCESS_STDIO_NULL',
		'SDL_PROCESS_STDIO_REDIRECT'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
SDL3ProcessIO class >> app [
	"This method was automatically generated"
	^ SDL_PROCESS_STDIO_APP
]

{ #category : 'enum declaration' }
SDL3ProcessIO class >> enumDecl [

	^ #(
	SDL_PROCESS_STDIO_INHERITED 0
	SDL_PROCESS_STDIO_NULL 1
	SDL_PROCESS_STDIO_APP 2
	SDL_PROCESS_STDIO_REDIRECT 3 )
]

{ #category : 'accessing enum' }
SDL3ProcessIO class >> inherited [
	"This method was automatically generated"
	^ SDL_PROCESS_STDIO_INHERITED
]

{ #category : 'accessing enum' }
SDL3ProcessIO class >> null [
	"This method was automatically generated"
	^ SDL_PROCESS_STDIO_NULL
]

{ #category : 'accessing enum' }
SDL3ProcessIO class >> redirect [
	"This method was automatically generated"
	^ SDL_PROCESS_STDIO_REDIRECT
]
