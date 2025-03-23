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

{ #category : 'accessing enum' }
S3SDL_JoystickConnectionState class >> SDL_JOYSTICK_CONNECTION_INVALID [
	"This method was automatically generated"
	^ SDL_JOYSTICK_CONNECTION_INVALID
]

{ #category : 'accessing enum' }
S3SDL_JoystickConnectionState class >> SDL_JOYSTICK_CONNECTION_UNKNOWN [
	"This method was automatically generated"
	^ SDL_JOYSTICK_CONNECTION_UNKNOWN
]

{ #category : 'accessing enum' }
S3SDL_JoystickConnectionState class >> SDL_JOYSTICK_CONNECTION_WIRED [
	"This method was automatically generated"
	^ SDL_JOYSTICK_CONNECTION_WIRED
]

{ #category : 'accessing enum' }
S3SDL_JoystickConnectionState class >> SDL_JOYSTICK_CONNECTION_WIRELESS [
	"This method was automatically generated"
	^ SDL_JOYSTICK_CONNECTION_WIRELESS
]

{ #category : 'enum declaration' }
S3SDL_JoystickConnectionState class >> enumDecl [

	^ #(
	SDL_JOYSTICK_CONNECTION_INVALID -1
	SDL_JOYSTICK_CONNECTION_UNKNOWN 0
	SDL_JOYSTICK_CONNECTION_WIRED 1
	SDL_JOYSTICK_CONNECTION_WIRELESS 2 )
]
