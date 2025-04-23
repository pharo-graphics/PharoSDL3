Class {
	#name : 'SDL3ChromaLocation',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_CHROMA_LOCATION_CENTER',
		'SDL_CHROMA_LOCATION_LEFT',
		'SDL_CHROMA_LOCATION_NONE',
		'SDL_CHROMA_LOCATION_TOPLEFT'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
SDL3ChromaLocation class >> center [
	"This method was automatically generated"
	^ SDL_CHROMA_LOCATION_CENTER
]

{ #category : 'enum declaration' }
SDL3ChromaLocation class >> enumDecl [

	^ #(
	SDL_CHROMA_LOCATION_NONE 0
	SDL_CHROMA_LOCATION_LEFT 1
	SDL_CHROMA_LOCATION_CENTER 2
	SDL_CHROMA_LOCATION_TOPLEFT 3 )
]

{ #category : 'accessing enum' }
SDL3ChromaLocation class >> left [
	"This method was automatically generated"
	^ SDL_CHROMA_LOCATION_LEFT
]

{ #category : 'accessing enum' }
SDL3ChromaLocation class >> none [
	"This method was automatically generated"
	^ SDL_CHROMA_LOCATION_NONE
]

{ #category : 'accessing enum' }
SDL3ChromaLocation class >> topLeft [
	"This method was automatically generated"
	^ SDL_CHROMA_LOCATION_TOPLEFT
]
