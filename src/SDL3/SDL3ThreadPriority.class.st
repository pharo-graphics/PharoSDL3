Class {
	#name : 'SDL3ThreadPriority',
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

{ #category : 'enum declaration' }
SDL3ThreadPriority class >> enumDecl [

	^ #(
	SDL_THREAD_PRIORITY_LOW 0
	SDL_THREAD_PRIORITY_NORMAL 1
	SDL_THREAD_PRIORITY_HIGH 2
	SDL_THREAD_PRIORITY_TIME_CRITICAL 3 )
]

{ #category : 'accessing enum' }
SDL3ThreadPriority class >> high [
	"This method was automatically generated"
	^ SDL_THREAD_PRIORITY_HIGH
]

{ #category : 'accessing enum' }
SDL3ThreadPriority class >> low [
	"This method was automatically generated"
	^ SDL_THREAD_PRIORITY_LOW
]

{ #category : 'accessing enum' }
SDL3ThreadPriority class >> normal [
	"This method was automatically generated"
	^ SDL_THREAD_PRIORITY_NORMAL
]

{ #category : 'accessing enum' }
SDL3ThreadPriority class >> timeCritical [
	"This method was automatically generated"
	^ SDL_THREAD_PRIORITY_TIME_CRITICAL
]
