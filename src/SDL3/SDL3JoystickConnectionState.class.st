Class {
	#name : 'SDL3JoystickConnectionState',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_JOYSTICK_CONNECTION_INVALID',
		'SDL_JOYSTICK_CONNECTION_UNKNOWN',
		'SDL_JOYSTICK_CONNECTION_WIRED',
		'SDL_JOYSTICK_CONNECTION_WIRELESS'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'enum declaration' }
SDL3JoystickConnectionState class >> enumDecl [

	^ #(
	SDL_JOYSTICK_CONNECTION_INVALID -1
	SDL_JOYSTICK_CONNECTION_UNKNOWN 0
	SDL_JOYSTICK_CONNECTION_WIRED 1
	SDL_JOYSTICK_CONNECTION_WIRELESS 2 )
]

{ #category : 'accessing enum' }
SDL3JoystickConnectionState class >> invalid [
	"This method was automatically generated"
	^ SDL_JOYSTICK_CONNECTION_INVALID
]

{ #category : 'accessing enum' }
SDL3JoystickConnectionState class >> unknown [
	"This method was automatically generated"
	^ SDL_JOYSTICK_CONNECTION_UNKNOWN
]

{ #category : 'accessing enum' }
SDL3JoystickConnectionState class >> wired [
	"This method was automatically generated"
	^ SDL_JOYSTICK_CONNECTION_WIRED
]

{ #category : 'accessing enum' }
SDL3JoystickConnectionState class >> wireless [
	"This method was automatically generated"
	^ SDL_JOYSTICK_CONNECTION_WIRELESS
]
