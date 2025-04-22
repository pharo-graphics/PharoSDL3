Class {
	#name : 'S3SDL_BlendOperation',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_BLENDOPERATION_ADD',
		'SDL_BLENDOPERATION_MAXIMUM',
		'SDL_BLENDOPERATION_MINIMUM',
		'SDL_BLENDOPERATION_REV_SUBTRACT',
		'SDL_BLENDOPERATION_SUBTRACT'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
S3SDL_BlendOperation class >> add [
	"This method was automatically generated"
	^ SDL_BLENDOPERATION_ADD
]

{ #category : 'enum declaration' }
S3SDL_BlendOperation class >> enumDecl [

	^ #(
	SDL_BLENDOPERATION_ADD 1
	SDL_BLENDOPERATION_SUBTRACT 2
	SDL_BLENDOPERATION_REV_SUBTRACT 3
	SDL_BLENDOPERATION_MINIMUM 4
	SDL_BLENDOPERATION_MAXIMUM 5 )
]

{ #category : 'accessing enum' }
S3SDL_BlendOperation class >> maximum [
	"This method was automatically generated"
	^ SDL_BLENDOPERATION_MAXIMUM
]

{ #category : 'accessing enum' }
S3SDL_BlendOperation class >> minimum [
	"This method was automatically generated"
	^ SDL_BLENDOPERATION_MINIMUM
]

{ #category : 'accessing enum' }
S3SDL_BlendOperation class >> revSubtract [
	"This method was automatically generated"
	^ SDL_BLENDOPERATION_REV_SUBTRACT
]

{ #category : 'accessing enum' }
S3SDL_BlendOperation class >> subtract [
	"This method was automatically generated"
	^ SDL_BLENDOPERATION_SUBTRACT
]
