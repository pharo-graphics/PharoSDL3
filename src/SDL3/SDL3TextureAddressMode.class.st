Class {
	#name : 'SDL3TextureAddressMode',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_TEXTURE_ADDRESS_AUTO',
		'SDL_TEXTURE_ADDRESS_CLAMP',
		'SDL_TEXTURE_ADDRESS_INVALID',
		'SDL_TEXTURE_ADDRESS_WRAP'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
SDL3TextureAddressMode class >> auto [
	"This method was automatically generated"
	^ SDL_TEXTURE_ADDRESS_AUTO
]

{ #category : 'accessing enum' }
SDL3TextureAddressMode class >> clamp [
	"This method was automatically generated"
	^ SDL_TEXTURE_ADDRESS_CLAMP
]

{ #category : 'enum declaration' }
SDL3TextureAddressMode class >> enumDecl [

	^ #(
	SDL_TEXTURE_ADDRESS_INVALID -1
	SDL_TEXTURE_ADDRESS_AUTO 0
	SDL_TEXTURE_ADDRESS_CLAMP 1
	SDL_TEXTURE_ADDRESS_WRAP 2 )
]

{ #category : 'accessing enum' }
SDL3TextureAddressMode class >> invalid [
	"This method was automatically generated"
	^ SDL_TEXTURE_ADDRESS_INVALID
]

{ #category : 'accessing enum' }
SDL3TextureAddressMode class >> wrap [
	"This method was automatically generated"
	^ SDL_TEXTURE_ADDRESS_WRAP
]
