"
I am a SDL3 FFI binding for `SDL_ColorRange`.

Colorspace color range, as described by https://www.itu.int/rec/R-REC-BT.2100-2-201807-I/en

See: https://wiki.libsdl.org/SDL3/SDL_ColorRange
"
Class {
	#name : 'SDL3ColorRange',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_COLOR_RANGE_FULL',
		'SDL_COLOR_RANGE_LIMITED',
		'SDL_COLOR_RANGE_UNKNOWN'
	],
	#category : 'SDL3-Enumerations',
	#package : 'SDL3',
	#tag : 'Enumerations'
}

{ #category : 'enum declaration' }
SDL3ColorRange class >> enumDecl [

	^ #(
	SDL_COLOR_RANGE_UNKNOWN 0
	SDL_COLOR_RANGE_LIMITED 1
	SDL_COLOR_RANGE_FULL 2 )
]

{ #category : 'accessing enum' }
SDL3ColorRange class >> full [
	"This method was automatically generated"
	^ SDL_COLOR_RANGE_FULL
]

{ #category : 'accessing enum' }
SDL3ColorRange class >> limited [
	"This method was automatically generated"
	^ SDL_COLOR_RANGE_LIMITED
]

{ #category : 'accessing enum' }
SDL3ColorRange class >> unknown [
	"This method was automatically generated"
	^ SDL_COLOR_RANGE_UNKNOWN
]
