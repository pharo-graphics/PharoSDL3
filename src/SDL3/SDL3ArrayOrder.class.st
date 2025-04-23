Class {
	#name : 'SDL3ArrayOrder',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_ARRAYORDER_ABGR',
		'SDL_ARRAYORDER_ARGB',
		'SDL_ARRAYORDER_BGR',
		'SDL_ARRAYORDER_BGRA',
		'SDL_ARRAYORDER_NONE',
		'SDL_ARRAYORDER_RGB',
		'SDL_ARRAYORDER_RGBA'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
SDL3ArrayOrder class >> abgr [
	"This method was automatically generated"
	^ SDL_ARRAYORDER_ABGR
]

{ #category : 'accessing enum' }
SDL3ArrayOrder class >> argb [
	"This method was automatically generated"
	^ SDL_ARRAYORDER_ARGB
]

{ #category : 'accessing enum' }
SDL3ArrayOrder class >> bgr [
	"This method was automatically generated"
	^ SDL_ARRAYORDER_BGR
]

{ #category : 'accessing enum' }
SDL3ArrayOrder class >> bgra [
	"This method was automatically generated"
	^ SDL_ARRAYORDER_BGRA
]

{ #category : 'enum declaration' }
SDL3ArrayOrder class >> enumDecl [

	^ #(
	SDL_ARRAYORDER_NONE 0
	SDL_ARRAYORDER_RGB 1
	SDL_ARRAYORDER_RGBA 2
	SDL_ARRAYORDER_ARGB 3
	SDL_ARRAYORDER_BGR 4
	SDL_ARRAYORDER_BGRA 5
	SDL_ARRAYORDER_ABGR 6 )
]

{ #category : 'accessing enum' }
SDL3ArrayOrder class >> none [
	"This method was automatically generated"
	^ SDL_ARRAYORDER_NONE
]

{ #category : 'accessing enum' }
SDL3ArrayOrder class >> rgb [
	"This method was automatically generated"
	^ SDL_ARRAYORDER_RGB
]

{ #category : 'accessing enum' }
SDL3ArrayOrder class >> rgba [
	"This method was automatically generated"
	^ SDL_ARRAYORDER_RGBA
]
