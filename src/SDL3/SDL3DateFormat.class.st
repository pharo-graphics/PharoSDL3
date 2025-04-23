Class {
	#name : 'SDL3DateFormat',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_DATE_FORMAT_DDMMYYYY',
		'SDL_DATE_FORMAT_MMDDYYYY',
		'SDL_DATE_FORMAT_YYYYMMDD'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
SDL3DateFormat class >> ddmmyyyy [
	"This method was automatically generated"
	^ SDL_DATE_FORMAT_DDMMYYYY
]

{ #category : 'enum declaration' }
SDL3DateFormat class >> enumDecl [

	^ #(
	SDL_DATE_FORMAT_YYYYMMDD 0
	SDL_DATE_FORMAT_DDMMYYYY 1
	SDL_DATE_FORMAT_MMDDYYYY 2 )
]

{ #category : 'accessing enum' }
SDL3DateFormat class >> mmddyyyy [
	"This method was automatically generated"
	^ SDL_DATE_FORMAT_MMDDYYYY
]

{ #category : 'accessing enum' }
SDL3DateFormat class >> yyyymmdd [
	"This method was automatically generated"
	^ SDL_DATE_FORMAT_YYYYMMDD
]
