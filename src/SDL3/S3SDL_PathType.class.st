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
S3SDL_PathType class >> SDL_PATHTYPE_DIRECTORY [
	"This method was automatically generated"
	^ SDL_PATHTYPE_DIRECTORY
]

{ #category : 'accessing enum' }
S3SDL_PathType class >> SDL_PATHTYPE_FILE [
	"This method was automatically generated"
	^ SDL_PATHTYPE_FILE
]

{ #category : 'accessing enum' }
S3SDL_PathType class >> SDL_PATHTYPE_NONE [
	"This method was automatically generated"
	^ SDL_PATHTYPE_NONE
]

{ #category : 'accessing enum' }
S3SDL_PathType class >> SDL_PATHTYPE_OTHER [
	"This method was automatically generated"
	^ SDL_PATHTYPE_OTHER
]

{ #category : 'enum declaration' }
S3SDL_PathType class >> enumDecl [

	^ #(
	SDL_PATHTYPE_NONE 0
	SDL_PATHTYPE_FILE 1
	SDL_PATHTYPE_DIRECTORY 2
	SDL_PATHTYPE_OTHER 3 )
]
