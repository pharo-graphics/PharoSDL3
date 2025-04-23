Class {
	#name : 'SDL3PixelType',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_PIXELTYPE_ARRAYF16',
		'SDL_PIXELTYPE_ARRAYF32',
		'SDL_PIXELTYPE_ARRAYU16',
		'SDL_PIXELTYPE_ARRAYU32',
		'SDL_PIXELTYPE_ARRAYU8',
		'SDL_PIXELTYPE_INDEX1',
		'SDL_PIXELTYPE_INDEX2',
		'SDL_PIXELTYPE_INDEX4',
		'SDL_PIXELTYPE_INDEX8',
		'SDL_PIXELTYPE_PACKED16',
		'SDL_PIXELTYPE_PACKED32',
		'SDL_PIXELTYPE_PACKED8',
		'SDL_PIXELTYPE_UNKNOWN'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
SDL3PixelType class >> arrayf16 [
	"This method was automatically generated"
	^ SDL_PIXELTYPE_ARRAYF16
]

{ #category : 'accessing enum' }
SDL3PixelType class >> arrayf32 [
	"This method was automatically generated"
	^ SDL_PIXELTYPE_ARRAYF32
]

{ #category : 'accessing enum' }
SDL3PixelType class >> arrayu16 [
	"This method was automatically generated"
	^ SDL_PIXELTYPE_ARRAYU16
]

{ #category : 'accessing enum' }
SDL3PixelType class >> arrayu32 [
	"This method was automatically generated"
	^ SDL_PIXELTYPE_ARRAYU32
]

{ #category : 'accessing enum' }
SDL3PixelType class >> arrayu8 [
	"This method was automatically generated"
	^ SDL_PIXELTYPE_ARRAYU8
]

{ #category : 'enum declaration' }
SDL3PixelType class >> enumDecl [

	^ #(
	SDL_PIXELTYPE_UNKNOWN 0
	SDL_PIXELTYPE_INDEX1 1
	SDL_PIXELTYPE_INDEX4 2
	SDL_PIXELTYPE_INDEX8 3
	SDL_PIXELTYPE_PACKED8 4
	SDL_PIXELTYPE_PACKED16 5
	SDL_PIXELTYPE_PACKED32 6
	SDL_PIXELTYPE_ARRAYU8 7
	SDL_PIXELTYPE_ARRAYU16 8
	SDL_PIXELTYPE_ARRAYU32 9
	SDL_PIXELTYPE_ARRAYF16 10
	SDL_PIXELTYPE_ARRAYF32 11
	SDL_PIXELTYPE_INDEX2 12 )
]

{ #category : 'accessing enum' }
SDL3PixelType class >> index1 [
	"This method was automatically generated"
	^ SDL_PIXELTYPE_INDEX1
]

{ #category : 'accessing enum' }
SDL3PixelType class >> index2 [
	"This method was automatically generated"
	^ SDL_PIXELTYPE_INDEX2
]

{ #category : 'accessing enum' }
SDL3PixelType class >> index4 [
	"This method was automatically generated"
	^ SDL_PIXELTYPE_INDEX4
]

{ #category : 'accessing enum' }
SDL3PixelType class >> index8 [
	"This method was automatically generated"
	^ SDL_PIXELTYPE_INDEX8
]

{ #category : 'accessing enum' }
SDL3PixelType class >> packed16 [
	"This method was automatically generated"
	^ SDL_PIXELTYPE_PACKED16
]

{ #category : 'accessing enum' }
SDL3PixelType class >> packed32 [
	"This method was automatically generated"
	^ SDL_PIXELTYPE_PACKED32
]

{ #category : 'accessing enum' }
SDL3PixelType class >> packed8 [
	"This method was automatically generated"
	^ SDL_PIXELTYPE_PACKED8
]

{ #category : 'accessing enum' }
SDL3PixelType class >> unknown [
	"This method was automatically generated"
	^ SDL_PIXELTYPE_UNKNOWN
]
