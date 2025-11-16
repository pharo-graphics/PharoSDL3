Class {
	#name : 'SDL3PenDeviceType',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_PEN_DEVICE_TYPE_DIRECT',
		'SDL_PEN_DEVICE_TYPE_INDIRECT',
		'SDL_PEN_DEVICE_TYPE_INVALID',
		'SDL_PEN_DEVICE_TYPE_UNKNOWN'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
SDL3PenDeviceType class >> direct [
	"This method was automatically generated"
	^ SDL_PEN_DEVICE_TYPE_DIRECT
]

{ #category : 'enum declaration' }
SDL3PenDeviceType class >> enumDecl [

	^ #(
	SDL_PEN_DEVICE_TYPE_INVALID -1
	SDL_PEN_DEVICE_TYPE_UNKNOWN 0
	SDL_PEN_DEVICE_TYPE_DIRECT 1
	SDL_PEN_DEVICE_TYPE_INDIRECT 2 )
]

{ #category : 'accessing enum' }
SDL3PenDeviceType class >> indirect [
	"This method was automatically generated"
	^ SDL_PEN_DEVICE_TYPE_INDIRECT
]

{ #category : 'accessing enum' }
SDL3PenDeviceType class >> invalid [
	"This method was automatically generated"
	^ SDL_PEN_DEVICE_TYPE_INVALID
]

{ #category : 'accessing enum' }
SDL3PenDeviceType class >> unknown [
	"This method was automatically generated"
	^ SDL_PEN_DEVICE_TYPE_UNKNOWN
]
