"
I am a SDL3 FFI binding for `SDL_FlashOperation`.

Window flash operation.

See: https://wiki.libsdl.org/SDL3/SDL_FlashOperation
"
Class {
	#name : 'SDL3FlashOperation',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_FLASH_BRIEFLY',
		'SDL_FLASH_CANCEL',
		'SDL_FLASH_UNTIL_FOCUSED'
	],
	#category : 'SDL3-Enumerations',
	#package : 'SDL3',
	#tag : 'Enumerations'
}

{ #category : 'accessing enum' }
SDL3FlashOperation class >> briefly [
	"This method was automatically generated"
	^ SDL_FLASH_BRIEFLY
]

{ #category : 'accessing enum' }
SDL3FlashOperation class >> cancel [
	"This method was automatically generated"
	^ SDL_FLASH_CANCEL
]

{ #category : 'enum declaration' }
SDL3FlashOperation class >> enumDecl [

	^ #(
	SDL_FLASH_CANCEL 0
	SDL_FLASH_BRIEFLY 1
	SDL_FLASH_UNTIL_FOCUSED 2 )
]

{ #category : 'accessing enum' }
SDL3FlashOperation class >> untilFocused [
	"This method was automatically generated"
	^ SDL_FLASH_UNTIL_FOCUSED
]
