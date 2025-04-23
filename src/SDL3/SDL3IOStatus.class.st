Class {
	#name : 'SDL3IOStatus',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_IO_STATUS_EOF',
		'SDL_IO_STATUS_ERROR',
		'SDL_IO_STATUS_NOT_READY',
		'SDL_IO_STATUS_READONLY',
		'SDL_IO_STATUS_READY',
		'SDL_IO_STATUS_WRITEONLY'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'enum declaration' }
SDL3IOStatus class >> enumDecl [

	^ #(
	SDL_IO_STATUS_READY 0
	SDL_IO_STATUS_ERROR 1
	SDL_IO_STATUS_EOF 2
	SDL_IO_STATUS_NOT_READY 3
	SDL_IO_STATUS_READONLY 4
	SDL_IO_STATUS_WRITEONLY 5 )
]

{ #category : 'accessing enum' }
SDL3IOStatus class >> eof [
	"This method was automatically generated"
	^ SDL_IO_STATUS_EOF
]

{ #category : 'accessing enum' }
SDL3IOStatus class >> error [
	"This method was automatically generated"
	^ SDL_IO_STATUS_ERROR
]

{ #category : 'accessing enum' }
SDL3IOStatus class >> notReady [
	"This method was automatically generated"
	^ SDL_IO_STATUS_NOT_READY
]

{ #category : 'accessing enum' }
SDL3IOStatus class >> readonly [
	"This method was automatically generated"
	^ SDL_IO_STATUS_READONLY
]

{ #category : 'accessing enum' }
SDL3IOStatus class >> ready [
	"This method was automatically generated"
	^ SDL_IO_STATUS_READY
]

{ #category : 'accessing enum' }
SDL3IOStatus class >> writeonly [
	"This method was automatically generated"
	^ SDL_IO_STATUS_WRITEONLY
]
