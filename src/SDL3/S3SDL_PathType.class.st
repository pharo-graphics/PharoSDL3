Class {
	#name : 'S3SDL_PathType',
	#superclass : 'S3Enumeration',
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
S3SDL_PathType class >> directory [
	"This method was automatically generated"
	^ SDL_PATHTYPE_DIRECTORY
]

{ #category : 'enum declaration' }
S3SDL_PathType class >> enumDecl [

	^ #(
	SDL_PATHTYPE_NONE 0
	SDL_PATHTYPE_FILE 1
	SDL_PATHTYPE_DIRECTORY 2
	SDL_PATHTYPE_OTHER 3 )
]

{ #category : 'accessing enum' }
S3SDL_PathType class >> file [
	"This method was automatically generated"
	^ SDL_PATHTYPE_FILE
]

{ #category : 'accessing enum' }
S3SDL_PathType class >> none [
	"This method was automatically generated"
	^ SDL_PATHTYPE_NONE
]

{ #category : 'accessing enum' }
S3SDL_PathType class >> other [
	"This method was automatically generated"
	^ SDL_PATHTYPE_OTHER
]
