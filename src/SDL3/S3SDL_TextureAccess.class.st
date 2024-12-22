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

{ #category : 'accessing enum' }
S3SDL_TextureAccess class >> SDL_TEXTUREACCESS_STATIC [
	"This method was automatically generated"
	^ SDL_TEXTUREACCESS_STATIC
]

{ #category : 'accessing enum' }
S3SDL_TextureAccess class >> SDL_TEXTUREACCESS_STREAMING [
	"This method was automatically generated"
	^ SDL_TEXTUREACCESS_STREAMING
]

{ #category : 'accessing enum' }
S3SDL_TextureAccess class >> SDL_TEXTUREACCESS_TARGET [
	"This method was automatically generated"
	^ SDL_TEXTUREACCESS_TARGET
]

{ #category : 'enum declaration' }
S3SDL_TextureAccess class >> enumDecl [

	^ #(
	SDL_TEXTUREACCESS_STATIC 0
	SDL_TEXTUREACCESS_STREAMING 1
	SDL_TEXTUREACCESS_TARGET 2 )
]
