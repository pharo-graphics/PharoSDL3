Class {
	#name : 'SDL3DisplayOrientation',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_ORIENTATION_LANDSCAPE',
		'SDL_ORIENTATION_LANDSCAPE_FLIPPED',
		'SDL_ORIENTATION_PORTRAIT',
		'SDL_ORIENTATION_PORTRAIT_FLIPPED',
		'SDL_ORIENTATION_UNKNOWN'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'enum declaration' }
SDL3DisplayOrientation class >> enumDecl [

	^ #(
	SDL_ORIENTATION_UNKNOWN 0
	SDL_ORIENTATION_LANDSCAPE 1
	SDL_ORIENTATION_LANDSCAPE_FLIPPED 2
	SDL_ORIENTATION_PORTRAIT 3
	SDL_ORIENTATION_PORTRAIT_FLIPPED 4 )
]

{ #category : 'accessing enum' }
SDL3DisplayOrientation class >> landscape [
	"This method was automatically generated"
	^ SDL_ORIENTATION_LANDSCAPE
]

{ #category : 'accessing enum' }
SDL3DisplayOrientation class >> landscapeFlipped [
	"This method was automatically generated"
	^ SDL_ORIENTATION_LANDSCAPE_FLIPPED
]

{ #category : 'accessing enum' }
SDL3DisplayOrientation class >> portrait [
	"This method was automatically generated"
	^ SDL_ORIENTATION_PORTRAIT
]

{ #category : 'accessing enum' }
SDL3DisplayOrientation class >> portraitFlipped [
	"This method was automatically generated"
	^ SDL_ORIENTATION_PORTRAIT_FLIPPED
]

{ #category : 'accessing enum' }
SDL3DisplayOrientation class >> unknown [
	"This method was automatically generated"
	^ SDL_ORIENTATION_UNKNOWN
]
