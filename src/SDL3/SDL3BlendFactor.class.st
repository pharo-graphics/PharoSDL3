Class {
	#name : 'SDL3BlendFactor',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_BLENDFACTOR_DST_ALPHA',
		'SDL_BLENDFACTOR_DST_COLOR',
		'SDL_BLENDFACTOR_ONE',
		'SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA',
		'SDL_BLENDFACTOR_ONE_MINUS_DST_COLOR',
		'SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA',
		'SDL_BLENDFACTOR_ONE_MINUS_SRC_COLOR',
		'SDL_BLENDFACTOR_SRC_ALPHA',
		'SDL_BLENDFACTOR_SRC_COLOR',
		'SDL_BLENDFACTOR_ZERO'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
SDL3BlendFactor class >> dstAlpha [
	"This method was automatically generated"
	^ SDL_BLENDFACTOR_DST_ALPHA
]

{ #category : 'accessing enum' }
SDL3BlendFactor class >> dstColor [
	"This method was automatically generated"
	^ SDL_BLENDFACTOR_DST_COLOR
]

{ #category : 'enum declaration' }
SDL3BlendFactor class >> enumDecl [

	^ #(
	SDL_BLENDFACTOR_ZERO 1
	SDL_BLENDFACTOR_ONE 2
	SDL_BLENDFACTOR_SRC_COLOR 3
	SDL_BLENDFACTOR_ONE_MINUS_SRC_COLOR 4
	SDL_BLENDFACTOR_SRC_ALPHA 5
	SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA 6
	SDL_BLENDFACTOR_DST_COLOR 7
	SDL_BLENDFACTOR_ONE_MINUS_DST_COLOR 8
	SDL_BLENDFACTOR_DST_ALPHA 9
	SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA 10 )
]

{ #category : 'accessing enum' }
SDL3BlendFactor class >> one [
	"This method was automatically generated"
	^ SDL_BLENDFACTOR_ONE
]

{ #category : 'accessing enum' }
SDL3BlendFactor class >> oneMinusDstAlpha [
	"This method was automatically generated"
	^ SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA
]

{ #category : 'accessing enum' }
SDL3BlendFactor class >> oneMinusDstColor [
	"This method was automatically generated"
	^ SDL_BLENDFACTOR_ONE_MINUS_DST_COLOR
]

{ #category : 'accessing enum' }
SDL3BlendFactor class >> oneMinusSrcAlpha [
	"This method was automatically generated"
	^ SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA
]

{ #category : 'accessing enum' }
SDL3BlendFactor class >> oneMinusSrcColor [
	"This method was automatically generated"
	^ SDL_BLENDFACTOR_ONE_MINUS_SRC_COLOR
]

{ #category : 'accessing enum' }
SDL3BlendFactor class >> srcAlpha [
	"This method was automatically generated"
	^ SDL_BLENDFACTOR_SRC_ALPHA
]

{ #category : 'accessing enum' }
SDL3BlendFactor class >> srcColor [
	"This method was automatically generated"
	^ SDL_BLENDFACTOR_SRC_COLOR
]

{ #category : 'accessing enum' }
SDL3BlendFactor class >> zero [
	"This method was automatically generated"
	^ SDL_BLENDFACTOR_ZERO
]
