Class {
	#name : 'S3SDL_AsyncIOResult',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_ASYNCIO_CANCELED',
		'SDL_ASYNCIO_COMPLETE',
		'SDL_ASYNCIO_FAILURE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
S3SDL_AsyncIOResult class >> SDL_ASYNCIO_CANCELED [
	"This method was automatically generated"
	^ SDL_ASYNCIO_CANCELED
]

{ #category : 'accessing enum' }
S3SDL_AsyncIOResult class >> SDL_ASYNCIO_COMPLETE [
	"This method was automatically generated"
	^ SDL_ASYNCIO_COMPLETE
]

{ #category : 'accessing enum' }
S3SDL_AsyncIOResult class >> SDL_ASYNCIO_FAILURE [
	"This method was automatically generated"
	^ SDL_ASYNCIO_FAILURE
]

{ #category : 'enum declaration' }
S3SDL_AsyncIOResult class >> enumDecl [

	^ #(
	SDL_ASYNCIO_COMPLETE 0
	SDL_ASYNCIO_FAILURE 1
	SDL_ASYNCIO_CANCELED 2 )
]
