Class {
	#name : 'S3SDL_TextureAccess',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_TEXTUREACCESS_STATIC',
		'SDL_TEXTUREACCESS_STREAMING',
		'SDL_TEXTUREACCESS_TARGET'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'enum declaration' }
S3SDL_TextureAccess class >> enumDecl [

	^ #(
	SDL_TEXTUREACCESS_STATIC 0
	SDL_TEXTUREACCESS_STREAMING 1
	SDL_TEXTUREACCESS_TARGET 2 )
]

{ #category : 'accessing enum' }
S3SDL_TextureAccess class >> static [
	"This method was automatically generated"
	^ SDL_TEXTUREACCESS_STATIC
]

{ #category : 'accessing enum' }
S3SDL_TextureAccess class >> streaming [
	"This method was automatically generated"
	^ SDL_TEXTUREACCESS_STREAMING
]

{ #category : 'accessing enum' }
S3SDL_TextureAccess class >> target [
	"This method was automatically generated"
	^ SDL_TEXTUREACCESS_TARGET
]
