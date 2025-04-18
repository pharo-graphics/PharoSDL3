Class {
	#name : 'S3SDL_InitStatus',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_INIT_STATUS_INITIALIZED',
		'SDL_INIT_STATUS_INITIALIZING',
		'SDL_INIT_STATUS_UNINITIALIZED',
		'SDL_INIT_STATUS_UNINITIALIZING'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
S3SDL_InitStatus class >> SDL_INIT_STATUS_INITIALIZED [
	"This method was automatically generated"
	^ SDL_INIT_STATUS_INITIALIZED
]

{ #category : 'accessing enum' }
S3SDL_InitStatus class >> SDL_INIT_STATUS_INITIALIZING [
	"This method was automatically generated"
	^ SDL_INIT_STATUS_INITIALIZING
]

{ #category : 'accessing enum' }
S3SDL_InitStatus class >> SDL_INIT_STATUS_UNINITIALIZED [
	"This method was automatically generated"
	^ SDL_INIT_STATUS_UNINITIALIZED
]

{ #category : 'accessing enum' }
S3SDL_InitStatus class >> SDL_INIT_STATUS_UNINITIALIZING [
	"This method was automatically generated"
	^ SDL_INIT_STATUS_UNINITIALIZING
]

{ #category : 'enum declaration' }
S3SDL_InitStatus class >> enumDecl [

	^ #(
	SDL_INIT_STATUS_UNINITIALIZED 0
	SDL_INIT_STATUS_INITIALIZING 1
	SDL_INIT_STATUS_INITIALIZED 2
	SDL_INIT_STATUS_UNINITIALIZING 3 )
]
