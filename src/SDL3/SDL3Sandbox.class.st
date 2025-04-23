Class {
	#name : 'SDL3Sandbox',
	#superclass : 'SDL3Enumeration',
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
SDL3Sandbox class >> enumDecl [

	^ #(
	SDL_SANDBOX_NONE 0
	SDL_SANDBOX_UNKNOWN_CONTAINER 1
	SDL_SANDBOX_FLATPAK 2
	SDL_SANDBOX_SNAP 3
	SDL_SANDBOX_MACOS 4 )
]

{ #category : 'accessing enum' }
SDL3Sandbox class >> flatpak [
	"This method was automatically generated"
	^ SDL_SANDBOX_FLATPAK
]

{ #category : 'accessing enum' }
SDL3Sandbox class >> macos [
	"This method was automatically generated"
	^ SDL_SANDBOX_MACOS
]

{ #category : 'accessing enum' }
SDL3Sandbox class >> none [
	"This method was automatically generated"
	^ SDL_SANDBOX_NONE
]

{ #category : 'accessing enum' }
SDL3Sandbox class >> snap [
	"This method was automatically generated"
	^ SDL_SANDBOX_SNAP
]

{ #category : 'accessing enum' }
SDL3Sandbox class >> unknownContainer [
	"This method was automatically generated"
	^ SDL_SANDBOX_UNKNOWN_CONTAINER
]
