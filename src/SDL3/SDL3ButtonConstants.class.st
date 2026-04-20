Class {
	#name : 'SDL3ButtonConstants',
	#superclass : 'SharedPool',
	#classVars : [
		'SDL_BUTTON_LEFT',
		'SDL_BUTTON_MIDDLE',
		'SDL_BUTTON_RIGHT',
		'SDL_BUTTON_X1',
		'SDL_BUTTON_X2'
	],
	#category : 'SDL3-Constants',
	#package : 'SDL3',
	#tag : 'Constants'
}

{ #category : 'class initialization' }
SDL3ButtonConstants class >> initialize [

	SDL_BUTTON_LEFT := 1.
	SDL_BUTTON_MIDDLE := 2.
	SDL_BUTTON_RIGHT := 3.
	SDL_BUTTON_X1 := 4.
	SDL_BUTTON_X2 := 5
]
