Class {
	#name : 'SDL3BlendOperation',
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
SDL3BlendOperation class >> add [
	"This method was automatically generated"
	^ SDL_BLENDOPERATION_ADD
]

{ #category : 'enum declaration' }
SDL3BlendOperation class >> enumDecl [

	^ #(
	SDL_BLENDOPERATION_ADD 1
	SDL_BLENDOPERATION_SUBTRACT 2
	SDL_BLENDOPERATION_REV_SUBTRACT 3
	SDL_BLENDOPERATION_MINIMUM 4
	SDL_BLENDOPERATION_MAXIMUM 5 )
]

{ #category : 'accessing enum' }
SDL3BlendOperation class >> maximum [
	"This method was automatically generated"
	^ SDL_BLENDOPERATION_MAXIMUM
]

{ #category : 'accessing enum' }
SDL3BlendOperation class >> minimum [
	"This method was automatically generated"
	^ SDL_BLENDOPERATION_MINIMUM
]

{ #category : 'accessing enum' }
SDL3BlendOperation class >> revSubtract [
	"This method was automatically generated"
	^ SDL_BLENDOPERATION_REV_SUBTRACT
]

{ #category : 'accessing enum' }
SDL3BlendOperation class >> subtract [
	"This method was automatically generated"
	^ SDL_BLENDOPERATION_SUBTRACT
]
