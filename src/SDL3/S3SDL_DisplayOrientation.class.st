Class {
	#name : 'S3SDL_DisplayOrientation',
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

{ #category : 'accessing enum' }
S3SDL_DisplayOrientation class >> SDL_ORIENTATION_LANDSCAPE [
	"This method was automatically generated"
	^ SDL_ORIENTATION_LANDSCAPE
]

{ #category : 'accessing enum' }
S3SDL_DisplayOrientation class >> SDL_ORIENTATION_LANDSCAPE_FLIPPED [
	"This method was automatically generated"
	^ SDL_ORIENTATION_LANDSCAPE_FLIPPED
]

{ #category : 'accessing enum' }
S3SDL_DisplayOrientation class >> SDL_ORIENTATION_PORTRAIT [
	"This method was automatically generated"
	^ SDL_ORIENTATION_PORTRAIT
]

{ #category : 'accessing enum' }
S3SDL_DisplayOrientation class >> SDL_ORIENTATION_PORTRAIT_FLIPPED [
	"This method was automatically generated"
	^ SDL_ORIENTATION_PORTRAIT_FLIPPED
]

{ #category : 'accessing enum' }
S3SDL_DisplayOrientation class >> SDL_ORIENTATION_UNKNOWN [
	"This method was automatically generated"
	^ SDL_ORIENTATION_UNKNOWN
]

{ #category : 'enum declaration' }
S3SDL_DisplayOrientation class >> enumDecl [

	^ #(
	SDL_ORIENTATION_UNKNOWN 0
	SDL_ORIENTATION_LANDSCAPE 1
	SDL_ORIENTATION_LANDSCAPE_FLIPPED 2
	SDL_ORIENTATION_PORTRAIT 3
	SDL_ORIENTATION_PORTRAIT_FLIPPED 4 )
]
