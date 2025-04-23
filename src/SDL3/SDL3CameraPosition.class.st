Class {
	#name : 'SDL3CameraPosition',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_CAMERA_POSITION_BACK_FACING',
		'SDL_CAMERA_POSITION_FRONT_FACING',
		'SDL_CAMERA_POSITION_UNKNOWN'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
SDL3CameraPosition class >> backFacing [
	"This method was automatically generated"
	^ SDL_CAMERA_POSITION_BACK_FACING
]

{ #category : 'enum declaration' }
SDL3CameraPosition class >> enumDecl [

	^ #(
	SDL_CAMERA_POSITION_UNKNOWN 0
	SDL_CAMERA_POSITION_FRONT_FACING 1
	SDL_CAMERA_POSITION_BACK_FACING 2 )
]

{ #category : 'accessing enum' }
SDL3CameraPosition class >> frontFacing [
	"This method was automatically generated"
	^ SDL_CAMERA_POSITION_FRONT_FACING
]

{ #category : 'accessing enum' }
SDL3CameraPosition class >> unknown [
	"This method was automatically generated"
	^ SDL_CAMERA_POSITION_UNKNOWN
]
