"
I am a SDL3 FFI binding for `SDL_SystemTheme`.

System theme.

See: https://wiki.libsdl.org/SDL3/SDL_SystemTheme
"
Class {
	#name : 'SDL3SystemTheme',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_SYSTEM_THEME_DARK',
		'SDL_SYSTEM_THEME_LIGHT',
		'SDL_SYSTEM_THEME_UNKNOWN'
	],
	#category : 'SDL3-Enumerations',
	#package : 'SDL3',
	#tag : 'Enumerations'
}

{ #category : 'accessing enum' }
SDL3SystemTheme class >> dark [
	"This method was automatically generated"
	^ SDL_SYSTEM_THEME_DARK
]

{ #category : 'enum declaration' }
SDL3SystemTheme class >> enumDecl [

	^ #(
	SDL_SYSTEM_THEME_UNKNOWN 0
	SDL_SYSTEM_THEME_LIGHT 1
	SDL_SYSTEM_THEME_DARK 2 )
]

{ #category : 'accessing enum' }
SDL3SystemTheme class >> light [
	"This method was automatically generated"
	^ SDL_SYSTEM_THEME_LIGHT
]

{ #category : 'accessing enum' }
SDL3SystemTheme class >> unknown [
	"This method was automatically generated"
	^ SDL_SYSTEM_THEME_UNKNOWN
]
