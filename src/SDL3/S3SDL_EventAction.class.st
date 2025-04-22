Class {
	#name : 'S3SDL_EventAction',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_ADDEVENT',
		'SDL_GETEVENT',
		'SDL_PEEKEVENT'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
S3SDL_EventAction class >> addEvent [
	"This method was automatically generated"
	^ SDL_ADDEVENT
]

{ #category : 'enum declaration' }
S3SDL_EventAction class >> enumDecl [

	^ #(
	SDL_ADDEVENT 0
	SDL_PEEKEVENT 1
	SDL_GETEVENT 2 )
]

{ #category : 'accessing enum' }
S3SDL_EventAction class >> getEvent [
	"This method was automatically generated"
	^ SDL_GETEVENT
]

{ #category : 'accessing enum' }
S3SDL_EventAction class >> peekEvent [
	"This method was automatically generated"
	^ SDL_PEEKEVENT
]
