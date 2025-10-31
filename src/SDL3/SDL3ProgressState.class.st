Class {
	#name : 'SDL3ProgressState',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_PROGRESS_STATE_ERROR',
		'SDL_PROGRESS_STATE_INDETERMINATE',
		'SDL_PROGRESS_STATE_INVALID',
		'SDL_PROGRESS_STATE_NONE',
		'SDL_PROGRESS_STATE_NORMAL',
		'SDL_PROGRESS_STATE_PAUSED'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'enum declaration' }
SDL3ProgressState class >> enumDecl [

	^ #(
	SDL_PROGRESS_STATE_INVALID -1
	SDL_PROGRESS_STATE_NONE 0
	SDL_PROGRESS_STATE_INDETERMINATE 1
	SDL_PROGRESS_STATE_NORMAL 2
	SDL_PROGRESS_STATE_PAUSED 3
	SDL_PROGRESS_STATE_ERROR 4 )
]

{ #category : 'accessing enum' }
SDL3ProgressState class >> error [
	"This method was automatically generated"
	^ SDL_PROGRESS_STATE_ERROR
]

{ #category : 'accessing enum' }
SDL3ProgressState class >> indeterminate [
	"This method was automatically generated"
	^ SDL_PROGRESS_STATE_INDETERMINATE
]

{ #category : 'accessing enum' }
SDL3ProgressState class >> invalid [
	"This method was automatically generated"
	^ SDL_PROGRESS_STATE_INVALID
]

{ #category : 'accessing enum' }
SDL3ProgressState class >> none [
	"This method was automatically generated"
	^ SDL_PROGRESS_STATE_NONE
]

{ #category : 'accessing enum' }
SDL3ProgressState class >> normal [
	"This method was automatically generated"
	^ SDL_PROGRESS_STATE_NORMAL
]

{ #category : 'accessing enum' }
SDL3ProgressState class >> paused [
	"This method was automatically generated"
	^ SDL_PROGRESS_STATE_PAUSED
]
