Class {
	#name : 'SDL3PathType',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_PATHTYPE_DIRECTORY',
		'SDL_PATHTYPE_FILE',
		'SDL_PATHTYPE_NONE',
		'SDL_PATHTYPE_OTHER'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
SDL3PathType class >> directory [
	"This method was automatically generated"
	^ SDL_PATHTYPE_DIRECTORY
]

{ #category : 'enum declaration' }
SDL3PathType class >> enumDecl [

	^ #(
	SDL_PATHTYPE_NONE 0
	SDL_PATHTYPE_FILE 1
	SDL_PATHTYPE_DIRECTORY 2
	SDL_PATHTYPE_OTHER 3 )
]

{ #category : 'accessing enum' }
SDL3PathType class >> file [
	"This method was automatically generated"
	^ SDL_PATHTYPE_FILE
]

{ #category : 'accessing enum' }
SDL3PathType class >> none [
	"This method was automatically generated"
	^ SDL_PATHTYPE_NONE
]

{ #category : 'accessing enum' }
SDL3PathType class >> other [
	"This method was automatically generated"
	^ SDL_PATHTYPE_OTHER
]
