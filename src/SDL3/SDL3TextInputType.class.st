Class {
	#name : 'SDL3TextInputType',
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

{ #category : 'enum declaration' }
SDL3TextInputType class >> enumDecl [

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

{ #category : 'accessing enum' }
SDL3TextInputType class >> number [
	"This method was automatically generated"
	^ SDL_TEXTINPUT_TYPE_NUMBER
]

{ #category : 'accessing enum' }
SDL3TextInputType class >> numberPasswordHidden [
	"This method was automatically generated"
	^ SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_HIDDEN
]

{ #category : 'accessing enum' }
SDL3TextInputType class >> numberPasswordVisible [
	"This method was automatically generated"
	^ SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_VISIBLE
]

{ #category : 'accessing enum' }
SDL3TextInputType class >> text [
	"This method was automatically generated"
	^ SDL_TEXTINPUT_TYPE_TEXT
]

{ #category : 'accessing enum' }
SDL3TextInputType class >> textEmail [
	"This method was automatically generated"
	^ SDL_TEXTINPUT_TYPE_TEXT_EMAIL
]

{ #category : 'accessing enum' }
SDL3TextInputType class >> textName [
	"This method was automatically generated"
	^ SDL_TEXTINPUT_TYPE_TEXT_NAME
]

{ #category : 'accessing enum' }
SDL3TextInputType class >> textPasswordHidden [
	"This method was automatically generated"
	^ SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_HIDDEN
]

{ #category : 'accessing enum' }
SDL3TextInputType class >> textPasswordVisible [
	"This method was automatically generated"
	^ SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_VISIBLE
]

{ #category : 'accessing enum' }
SDL3TextInputType class >> textUsername [
	"This method was automatically generated"
	^ SDL_TEXTINPUT_TYPE_TEXT_USERNAME
]
