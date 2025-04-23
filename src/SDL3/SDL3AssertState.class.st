Class {
	#name : 'SDL3AssertState',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_ASSERTION_ABORT',
		'SDL_ASSERTION_ALWAYS_IGNORE',
		'SDL_ASSERTION_BREAK',
		'SDL_ASSERTION_IGNORE',
		'SDL_ASSERTION_RETRY'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
SDL3AssertState class >> abort [
	"This method was automatically generated"
	^ SDL_ASSERTION_ABORT
]

{ #category : 'accessing enum' }
SDL3AssertState class >> alwaysIgnore [
	"This method was automatically generated"
	^ SDL_ASSERTION_ALWAYS_IGNORE
]

{ #category : 'accessing enum' }
SDL3AssertState class >> break [
	"This method was automatically generated"
	^ SDL_ASSERTION_BREAK
]

{ #category : 'enum declaration' }
SDL3AssertState class >> enumDecl [

	^ #(
	SDL_ASSERTION_RETRY 0
	SDL_ASSERTION_BREAK 1
	SDL_ASSERTION_ABORT 2
	SDL_ASSERTION_IGNORE 3
	SDL_ASSERTION_ALWAYS_IGNORE 4 )
]

{ #category : 'accessing enum' }
SDL3AssertState class >> ignore [
	"This method was automatically generated"
	^ SDL_ASSERTION_IGNORE
]

{ #category : 'accessing enum' }
SDL3AssertState class >> retry [
	"This method was automatically generated"
	^ SDL_ASSERTION_RETRY
]
