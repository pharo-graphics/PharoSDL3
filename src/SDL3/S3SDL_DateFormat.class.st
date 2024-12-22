Class {
	#name : 'S3SDL_DateFormat',
	#superclass : 'S3Enumeration',
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
S3SDL_DateFormat class >> SDL_DATE_FORMAT_DDMMYYYY [
	"This method was automatically generated"
	^ SDL_DATE_FORMAT_DDMMYYYY
]

{ #category : 'accessing enum' }
S3SDL_DateFormat class >> SDL_DATE_FORMAT_MMDDYYYY [
	"This method was automatically generated"
	^ SDL_DATE_FORMAT_MMDDYYYY
]

{ #category : 'accessing enum' }
S3SDL_DateFormat class >> SDL_DATE_FORMAT_YYYYMMDD [
	"This method was automatically generated"
	^ SDL_DATE_FORMAT_YYYYMMDD
]

{ #category : 'enum declaration' }
S3SDL_DateFormat class >> enumDecl [

	^ #(
	SDL_DATE_FORMAT_YYYYMMDD 0
	SDL_DATE_FORMAT_DDMMYYYY 1
	SDL_DATE_FORMAT_MMDDYYYY 2 )
]
