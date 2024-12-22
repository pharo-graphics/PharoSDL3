Class {
	#name : 'S3SDL_IOStatus',
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

{ #category : 'accessing enum' }
S3SDL_IOStatus class >> SDL_IO_STATUS_EOF [
	"This method was automatically generated"
	^ SDL_IO_STATUS_EOF
]

{ #category : 'accessing enum' }
S3SDL_IOStatus class >> SDL_IO_STATUS_ERROR [
	"This method was automatically generated"
	^ SDL_IO_STATUS_ERROR
]

{ #category : 'accessing enum' }
S3SDL_IOStatus class >> SDL_IO_STATUS_NOT_READY [
	"This method was automatically generated"
	^ SDL_IO_STATUS_NOT_READY
]

{ #category : 'accessing enum' }
S3SDL_IOStatus class >> SDL_IO_STATUS_READONLY [
	"This method was automatically generated"
	^ SDL_IO_STATUS_READONLY
]

{ #category : 'accessing enum' }
S3SDL_IOStatus class >> SDL_IO_STATUS_READY [
	"This method was automatically generated"
	^ SDL_IO_STATUS_READY
]

{ #category : 'accessing enum' }
S3SDL_IOStatus class >> SDL_IO_STATUS_WRITEONLY [
	"This method was automatically generated"
	^ SDL_IO_STATUS_WRITEONLY
]

{ #category : 'enum declaration' }
S3SDL_IOStatus class >> enumDecl [

	^ #(
	SDL_IO_STATUS_READY 0
	SDL_IO_STATUS_ERROR 1
	SDL_IO_STATUS_EOF 2
	SDL_IO_STATUS_NOT_READY 3
	SDL_IO_STATUS_READONLY 4
	SDL_IO_STATUS_WRITEONLY 5 )
]
