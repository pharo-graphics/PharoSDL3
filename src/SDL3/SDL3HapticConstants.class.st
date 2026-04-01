Class {
	#name : 'SDL3HapticConstants',
	#superclass : 'SharedPool',
	#classVars : [
		'SDL_HAPTIC_CARTESIAN',
		'SDL_HAPTIC_INFINITY',
		'SDL_HAPTIC_POLAR',
		'SDL_HAPTIC_SPHERICAL',
		'SDL_HAPTIC_STEERING_AXIS'
	],
	#category : 'SDL3-Library',
	#package : 'SDL3',
	#tag : 'Library'
}

{ #category : 'class initialization' }
SDL3HapticConstants class >> initialize [

	SDL_HAPTIC_INFINITY := 16rFFFFFFFF.
	SDL_HAPTIC_POLAR := 0.
	SDL_HAPTIC_CARTESIAN := 1.
	SDL_HAPTIC_SPHERICAL := 2.
	SDL_HAPTIC_STEERING_AXIS := 3
]
