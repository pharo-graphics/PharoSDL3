Class {
	#name : 'SDL3MessageBoxColorType',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_MESSAGEBOX_COLOR_BACKGROUND',
		'SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND',
		'SDL_MESSAGEBOX_COLOR_BUTTON_BORDER',
		'SDL_MESSAGEBOX_COLOR_BUTTON_SELECTED',
		'SDL_MESSAGEBOX_COLOR_COUNT',
		'SDL_MESSAGEBOX_COLOR_TEXT'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
SDL3MessageBoxColorType class >> background [
	"This method was automatically generated"
	^ SDL_MESSAGEBOX_COLOR_BACKGROUND
]

{ #category : 'accessing enum' }
SDL3MessageBoxColorType class >> buttonBackground [
	"This method was automatically generated"
	^ SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND
]

{ #category : 'accessing enum' }
SDL3MessageBoxColorType class >> buttonBorder [
	"This method was automatically generated"
	^ SDL_MESSAGEBOX_COLOR_BUTTON_BORDER
]

{ #category : 'accessing enum' }
SDL3MessageBoxColorType class >> buttonSelected [
	"This method was automatically generated"
	^ SDL_MESSAGEBOX_COLOR_BUTTON_SELECTED
]

{ #category : 'accessing enum' }
SDL3MessageBoxColorType class >> count [
	"This method was automatically generated"
	^ SDL_MESSAGEBOX_COLOR_COUNT
]

{ #category : 'enum declaration' }
SDL3MessageBoxColorType class >> enumDecl [

	^ #(
	SDL_MESSAGEBOX_COLOR_BACKGROUND 0
	SDL_MESSAGEBOX_COLOR_TEXT 1
	SDL_MESSAGEBOX_COLOR_BUTTON_BORDER 2
	SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND 3
	SDL_MESSAGEBOX_COLOR_BUTTON_SELECTED 4
	SDL_MESSAGEBOX_COLOR_COUNT 5 )
]

{ #category : 'accessing enum' }
SDL3MessageBoxColorType class >> text [
	"This method was automatically generated"
	^ SDL_MESSAGEBOX_COLOR_TEXT
]
