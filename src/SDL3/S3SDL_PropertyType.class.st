Class {
	#name : 'S3SDL_PropertyType',
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
S3SDL_PropertyType class >> SDL_PROPERTY_TYPE_BOOLEAN [
	"This method was automatically generated"
	^ SDL_PROPERTY_TYPE_BOOLEAN
]

{ #category : 'accessing enum' }
S3SDL_PropertyType class >> SDL_PROPERTY_TYPE_FLOAT [
	"This method was automatically generated"
	^ SDL_PROPERTY_TYPE_FLOAT
]

{ #category : 'accessing enum' }
S3SDL_PropertyType class >> SDL_PROPERTY_TYPE_INVALID [
	"This method was automatically generated"
	^ SDL_PROPERTY_TYPE_INVALID
]

{ #category : 'accessing enum' }
S3SDL_PropertyType class >> SDL_PROPERTY_TYPE_NUMBER [
	"This method was automatically generated"
	^ SDL_PROPERTY_TYPE_NUMBER
]

{ #category : 'accessing enum' }
S3SDL_PropertyType class >> SDL_PROPERTY_TYPE_POINTER [
	"This method was automatically generated"
	^ SDL_PROPERTY_TYPE_POINTER
]

{ #category : 'accessing enum' }
S3SDL_PropertyType class >> SDL_PROPERTY_TYPE_STRING [
	"This method was automatically generated"
	^ SDL_PROPERTY_TYPE_STRING
]

{ #category : 'enum declaration' }
S3SDL_PropertyType class >> enumDecl [

	^ #(
	SDL_PROPERTY_TYPE_INVALID 0
	SDL_PROPERTY_TYPE_POINTER 1
	SDL_PROPERTY_TYPE_STRING 2
	SDL_PROPERTY_TYPE_NUMBER 3
	SDL_PROPERTY_TYPE_FLOAT 4
	SDL_PROPERTY_TYPE_BOOLEAN 5 )
]
