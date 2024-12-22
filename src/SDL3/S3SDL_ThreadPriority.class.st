Class {
	#name : 'S3SDL_ThreadPriority',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_THREAD_PRIORITY_HIGH',
		'SDL_THREAD_PRIORITY_LOW',
		'SDL_THREAD_PRIORITY_NORMAL',
		'SDL_THREAD_PRIORITY_TIME_CRITICAL'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
S3SDL_ThreadPriority class >> SDL_THREAD_PRIORITY_HIGH [
	"This method was automatically generated"
	^ SDL_THREAD_PRIORITY_HIGH
]

{ #category : 'accessing enum' }
S3SDL_ThreadPriority class >> SDL_THREAD_PRIORITY_LOW [
	"This method was automatically generated"
	^ SDL_THREAD_PRIORITY_LOW
]

{ #category : 'accessing enum' }
S3SDL_ThreadPriority class >> SDL_THREAD_PRIORITY_NORMAL [
	"This method was automatically generated"
	^ SDL_THREAD_PRIORITY_NORMAL
]

{ #category : 'accessing enum' }
S3SDL_ThreadPriority class >> SDL_THREAD_PRIORITY_TIME_CRITICAL [
	"This method was automatically generated"
	^ SDL_THREAD_PRIORITY_TIME_CRITICAL
]

{ #category : 'enum declaration' }
S3SDL_ThreadPriority class >> enumDecl [

	^ #(
	SDL_THREAD_PRIORITY_LOW 0
	SDL_THREAD_PRIORITY_NORMAL 1
	SDL_THREAD_PRIORITY_HIGH 2
	SDL_THREAD_PRIORITY_TIME_CRITICAL 3 )
]
