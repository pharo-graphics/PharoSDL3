Class {
	#name : 'S3SDL_BitmapOrder',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_BITMAPORDER_1234',
		'SDL_BITMAPORDER_4321',
		'SDL_BITMAPORDER_NONE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
S3SDL_BitmapOrder class >> SDL_BITMAPORDER_1234 [
	"This method was automatically generated"
	^ SDL_BITMAPORDER_1234
]

{ #category : 'accessing enum' }
S3SDL_BitmapOrder class >> SDL_BITMAPORDER_4321 [
	"This method was automatically generated"
	^ SDL_BITMAPORDER_4321
]

{ #category : 'accessing enum' }
S3SDL_BitmapOrder class >> SDL_BITMAPORDER_NONE [
	"This method was automatically generated"
	^ SDL_BITMAPORDER_NONE
]

{ #category : 'enum declaration' }
S3SDL_BitmapOrder class >> enumDecl [

	^ #(
	SDL_BITMAPORDER_NONE 0
	SDL_BITMAPORDER_4321 1
	SDL_BITMAPORDER_1234 2 )
]
