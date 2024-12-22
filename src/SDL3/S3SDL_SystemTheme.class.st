Class {
	#name : 'S3SDL_SystemTheme',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_SYSTEM_THEME_DARK',
		'SDL_SYSTEM_THEME_LIGHT',
		'SDL_SYSTEM_THEME_UNKNOWN'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
S3SDL_SystemTheme class >> SDL_SYSTEM_THEME_DARK [
	"This method was automatically generated"
	^ SDL_SYSTEM_THEME_DARK
]

{ #category : 'accessing enum' }
S3SDL_SystemTheme class >> SDL_SYSTEM_THEME_LIGHT [
	"This method was automatically generated"
	^ SDL_SYSTEM_THEME_LIGHT
]

{ #category : 'accessing enum' }
S3SDL_SystemTheme class >> SDL_SYSTEM_THEME_UNKNOWN [
	"This method was automatically generated"
	^ SDL_SYSTEM_THEME_UNKNOWN
]

{ #category : 'enum declaration' }
S3SDL_SystemTheme class >> enumDecl [

	^ #(
	SDL_SYSTEM_THEME_UNKNOWN 0
	SDL_SYSTEM_THEME_LIGHT 1
	SDL_SYSTEM_THEME_DARK 2 )
]
