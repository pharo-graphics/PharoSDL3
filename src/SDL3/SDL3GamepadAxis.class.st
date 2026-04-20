Class {
	#name : 'SDL3GamepadAxis',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_GAMEPAD_AXIS_COUNT',
		'SDL_GAMEPAD_AXIS_INVALID',
		'SDL_GAMEPAD_AXIS_LEFTX',
		'SDL_GAMEPAD_AXIS_LEFTY',
		'SDL_GAMEPAD_AXIS_LEFT_TRIGGER',
		'SDL_GAMEPAD_AXIS_RIGHTX',
		'SDL_GAMEPAD_AXIS_RIGHTY',
		'SDL_GAMEPAD_AXIS_RIGHT_TRIGGER'
	],
	#category : 'SDL3-Enumerations',
	#package : 'SDL3',
	#tag : 'Enumerations'
}

{ #category : 'accessing enum' }
SDL3GamepadAxis class >> count [
	"This method was automatically generated"
	^ SDL_GAMEPAD_AXIS_COUNT
]

{ #category : 'enum declaration' }
SDL3GamepadAxis class >> enumDecl [

	^ #(
	SDL_GAMEPAD_AXIS_INVALID -1
	SDL_GAMEPAD_AXIS_LEFTX 0
	SDL_GAMEPAD_AXIS_LEFTY 1
	SDL_GAMEPAD_AXIS_RIGHTX 2
	SDL_GAMEPAD_AXIS_RIGHTY 3
	SDL_GAMEPAD_AXIS_LEFT_TRIGGER 4
	SDL_GAMEPAD_AXIS_RIGHT_TRIGGER 5
	SDL_GAMEPAD_AXIS_COUNT 6 )
]

{ #category : 'accessing enum' }
SDL3GamepadAxis class >> invalid [
	"This method was automatically generated"
	^ SDL_GAMEPAD_AXIS_INVALID
]

{ #category : 'accessing enum' }
SDL3GamepadAxis class >> leftTrigger [
	"This method was automatically generated"
	^ SDL_GAMEPAD_AXIS_LEFT_TRIGGER
]

{ #category : 'accessing enum' }
SDL3GamepadAxis class >> leftx [
	"This method was automatically generated"
	^ SDL_GAMEPAD_AXIS_LEFTX
]

{ #category : 'accessing enum' }
SDL3GamepadAxis class >> lefty [
	"This method was automatically generated"
	^ SDL_GAMEPAD_AXIS_LEFTY
]

{ #category : 'accessing enum' }
SDL3GamepadAxis class >> rightTrigger [
	"This method was automatically generated"
	^ SDL_GAMEPAD_AXIS_RIGHT_TRIGGER
]

{ #category : 'accessing enum' }
SDL3GamepadAxis class >> rightx [
	"This method was automatically generated"
	^ SDL_GAMEPAD_AXIS_RIGHTX
]

{ #category : 'accessing enum' }
SDL3GamepadAxis class >> righty [
	"This method was automatically generated"
	^ SDL_GAMEPAD_AXIS_RIGHTY
]
