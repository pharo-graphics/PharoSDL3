Class {
	#name : 'S3SDL_AssertState',
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
S3SDL_AssertState class >> SDL_ASSERTION_ABORT [
	"This method was automatically generated"
	^ SDL_ASSERTION_ABORT
]

{ #category : 'accessing enum' }
S3SDL_AssertState class >> SDL_ASSERTION_ALWAYS_IGNORE [
	"This method was automatically generated"
	^ SDL_ASSERTION_ALWAYS_IGNORE
]

{ #category : 'accessing enum' }
S3SDL_AssertState class >> SDL_ASSERTION_BREAK [
	"This method was automatically generated"
	^ SDL_ASSERTION_BREAK
]

{ #category : 'accessing enum' }
S3SDL_AssertState class >> SDL_ASSERTION_IGNORE [
	"This method was automatically generated"
	^ SDL_ASSERTION_IGNORE
]

{ #category : 'accessing enum' }
S3SDL_AssertState class >> SDL_ASSERTION_RETRY [
	"This method was automatically generated"
	^ SDL_ASSERTION_RETRY
]

{ #category : 'enum declaration' }
S3SDL_AssertState class >> enumDecl [

	^ #(
	SDL_ASSERTION_RETRY 0
	SDL_ASSERTION_BREAK 1
	SDL_ASSERTION_ABORT 2
	SDL_ASSERTION_IGNORE 3
	SDL_ASSERTION_ALWAYS_IGNORE 4 )
]
