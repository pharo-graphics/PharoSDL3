Class {
	#name : 'SDL3ScaleMode',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_SCALEMODE_INVALID',
		'SDL_SCALEMODE_LINEAR',
		'SDL_SCALEMODE_NEAREST',
		'SDL_SCALEMODE_PIXELART'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'enum declaration' }
SDL3ScaleMode class >> enumDecl [

	^ #(
	SDL_SCALEMODE_INVALID -1
	SDL_SCALEMODE_NEAREST 0
	SDL_SCALEMODE_LINEAR 1
	SDL_SCALEMODE_PIXELART 2 )
]

{ #category : 'accessing enum' }
SDL3ScaleMode class >> invalid [
	"This method was automatically generated"
	^ SDL_SCALEMODE_INVALID
]

{ #category : 'accessing enum' }
SDL3ScaleMode class >> linear [
	"This method was automatically generated"
	^ SDL_SCALEMODE_LINEAR
]

{ #category : 'accessing enum' }
SDL3ScaleMode class >> nearest [
	"This method was automatically generated"
	^ SDL_SCALEMODE_NEAREST
]

{ #category : 'accessing enum' }
SDL3ScaleMode class >> pixelart [
	"This method was automatically generated"
	^ SDL_SCALEMODE_PIXELART
]
