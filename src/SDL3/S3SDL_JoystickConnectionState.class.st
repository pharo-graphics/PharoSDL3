Class {
	#name : 'S3SDL_JoystickConnectionState',
	#superclass : 'S3Enumeration',
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
S3SDL_JoystickConnectionState class >> enumDecl [

	^ #(
	SDL_JOYSTICK_CONNECTION_INVALID -1
	SDL_JOYSTICK_CONNECTION_UNKNOWN 0
	SDL_JOYSTICK_CONNECTION_WIRED 1
	SDL_JOYSTICK_CONNECTION_WIRELESS 2 )
]

{ #category : 'accessing enum' }
S3SDL_JoystickConnectionState class >> invalid [
	"This method was automatically generated"
	^ SDL_JOYSTICK_CONNECTION_INVALID
]

{ #category : 'accessing enum' }
S3SDL_JoystickConnectionState class >> unknown [
	"This method was automatically generated"
	^ SDL_JOYSTICK_CONNECTION_UNKNOWN
]

{ #category : 'accessing enum' }
S3SDL_JoystickConnectionState class >> wired [
	"This method was automatically generated"
	^ SDL_JOYSTICK_CONNECTION_WIRED
]

{ #category : 'accessing enum' }
S3SDL_JoystickConnectionState class >> wireless [
	"This method was automatically generated"
	^ SDL_JOYSTICK_CONNECTION_WIRELESS
]
