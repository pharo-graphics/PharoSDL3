Class {
	#name : 'SDL3LogPriority',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_LOG_PRIORITY_COUNT',
		'SDL_LOG_PRIORITY_CRITICAL',
		'SDL_LOG_PRIORITY_DEBUG',
		'SDL_LOG_PRIORITY_ERROR',
		'SDL_LOG_PRIORITY_INFO',
		'SDL_LOG_PRIORITY_INVALID',
		'SDL_LOG_PRIORITY_TRACE',
		'SDL_LOG_PRIORITY_VERBOSE',
		'SDL_LOG_PRIORITY_WARN'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
SDL3LogPriority class >> count [
	"This method was automatically generated"
	^ SDL_LOG_PRIORITY_COUNT
]

{ #category : 'accessing enum' }
SDL3LogPriority class >> critical [
	"This method was automatically generated"
	^ SDL_LOG_PRIORITY_CRITICAL
]

{ #category : 'accessing enum' }
SDL3LogPriority class >> debug [
	"This method was automatically generated"
	^ SDL_LOG_PRIORITY_DEBUG
]

{ #category : 'enum declaration' }
SDL3LogPriority class >> enumDecl [

	^ #(
	SDL_LOG_PRIORITY_INVALID 0
	SDL_LOG_PRIORITY_TRACE 1
	SDL_LOG_PRIORITY_VERBOSE 2
	SDL_LOG_PRIORITY_DEBUG 3
	SDL_LOG_PRIORITY_INFO 4
	SDL_LOG_PRIORITY_WARN 5
	SDL_LOG_PRIORITY_ERROR 6
	SDL_LOG_PRIORITY_CRITICAL 7
	SDL_LOG_PRIORITY_COUNT 8 )
]

{ #category : 'accessing enum' }
SDL3LogPriority class >> error [
	"This method was automatically generated"
	^ SDL_LOG_PRIORITY_ERROR
]

{ #category : 'accessing enum' }
SDL3LogPriority class >> info [
	"This method was automatically generated"
	^ SDL_LOG_PRIORITY_INFO
]

{ #category : 'accessing enum' }
SDL3LogPriority class >> invalid [
	"This method was automatically generated"
	^ SDL_LOG_PRIORITY_INVALID
]

{ #category : 'accessing enum' }
SDL3LogPriority class >> trace [
	"This method was automatically generated"
	^ SDL_LOG_PRIORITY_TRACE
]

{ #category : 'accessing enum' }
SDL3LogPriority class >> verbose [
	"This method was automatically generated"
	^ SDL_LOG_PRIORITY_VERBOSE
]

{ #category : 'accessing enum' }
SDL3LogPriority class >> warn [
	"This method was automatically generated"
	^ SDL_LOG_PRIORITY_WARN
]
