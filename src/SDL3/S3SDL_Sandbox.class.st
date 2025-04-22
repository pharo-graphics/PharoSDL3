Class {
	#name : 'S3SDL_Sandbox',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_SANDBOX_FLATPAK',
		'SDL_SANDBOX_MACOS',
		'SDL_SANDBOX_NONE',
		'SDL_SANDBOX_SNAP',
		'SDL_SANDBOX_UNKNOWN_CONTAINER'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'enum declaration' }
S3SDL_Sandbox class >> enumDecl [

	^ #(
	SDL_SANDBOX_NONE 0
	SDL_SANDBOX_UNKNOWN_CONTAINER 1
	SDL_SANDBOX_FLATPAK 2
	SDL_SANDBOX_SNAP 3
	SDL_SANDBOX_MACOS 4 )
]

{ #category : 'accessing enum' }
S3SDL_Sandbox class >> flatpak [
	"This method was automatically generated"
	^ SDL_SANDBOX_FLATPAK
]

{ #category : 'accessing enum' }
S3SDL_Sandbox class >> macos [
	"This method was automatically generated"
	^ SDL_SANDBOX_MACOS
]

{ #category : 'accessing enum' }
S3SDL_Sandbox class >> none [
	"This method was automatically generated"
	^ SDL_SANDBOX_NONE
]

{ #category : 'accessing enum' }
S3SDL_Sandbox class >> snap [
	"This method was automatically generated"
	^ SDL_SANDBOX_SNAP
]

{ #category : 'accessing enum' }
S3SDL_Sandbox class >> unknownContainer [
	"This method was automatically generated"
	^ SDL_SANDBOX_UNKNOWN_CONTAINER
]
