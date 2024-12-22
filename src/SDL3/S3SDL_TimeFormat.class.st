Class {
	#name : 'S3SDL_TimeFormat',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_TIME_FORMAT_12HR',
		'SDL_TIME_FORMAT_24HR'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
S3SDL_TimeFormat class >> SDL_TIME_FORMAT_12HR [
	"This method was automatically generated"
	^ SDL_TIME_FORMAT_12HR
]

{ #category : 'accessing enum' }
S3SDL_TimeFormat class >> SDL_TIME_FORMAT_24HR [
	"This method was automatically generated"
	^ SDL_TIME_FORMAT_24HR
]

{ #category : 'enum declaration' }
S3SDL_TimeFormat class >> enumDecl [

	^ #(
	SDL_TIME_FORMAT_24HR 0
	SDL_TIME_FORMAT_12HR 1 )
]
