Class {
	#name : 'SDL3VersionConstants',
	#superclass : 'SharedPool',
	#classVars : [
		'SDL_MAJOR_VERSION',
		'SDL_MICRO_VERSION',
		'SDL_MINOR_VERSION'
	],
	#category : 'SDL3-Library',
	#package : 'SDL3',
	#tag : 'Library'
}

{ #category : 'class initialization' }
SDL3VersionConstants class >> initialize [

	SDL_MAJOR_VERSION := 3.
	SDL_MINOR_VERSION := 4.
	SDL_MICRO_VERSION := 0
]
