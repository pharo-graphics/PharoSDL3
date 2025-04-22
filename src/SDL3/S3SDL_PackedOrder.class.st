Class {
	#name : 'S3SDL_PackedOrder',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_PACKEDORDER_ABGR',
		'SDL_PACKEDORDER_ARGB',
		'SDL_PACKEDORDER_BGRA',
		'SDL_PACKEDORDER_BGRX',
		'SDL_PACKEDORDER_NONE',
		'SDL_PACKEDORDER_RGBA',
		'SDL_PACKEDORDER_RGBX',
		'SDL_PACKEDORDER_XBGR',
		'SDL_PACKEDORDER_XRGB'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
S3SDL_PackedOrder class >> abgr [
	"This method was automatically generated"
	^ SDL_PACKEDORDER_ABGR
]

{ #category : 'accessing enum' }
S3SDL_PackedOrder class >> argb [
	"This method was automatically generated"
	^ SDL_PACKEDORDER_ARGB
]

{ #category : 'accessing enum' }
S3SDL_PackedOrder class >> bgra [
	"This method was automatically generated"
	^ SDL_PACKEDORDER_BGRA
]

{ #category : 'accessing enum' }
S3SDL_PackedOrder class >> bgrx [
	"This method was automatically generated"
	^ SDL_PACKEDORDER_BGRX
]

{ #category : 'enum declaration' }
S3SDL_PackedOrder class >> enumDecl [

	^ #(
	SDL_PACKEDORDER_NONE 0
	SDL_PACKEDORDER_XRGB 1
	SDL_PACKEDORDER_RGBX 2
	SDL_PACKEDORDER_ARGB 3
	SDL_PACKEDORDER_RGBA 4
	SDL_PACKEDORDER_XBGR 5
	SDL_PACKEDORDER_BGRX 6
	SDL_PACKEDORDER_ABGR 7
	SDL_PACKEDORDER_BGRA 8 )
]

{ #category : 'accessing enum' }
S3SDL_PackedOrder class >> none [
	"This method was automatically generated"
	^ SDL_PACKEDORDER_NONE
]

{ #category : 'accessing enum' }
S3SDL_PackedOrder class >> rgba [
	"This method was automatically generated"
	^ SDL_PACKEDORDER_RGBA
]

{ #category : 'accessing enum' }
S3SDL_PackedOrder class >> rgbx [
	"This method was automatically generated"
	^ SDL_PACKEDORDER_RGBX
]

{ #category : 'accessing enum' }
S3SDL_PackedOrder class >> xbgr [
	"This method was automatically generated"
	^ SDL_PACKEDORDER_XBGR
]

{ #category : 'accessing enum' }
S3SDL_PackedOrder class >> xrgb [
	"This method was automatically generated"
	^ SDL_PACKEDORDER_XRGB
]
