Class {
	#name : 'SDL3PropertyType',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_PROPERTY_TYPE_BOOLEAN',
		'SDL_PROPERTY_TYPE_FLOAT',
		'SDL_PROPERTY_TYPE_INVALID',
		'SDL_PROPERTY_TYPE_NUMBER',
		'SDL_PROPERTY_TYPE_POINTER',
		'SDL_PROPERTY_TYPE_STRING'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
SDL3PropertyType class >> boolean [
	"This method was automatically generated"
	^ SDL_PROPERTY_TYPE_BOOLEAN
]

{ #category : 'enum declaration' }
SDL3PropertyType class >> enumDecl [

	^ #(
	SDL_PROPERTY_TYPE_INVALID 0
	SDL_PROPERTY_TYPE_POINTER 1
	SDL_PROPERTY_TYPE_STRING 2
	SDL_PROPERTY_TYPE_NUMBER 3
	SDL_PROPERTY_TYPE_FLOAT 4
	SDL_PROPERTY_TYPE_BOOLEAN 5 )
]

{ #category : 'accessing enum' }
SDL3PropertyType class >> float [
	"This method was automatically generated"
	^ SDL_PROPERTY_TYPE_FLOAT
]

{ #category : 'accessing enum' }
SDL3PropertyType class >> invalid [
	"This method was automatically generated"
	^ SDL_PROPERTY_TYPE_INVALID
]

{ #category : 'accessing enum' }
SDL3PropertyType class >> number [
	"This method was automatically generated"
	^ SDL_PROPERTY_TYPE_NUMBER
]

{ #category : 'accessing enum' }
SDL3PropertyType class >> pointer [
	"This method was automatically generated"
	^ SDL_PROPERTY_TYPE_POINTER
]

{ #category : 'accessing enum' }
SDL3PropertyType class >> string [
	"This method was automatically generated"
	^ SDL_PROPERTY_TYPE_STRING
]
