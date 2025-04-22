Class {
	#name : 'S3SDL_ScaleMode',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_SCALEMODE_INVALID',
		'SDL_SCALEMODE_LINEAR',
		'SDL_SCALEMODE_NEAREST'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'enum declaration' }
S3SDL_ScaleMode class >> enumDecl [

	^ #(
	SDL_SCALEMODE_INVALID -1
	SDL_SCALEMODE_NEAREST 0
	SDL_SCALEMODE_LINEAR 1 )
]

{ #category : 'accessing enum' }
S3SDL_ScaleMode class >> invalid [
	"This method was automatically generated"
	^ SDL_SCALEMODE_INVALID
]

{ #category : 'accessing enum' }
S3SDL_ScaleMode class >> linear [
	"This method was automatically generated"
	^ SDL_SCALEMODE_LINEAR
]

{ #category : 'accessing enum' }
S3SDL_ScaleMode class >> nearest [
	"This method was automatically generated"
	^ SDL_SCALEMODE_NEAREST
]
