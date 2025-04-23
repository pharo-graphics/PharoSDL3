Class {
	#name : 'SDL3ThreadState',
	#superclass : 'SDL3Enumeration',
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
SDL3ThreadState class >> alive [
	"This method was automatically generated"
	^ SDL_THREAD_ALIVE
]

{ #category : 'accessing enum' }
SDL3ThreadState class >> complete [
	"This method was automatically generated"
	^ SDL_THREAD_COMPLETE
]

{ #category : 'accessing enum' }
SDL3ThreadState class >> detached [
	"This method was automatically generated"
	^ SDL_THREAD_DETACHED
]

{ #category : 'enum declaration' }
SDL3ThreadState class >> enumDecl [

	^ #(
	SDL_THREAD_UNKNOWN 0
	SDL_THREAD_ALIVE 1
	SDL_THREAD_DETACHED 2
	SDL_THREAD_COMPLETE 3 )
]

{ #category : 'accessing enum' }
SDL3ThreadState class >> unknown [
	"This method was automatically generated"
	^ SDL_THREAD_UNKNOWN
]
