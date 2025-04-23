Class {
	#name : 'SDL3ColorPrimaries',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_COLOR_PRIMARIES_BT2020',
		'SDL_COLOR_PRIMARIES_BT470BG',
		'SDL_COLOR_PRIMARIES_BT470M',
		'SDL_COLOR_PRIMARIES_BT601',
		'SDL_COLOR_PRIMARIES_BT709',
		'SDL_COLOR_PRIMARIES_CUSTOM',
		'SDL_COLOR_PRIMARIES_EBU3213',
		'SDL_COLOR_PRIMARIES_GENERIC_FILM',
		'SDL_COLOR_PRIMARIES_SMPTE240',
		'SDL_COLOR_PRIMARIES_SMPTE431',
		'SDL_COLOR_PRIMARIES_SMPTE432',
		'SDL_COLOR_PRIMARIES_UNKNOWN',
		'SDL_COLOR_PRIMARIES_UNSPECIFIED',
		'SDL_COLOR_PRIMARIES_XYZ'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
SDL3ColorPrimaries class >> bt2020 [
	"This method was automatically generated"
	^ SDL_COLOR_PRIMARIES_BT2020
]

{ #category : 'accessing enum' }
SDL3ColorPrimaries class >> bt470bg [
	"This method was automatically generated"
	^ SDL_COLOR_PRIMARIES_BT470BG
]

{ #category : 'accessing enum' }
SDL3ColorPrimaries class >> bt470m [
	"This method was automatically generated"
	^ SDL_COLOR_PRIMARIES_BT470M
]

{ #category : 'accessing enum' }
SDL3ColorPrimaries class >> bt601 [
	"This method was automatically generated"
	^ SDL_COLOR_PRIMARIES_BT601
]

{ #category : 'accessing enum' }
SDL3ColorPrimaries class >> bt709 [
	"This method was automatically generated"
	^ SDL_COLOR_PRIMARIES_BT709
]

{ #category : 'accessing enum' }
SDL3ColorPrimaries class >> custom [
	"This method was automatically generated"
	^ SDL_COLOR_PRIMARIES_CUSTOM
]

{ #category : 'accessing enum' }
SDL3ColorPrimaries class >> ebu3213 [
	"This method was automatically generated"
	^ SDL_COLOR_PRIMARIES_EBU3213
]

{ #category : 'enum declaration' }
SDL3ColorPrimaries class >> enumDecl [

	^ #(
	SDL_COLOR_PRIMARIES_UNKNOWN 0
	SDL_COLOR_PRIMARIES_BT709 1
	SDL_COLOR_PRIMARIES_UNSPECIFIED 2
	SDL_COLOR_PRIMARIES_BT470M 4
	SDL_COLOR_PRIMARIES_BT470BG 5
	SDL_COLOR_PRIMARIES_BT601 6
	SDL_COLOR_PRIMARIES_SMPTE240 7
	SDL_COLOR_PRIMARIES_GENERIC_FILM 8
	SDL_COLOR_PRIMARIES_BT2020 9
	SDL_COLOR_PRIMARIES_XYZ 10
	SDL_COLOR_PRIMARIES_SMPTE431 11
	SDL_COLOR_PRIMARIES_SMPTE432 12
	SDL_COLOR_PRIMARIES_EBU3213 22
	SDL_COLOR_PRIMARIES_CUSTOM 31 )
]

{ #category : 'accessing enum' }
SDL3ColorPrimaries class >> genericFilm [
	"This method was automatically generated"
	^ SDL_COLOR_PRIMARIES_GENERIC_FILM
]

{ #category : 'accessing enum' }
SDL3ColorPrimaries class >> smpte240 [
	"This method was automatically generated"
	^ SDL_COLOR_PRIMARIES_SMPTE240
]

{ #category : 'accessing enum' }
SDL3ColorPrimaries class >> smpte431 [
	"This method was automatically generated"
	^ SDL_COLOR_PRIMARIES_SMPTE431
]

{ #category : 'accessing enum' }
SDL3ColorPrimaries class >> smpte432 [
	"This method was automatically generated"
	^ SDL_COLOR_PRIMARIES_SMPTE432
]

{ #category : 'accessing enum' }
SDL3ColorPrimaries class >> unknown [
	"This method was automatically generated"
	^ SDL_COLOR_PRIMARIES_UNKNOWN
]

{ #category : 'accessing enum' }
SDL3ColorPrimaries class >> unspecified [
	"This method was automatically generated"
	^ SDL_COLOR_PRIMARIES_UNSPECIFIED
]

{ #category : 'accessing enum' }
SDL3ColorPrimaries class >> xyz [
	"This method was automatically generated"
	^ SDL_COLOR_PRIMARIES_XYZ
]
