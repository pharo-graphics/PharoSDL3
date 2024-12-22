Class {
	#name : 'S3SDL_IOWhence',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_IO_SEEK_CUR',
		'SDL_IO_SEEK_END',
		'SDL_IO_SEEK_SET'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
S3SDL_IOWhence class >> SDL_IO_SEEK_CUR [
	"This method was automatically generated"
	^ SDL_IO_SEEK_CUR
]

{ #category : 'accessing enum' }
S3SDL_IOWhence class >> SDL_IO_SEEK_END [
	"This method was automatically generated"
	^ SDL_IO_SEEK_END
]

{ #category : 'accessing enum' }
S3SDL_IOWhence class >> SDL_IO_SEEK_SET [
	"This method was automatically generated"
	^ SDL_IO_SEEK_SET
]

{ #category : 'enum declaration' }
S3SDL_IOWhence class >> enumDecl [

	^ #(
	SDL_IO_SEEK_SET 0
	SDL_IO_SEEK_CUR 1
	SDL_IO_SEEK_END 2 )
]
