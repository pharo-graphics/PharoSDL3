Class {
	#name : 'S3SDL_PenAxis',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_PEN_AXIS_COUNT',
		'SDL_PEN_AXIS_DISTANCE',
		'SDL_PEN_AXIS_PRESSURE',
		'SDL_PEN_AXIS_ROTATION',
		'SDL_PEN_AXIS_SLIDER',
		'SDL_PEN_AXIS_TANGENTIAL_PRESSURE',
		'SDL_PEN_AXIS_XTILT',
		'SDL_PEN_AXIS_YTILT'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
S3SDL_PenAxis class >> SDL_PEN_AXIS_COUNT [
	"This method was automatically generated"
	^ SDL_PEN_AXIS_COUNT
]

{ #category : 'accessing enum' }
S3SDL_PenAxis class >> SDL_PEN_AXIS_DISTANCE [
	"This method was automatically generated"
	^ SDL_PEN_AXIS_DISTANCE
]

{ #category : 'accessing enum' }
S3SDL_PenAxis class >> SDL_PEN_AXIS_PRESSURE [
	"This method was automatically generated"
	^ SDL_PEN_AXIS_PRESSURE
]

{ #category : 'accessing enum' }
S3SDL_PenAxis class >> SDL_PEN_AXIS_ROTATION [
	"This method was automatically generated"
	^ SDL_PEN_AXIS_ROTATION
]

{ #category : 'accessing enum' }
S3SDL_PenAxis class >> SDL_PEN_AXIS_SLIDER [
	"This method was automatically generated"
	^ SDL_PEN_AXIS_SLIDER
]

{ #category : 'accessing enum' }
S3SDL_PenAxis class >> SDL_PEN_AXIS_TANGENTIAL_PRESSURE [
	"This method was automatically generated"
	^ SDL_PEN_AXIS_TANGENTIAL_PRESSURE
]

{ #category : 'accessing enum' }
S3SDL_PenAxis class >> SDL_PEN_AXIS_XTILT [
	"This method was automatically generated"
	^ SDL_PEN_AXIS_XTILT
]

{ #category : 'accessing enum' }
S3SDL_PenAxis class >> SDL_PEN_AXIS_YTILT [
	"This method was automatically generated"
	^ SDL_PEN_AXIS_YTILT
]

{ #category : 'enum declaration' }
S3SDL_PenAxis class >> enumDecl [

	^ #(
	SDL_PEN_AXIS_PRESSURE 0
	SDL_PEN_AXIS_XTILT 1
	SDL_PEN_AXIS_YTILT 2
	SDL_PEN_AXIS_DISTANCE 3
	SDL_PEN_AXIS_ROTATION 4
	SDL_PEN_AXIS_SLIDER 5
	SDL_PEN_AXIS_TANGENTIAL_PRESSURE 6
	SDL_PEN_AXIS_COUNT 7 )
]
