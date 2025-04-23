Class {
	#name : 'SDL3EventAction',
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
SDL3EventAction class >> addEvent [
	"This method was automatically generated"
	^ SDL_ADDEVENT
]

{ #category : 'enum declaration' }
SDL3EventAction class >> enumDecl [

	^ #(
	SDL_ADDEVENT 0
	SDL_PEEKEVENT 1
	SDL_GETEVENT 2 )
]

{ #category : 'accessing enum' }
SDL3EventAction class >> getEvent [
	"This method was automatically generated"
	^ SDL_GETEVENT
]

{ #category : 'accessing enum' }
SDL3EventAction class >> peekEvent [
	"This method was automatically generated"
	^ SDL_PEEKEVENT
]
