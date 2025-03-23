Class {
	#name : 'S3SDL_JoystickType',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_JOYSTICK_TYPE_ARCADE_PAD',
		'SDL_JOYSTICK_TYPE_ARCADE_STICK',
		'SDL_JOYSTICK_TYPE_COUNT',
		'SDL_JOYSTICK_TYPE_DANCE_PAD',
		'SDL_JOYSTICK_TYPE_DRUM_KIT',
		'SDL_JOYSTICK_TYPE_FLIGHT_STICK',
		'SDL_JOYSTICK_TYPE_GAMEPAD',
		'SDL_JOYSTICK_TYPE_GUITAR',
		'SDL_JOYSTICK_TYPE_THROTTLE',
		'SDL_JOYSTICK_TYPE_UNKNOWN',
		'SDL_JOYSTICK_TYPE_WHEEL'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
S3SDL_JoystickType class >> SDL_JOYSTICK_TYPE_ARCADE_PAD [
	"This method was automatically generated"
	^ SDL_JOYSTICK_TYPE_ARCADE_PAD
]

{ #category : 'accessing enum' }
S3SDL_JoystickType class >> SDL_JOYSTICK_TYPE_ARCADE_STICK [
	"This method was automatically generated"
	^ SDL_JOYSTICK_TYPE_ARCADE_STICK
]

{ #category : 'accessing enum' }
S3SDL_JoystickType class >> SDL_JOYSTICK_TYPE_COUNT [
	"This method was automatically generated"
	^ SDL_JOYSTICK_TYPE_COUNT
]

{ #category : 'accessing enum' }
S3SDL_JoystickType class >> SDL_JOYSTICK_TYPE_DANCE_PAD [
	"This method was automatically generated"
	^ SDL_JOYSTICK_TYPE_DANCE_PAD
]

{ #category : 'accessing enum' }
S3SDL_JoystickType class >> SDL_JOYSTICK_TYPE_DRUM_KIT [
	"This method was automatically generated"
	^ SDL_JOYSTICK_TYPE_DRUM_KIT
]

{ #category : 'accessing enum' }
S3SDL_JoystickType class >> SDL_JOYSTICK_TYPE_FLIGHT_STICK [
	"This method was automatically generated"
	^ SDL_JOYSTICK_TYPE_FLIGHT_STICK
]

{ #category : 'accessing enum' }
S3SDL_JoystickType class >> SDL_JOYSTICK_TYPE_GAMEPAD [
	"This method was automatically generated"
	^ SDL_JOYSTICK_TYPE_GAMEPAD
]

{ #category : 'accessing enum' }
S3SDL_JoystickType class >> SDL_JOYSTICK_TYPE_GUITAR [
	"This method was automatically generated"
	^ SDL_JOYSTICK_TYPE_GUITAR
]

{ #category : 'accessing enum' }
S3SDL_JoystickType class >> SDL_JOYSTICK_TYPE_THROTTLE [
	"This method was automatically generated"
	^ SDL_JOYSTICK_TYPE_THROTTLE
]

{ #category : 'accessing enum' }
S3SDL_JoystickType class >> SDL_JOYSTICK_TYPE_UNKNOWN [
	"This method was automatically generated"
	^ SDL_JOYSTICK_TYPE_UNKNOWN
]

{ #category : 'accessing enum' }
S3SDL_JoystickType class >> SDL_JOYSTICK_TYPE_WHEEL [
	"This method was automatically generated"
	^ SDL_JOYSTICK_TYPE_WHEEL
]

{ #category : 'enum declaration' }
S3SDL_JoystickType class >> enumDecl [

	^ #(
	SDL_JOYSTICK_TYPE_UNKNOWN 0
	SDL_JOYSTICK_TYPE_GAMEPAD 1
	SDL_JOYSTICK_TYPE_WHEEL 2
	SDL_JOYSTICK_TYPE_ARCADE_STICK 3
	SDL_JOYSTICK_TYPE_FLIGHT_STICK 4
	SDL_JOYSTICK_TYPE_DANCE_PAD 5
	SDL_JOYSTICK_TYPE_GUITAR 6
	SDL_JOYSTICK_TYPE_DRUM_KIT 7
	SDL_JOYSTICK_TYPE_ARCADE_PAD 8
	SDL_JOYSTICK_TYPE_THROTTLE 9
	SDL_JOYSTICK_TYPE_COUNT 10 )
]
