Class {
	#name : 'S3SDL_Capitalization',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_CAPITALIZE_LETTERS',
		'SDL_CAPITALIZE_NONE',
		'SDL_CAPITALIZE_SENTENCES',
		'SDL_CAPITALIZE_WORDS'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
S3SDL_Capitalization class >> SDL_CAPITALIZE_LETTERS [
	"This method was automatically generated"
	^ SDL_CAPITALIZE_LETTERS
]

{ #category : 'accessing enum' }
S3SDL_Capitalization class >> SDL_CAPITALIZE_NONE [
	"This method was automatically generated"
	^ SDL_CAPITALIZE_NONE
]

{ #category : 'accessing enum' }
S3SDL_Capitalization class >> SDL_CAPITALIZE_SENTENCES [
	"This method was automatically generated"
	^ SDL_CAPITALIZE_SENTENCES
]

{ #category : 'accessing enum' }
S3SDL_Capitalization class >> SDL_CAPITALIZE_WORDS [
	"This method was automatically generated"
	^ SDL_CAPITALIZE_WORDS
]

{ #category : 'enum declaration' }
S3SDL_Capitalization class >> enumDecl [

	^ #(
	SDL_CAPITALIZE_NONE 0
	SDL_CAPITALIZE_SENTENCES 1
	SDL_CAPITALIZE_WORDS 2
	SDL_CAPITALIZE_LETTERS 3 )
]
