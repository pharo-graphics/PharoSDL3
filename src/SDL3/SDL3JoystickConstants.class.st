Class {
	#name : 'SDL3JoystickConstants',
	#superclass : 'SharedPool',
	#classVars : [
		'SDL_HAT_CENTERED',
		'SDL_HAT_DOWN',
		'SDL_HAT_LEFT',
		'SDL_HAT_RIGHT',
		'SDL_HAT_UP',
		'SDL_JOYSTICK_AXIS_MAX'
	],
	#category : 'SDL3-Constants',
	#package : 'SDL3',
	#tag : 'Constants'
}

{ #category : 'class initialization' }
SDL3JoystickConstants class >> initialize [

	SDL_JOYSTICK_AXIS_MAX := 16r7FFF.
	SDL_HAT_CENTERED := 16r00.
	SDL_HAT_UP := 16r01.
	SDL_HAT_RIGHT := 16r02.
	SDL_HAT_DOWN := 16r04.
	SDL_HAT_LEFT := 16r08
]
