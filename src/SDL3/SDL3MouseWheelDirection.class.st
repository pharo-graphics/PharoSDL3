Class {
	#name : 'SDL3MouseWheelDirection',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_MOUSEWHEEL_FLIPPED',
		'SDL_MOUSEWHEEL_NORMAL'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'enum declaration' }
SDL3MouseWheelDirection class >> enumDecl [

	^ #(
	SDL_MOUSEWHEEL_NORMAL 0
	SDL_MOUSEWHEEL_FLIPPED 1 )
]

{ #category : 'accessing enum' }
SDL3MouseWheelDirection class >> flipped [
	"This method was automatically generated"
	^ SDL_MOUSEWHEEL_FLIPPED
]

{ #category : 'accessing enum' }
SDL3MouseWheelDirection class >> normal [
	"This method was automatically generated"
	^ SDL_MOUSEWHEEL_NORMAL
]
