Class {
	#name : 'S3SDL_ProcessIO',
	#superclass : 'S3Enumeration',
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
S3SDL_ProcessIO class >> SDL_PROCESS_STDIO_APP [
	"This method was automatically generated"
	^ SDL_PROCESS_STDIO_APP
]

{ #category : 'accessing enum' }
S3SDL_ProcessIO class >> SDL_PROCESS_STDIO_INHERITED [
	"This method was automatically generated"
	^ SDL_PROCESS_STDIO_INHERITED
]

{ #category : 'accessing enum' }
S3SDL_ProcessIO class >> SDL_PROCESS_STDIO_NULL [
	"This method was automatically generated"
	^ SDL_PROCESS_STDIO_NULL
]

{ #category : 'accessing enum' }
S3SDL_ProcessIO class >> SDL_PROCESS_STDIO_REDIRECT [
	"This method was automatically generated"
	^ SDL_PROCESS_STDIO_REDIRECT
]

{ #category : 'enum declaration' }
S3SDL_ProcessIO class >> enumDecl [

	^ #(
	SDL_PROCESS_STDIO_INHERITED 0
	SDL_PROCESS_STDIO_NULL 1
	SDL_PROCESS_STDIO_APP 2
	SDL_PROCESS_STDIO_REDIRECT 3 )
]
