Class {
	#name : 'S3SDL_FlashOperation',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_FLASH_BRIEFLY',
		'SDL_FLASH_CANCEL',
		'SDL_FLASH_UNTIL_FOCUSED'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
S3SDL_FlashOperation class >> briefly [
	"This method was automatically generated"
	^ SDL_FLASH_BRIEFLY
]

{ #category : 'accessing enum' }
S3SDL_FlashOperation class >> cancel [
	"This method was automatically generated"
	^ SDL_FLASH_CANCEL
]

{ #category : 'enum declaration' }
S3SDL_FlashOperation class >> enumDecl [

	^ #(
	SDL_FLASH_CANCEL 0
	SDL_FLASH_BRIEFLY 1
	SDL_FLASH_UNTIL_FOCUSED 2 )
]

{ #category : 'accessing enum' }
S3SDL_FlashOperation class >> untilFocused [
	"This method was automatically generated"
	^ SDL_FLASH_UNTIL_FOCUSED
]
