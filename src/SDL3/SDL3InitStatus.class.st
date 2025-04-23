Class {
	#name : 'SDL3InitStatus',
	#superclass : 'SDL3Enumeration',
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

{ #category : 'enum declaration' }
SDL3InitStatus class >> enumDecl [

	^ #(
	SDL_INIT_STATUS_UNINITIALIZED 0
	SDL_INIT_STATUS_INITIALIZING 1
	SDL_INIT_STATUS_INITIALIZED 2
	SDL_INIT_STATUS_UNINITIALIZING 3 )
]

{ #category : 'accessing enum' }
SDL3InitStatus class >> initialized [
	"This method was automatically generated"
	^ SDL_INIT_STATUS_INITIALIZED
]

{ #category : 'accessing enum' }
SDL3InitStatus class >> initializing [
	"This method was automatically generated"
	^ SDL_INIT_STATUS_INITIALIZING
]

{ #category : 'accessing enum' }
SDL3InitStatus class >> uninitialized [
	"This method was automatically generated"
	^ SDL_INIT_STATUS_UNINITIALIZED
]

{ #category : 'accessing enum' }
SDL3InitStatus class >> uninitializing [
	"This method was automatically generated"
	^ SDL_INIT_STATUS_UNINITIALIZING
]
