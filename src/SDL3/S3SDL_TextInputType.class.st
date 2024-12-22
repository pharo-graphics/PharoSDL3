Class {
	#name : 'S3SDL_TextInputType',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_TEXTINPUT_TYPE_NUMBER',
		'SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_HIDDEN',
		'SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_VISIBLE',
		'SDL_TEXTINPUT_TYPE_TEXT',
		'SDL_TEXTINPUT_TYPE_TEXT_EMAIL',
		'SDL_TEXTINPUT_TYPE_TEXT_NAME',
		'SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_HIDDEN',
		'SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_VISIBLE',
		'SDL_TEXTINPUT_TYPE_TEXT_USERNAME'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
S3SDL_TextInputType class >> SDL_TEXTINPUT_TYPE_NUMBER [
	"This method was automatically generated"
	^ SDL_TEXTINPUT_TYPE_NUMBER
]

{ #category : 'accessing enum' }
S3SDL_TextInputType class >> SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_HIDDEN [
	"This method was automatically generated"
	^ SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_HIDDEN
]

{ #category : 'accessing enum' }
S3SDL_TextInputType class >> SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_VISIBLE [
	"This method was automatically generated"
	^ SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_VISIBLE
]

{ #category : 'accessing enum' }
S3SDL_TextInputType class >> SDL_TEXTINPUT_TYPE_TEXT [
	"This method was automatically generated"
	^ SDL_TEXTINPUT_TYPE_TEXT
]

{ #category : 'accessing enum' }
S3SDL_TextInputType class >> SDL_TEXTINPUT_TYPE_TEXT_EMAIL [
	"This method was automatically generated"
	^ SDL_TEXTINPUT_TYPE_TEXT_EMAIL
]

{ #category : 'accessing enum' }
S3SDL_TextInputType class >> SDL_TEXTINPUT_TYPE_TEXT_NAME [
	"This method was automatically generated"
	^ SDL_TEXTINPUT_TYPE_TEXT_NAME
]

{ #category : 'accessing enum' }
S3SDL_TextInputType class >> SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_HIDDEN [
	"This method was automatically generated"
	^ SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_HIDDEN
]

{ #category : 'accessing enum' }
S3SDL_TextInputType class >> SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_VISIBLE [
	"This method was automatically generated"
	^ SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_VISIBLE
]

{ #category : 'accessing enum' }
S3SDL_TextInputType class >> SDL_TEXTINPUT_TYPE_TEXT_USERNAME [
	"This method was automatically generated"
	^ SDL_TEXTINPUT_TYPE_TEXT_USERNAME
]

{ #category : 'enum declaration' }
S3SDL_TextInputType class >> enumDecl [

	^ #(
	SDL_TEXTINPUT_TYPE_TEXT 0
	SDL_TEXTINPUT_TYPE_TEXT_NAME 1
	SDL_TEXTINPUT_TYPE_TEXT_EMAIL 2
	SDL_TEXTINPUT_TYPE_TEXT_USERNAME 3
	SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_HIDDEN 4
	SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_VISIBLE 5
	SDL_TEXTINPUT_TYPE_NUMBER 6
	SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_HIDDEN 7
	SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_VISIBLE 8 )
]
