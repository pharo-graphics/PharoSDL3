Class {
	#name : 'S3SDL_ArrayOrder',
	#superclass : 'S3Enumeration',
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
S3SDL_ArrayOrder class >> abgr [
	"This method was automatically generated"
	^ SDL_ARRAYORDER_ABGR
]

{ #category : 'accessing enum' }
S3SDL_ArrayOrder class >> argb [
	"This method was automatically generated"
	^ SDL_ARRAYORDER_ARGB
]

{ #category : 'accessing enum' }
S3SDL_ArrayOrder class >> bgr [
	"This method was automatically generated"
	^ SDL_ARRAYORDER_BGR
]

{ #category : 'accessing enum' }
S3SDL_ArrayOrder class >> bgra [
	"This method was automatically generated"
	^ SDL_ARRAYORDER_BGRA
]

{ #category : 'enum declaration' }
S3SDL_ArrayOrder class >> enumDecl [

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
S3SDL_ArrayOrder class >> none [
	"This method was automatically generated"
	^ SDL_ARRAYORDER_NONE
]

{ #category : 'accessing enum' }
S3SDL_ArrayOrder class >> rgb [
	"This method was automatically generated"
	^ SDL_ARRAYORDER_RGB
]

{ #category : 'accessing enum' }
S3SDL_ArrayOrder class >> rgba [
	"This method was automatically generated"
	^ SDL_ARRAYORDER_RGBA
]
