Class {
	#name : 'S3SDL_MouseWheelDirection',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_MOUSEWHEEL_FLIPPED',
		'SDL_MOUSEWHEEL_NORMAL'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'enum declaration' }
S3SDL_MouseWheelDirection class >> enumDecl [

	^ #(
	SDL_MOUSEWHEEL_NORMAL 0
	SDL_MOUSEWHEEL_FLIPPED 1 )
]

{ #category : 'accessing enum' }
S3SDL_MouseWheelDirection class >> flipped [
	"This method was automatically generated"
	^ SDL_MOUSEWHEEL_FLIPPED
]

{ #category : 'accessing enum' }
S3SDL_MouseWheelDirection class >> normal [
	"This method was automatically generated"
	^ SDL_MOUSEWHEEL_NORMAL
]
