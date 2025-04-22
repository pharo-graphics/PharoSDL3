Class {
	#name : 'S3SDL_ThreadState',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_THREAD_ALIVE',
		'SDL_THREAD_COMPLETE',
		'SDL_THREAD_DETACHED',
		'SDL_THREAD_UNKNOWN'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
S3SDL_ThreadState class >> alive [
	"This method was automatically generated"
	^ SDL_THREAD_ALIVE
]

{ #category : 'accessing enum' }
S3SDL_ThreadState class >> complete [
	"This method was automatically generated"
	^ SDL_THREAD_COMPLETE
]

{ #category : 'accessing enum' }
S3SDL_ThreadState class >> detached [
	"This method was automatically generated"
	^ SDL_THREAD_DETACHED
]

{ #category : 'enum declaration' }
S3SDL_ThreadState class >> enumDecl [

	^ #(
	SDL_THREAD_UNKNOWN 0
	SDL_THREAD_ALIVE 1
	SDL_THREAD_DETACHED 2
	SDL_THREAD_COMPLETE 3 )
]

{ #category : 'accessing enum' }
S3SDL_ThreadState class >> unknown [
	"This method was automatically generated"
	^ SDL_THREAD_UNKNOWN
]
