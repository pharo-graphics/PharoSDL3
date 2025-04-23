Class {
	#name : 'SDL3PenAxis',
	#superclass : 'SDL3Enumeration',
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
SDL3PenAxis class >> count [
	"This method was automatically generated"
	^ SDL_PEN_AXIS_COUNT
]

{ #category : 'accessing enum' }
SDL3PenAxis class >> distance [
	"This method was automatically generated"
	^ SDL_PEN_AXIS_DISTANCE
]

{ #category : 'enum declaration' }
SDL3PenAxis class >> enumDecl [

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

{ #category : 'accessing enum' }
SDL3PenAxis class >> pressure [
	"This method was automatically generated"
	^ SDL_PEN_AXIS_PRESSURE
]

{ #category : 'accessing enum' }
SDL3PenAxis class >> rotation [
	"This method was automatically generated"
	^ SDL_PEN_AXIS_ROTATION
]

{ #category : 'accessing enum' }
SDL3PenAxis class >> slider [
	"This method was automatically generated"
	^ SDL_PEN_AXIS_SLIDER
]

{ #category : 'accessing enum' }
SDL3PenAxis class >> tangentialPressure [
	"This method was automatically generated"
	^ SDL_PEN_AXIS_TANGENTIAL_PRESSURE
]

{ #category : 'accessing enum' }
SDL3PenAxis class >> xtilt [
	"This method was automatically generated"
	^ SDL_PEN_AXIS_XTILT
]

{ #category : 'accessing enum' }
SDL3PenAxis class >> ytilt [
	"This method was automatically generated"
	^ SDL_PEN_AXIS_YTILT
]
