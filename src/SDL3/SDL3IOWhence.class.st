"
I am a SDL3 FFI binding for `SDL_IOWhence`.

Possible `whence` values for SDL_IOStream seeking.

See: https://wiki.libsdl.org/SDL3/SDL_IOWhence
"
Class {
	#name : 'SDL3IOWhence',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_IO_SEEK_CUR',
		'SDL_IO_SEEK_END',
		'SDL_IO_SEEK_SET'
	],
	#category : 'SDL3-Enumerations',
	#package : 'SDL3',
	#tag : 'Enumerations'
}

{ #category : 'accessing enum' }
SDL3IOWhence class >> cur [
	"This method was automatically generated"
	^ SDL_IO_SEEK_CUR
]

{ #category : 'accessing enum' }
SDL3IOWhence class >> end [
	"This method was automatically generated"
	^ SDL_IO_SEEK_END
]

{ #category : 'enum declaration' }
SDL3IOWhence class >> enumDecl [

	^ #(
	SDL_IO_SEEK_SET 0
	SDL_IO_SEEK_CUR 1
	SDL_IO_SEEK_END 2 )
]

{ #category : 'accessing enum' }
SDL3IOWhence class >> set [
	"This method was automatically generated"
	^ SDL_IO_SEEK_SET
]
