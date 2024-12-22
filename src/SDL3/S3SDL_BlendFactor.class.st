Class {
	#name : 'S3SDL_BlendFactor',
	#superclass : 'S3Enumeration',
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
S3SDL_BlendFactor class >> SDL_BLENDFACTOR_DST_ALPHA [
	"This method was automatically generated"
	^ SDL_BLENDFACTOR_DST_ALPHA
]

{ #category : 'accessing enum' }
S3SDL_BlendFactor class >> SDL_BLENDFACTOR_DST_COLOR [
	"This method was automatically generated"
	^ SDL_BLENDFACTOR_DST_COLOR
]

{ #category : 'accessing enum' }
S3SDL_BlendFactor class >> SDL_BLENDFACTOR_ONE [
	"This method was automatically generated"
	^ SDL_BLENDFACTOR_ONE
]

{ #category : 'accessing enum' }
S3SDL_BlendFactor class >> SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA [
	"This method was automatically generated"
	^ SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA
]

{ #category : 'accessing enum' }
S3SDL_BlendFactor class >> SDL_BLENDFACTOR_ONE_MINUS_DST_COLOR [
	"This method was automatically generated"
	^ SDL_BLENDFACTOR_ONE_MINUS_DST_COLOR
]

{ #category : 'accessing enum' }
S3SDL_BlendFactor class >> SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA [
	"This method was automatically generated"
	^ SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA
]

{ #category : 'accessing enum' }
S3SDL_BlendFactor class >> SDL_BLENDFACTOR_ONE_MINUS_SRC_COLOR [
	"This method was automatically generated"
	^ SDL_BLENDFACTOR_ONE_MINUS_SRC_COLOR
]

{ #category : 'accessing enum' }
S3SDL_BlendFactor class >> SDL_BLENDFACTOR_SRC_ALPHA [
	"This method was automatically generated"
	^ SDL_BLENDFACTOR_SRC_ALPHA
]

{ #category : 'accessing enum' }
S3SDL_BlendFactor class >> SDL_BLENDFACTOR_SRC_COLOR [
	"This method was automatically generated"
	^ SDL_BLENDFACTOR_SRC_COLOR
]

{ #category : 'accessing enum' }
S3SDL_BlendFactor class >> SDL_BLENDFACTOR_ZERO [
	"This method was automatically generated"
	^ SDL_BLENDFACTOR_ZERO
]

{ #category : 'enum declaration' }
S3SDL_BlendFactor class >> enumDecl [

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
