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
S3SDL_EventAction class >> SDL_ADDEVENT [
	"This method was automatically generated"
	^ SDL_ADDEVENT
]

{ #category : 'accessing enum' }
S3SDL_EventAction class >> SDL_GETEVENT [
	"This method was automatically generated"
	^ SDL_GETEVENT
]

{ #category : 'accessing enum' }
S3SDL_EventAction class >> SDL_PEEKEVENT [
	"This method was automatically generated"
	^ SDL_PEEKEVENT
]

{ #category : 'enum declaration' }
S3SDL_EventAction class >> enumDecl [

	^ #(
	SDL_ADDEVENT 0
	SDL_PEEKEVENT 1
	SDL_GETEVENT 2 )
]
