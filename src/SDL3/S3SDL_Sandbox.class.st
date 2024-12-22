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

{ #category : 'accessing enum' }
S3SDL_Sandbox class >> SDL_SANDBOX_FLATPAK [
	"This method was automatically generated"
	^ SDL_SANDBOX_FLATPAK
]

{ #category : 'accessing enum' }
S3SDL_Sandbox class >> SDL_SANDBOX_MACOS [
	"This method was automatically generated"
	^ SDL_SANDBOX_MACOS
]

{ #category : 'accessing enum' }
S3SDL_Sandbox class >> SDL_SANDBOX_NONE [
	"This method was automatically generated"
	^ SDL_SANDBOX_NONE
]

{ #category : 'accessing enum' }
S3SDL_Sandbox class >> SDL_SANDBOX_SNAP [
	"This method was automatically generated"
	^ SDL_SANDBOX_SNAP
]

{ #category : 'accessing enum' }
S3SDL_Sandbox class >> SDL_SANDBOX_UNKNOWN_CONTAINER [
	"This method was automatically generated"
	^ SDL_SANDBOX_UNKNOWN_CONTAINER
]

{ #category : 'enum declaration' }
S3SDL_Sandbox class >> enumDecl [

	^ #(
	SDL_SANDBOX_NONE 0
	SDL_SANDBOX_UNKNOWN_CONTAINER 1
	SDL_SANDBOX_FLATPAK 2
	SDL_SANDBOX_SNAP 3
	SDL_SANDBOX_MACOS 4 )
]
