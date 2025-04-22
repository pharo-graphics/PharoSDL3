Class {
	#name : 'S3SDL_HintPriority',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_HINT_DEFAULT',
		'SDL_HINT_NORMAL',
		'SDL_HINT_OVERRIDE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
S3SDL_HintPriority class >> default [
	"This method was automatically generated"
	^ SDL_HINT_DEFAULT
]

{ #category : 'enum declaration' }
S3SDL_HintPriority class >> enumDecl [

	^ #(
	SDL_HINT_DEFAULT 0
	SDL_HINT_NORMAL 1
	SDL_HINT_OVERRIDE 2 )
]

{ #category : 'accessing enum' }
S3SDL_HintPriority class >> normal [
	"This method was automatically generated"
	^ SDL_HINT_NORMAL
]

{ #category : 'accessing enum' }
S3SDL_HintPriority class >> override [
	"This method was automatically generated"
	^ SDL_HINT_OVERRIDE
]
