"
I am a SDL3 FFI binding for `SDL_GamepadButtonLabel`.

The set of gamepad button labels

See: https://wiki.libsdl.org/SDL3/SDL_GamepadButtonLabel
"
Class {
	#name : 'SDL3GamepadButtonLabel',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_GAMEPAD_BUTTON_LABEL_A',
		'SDL_GAMEPAD_BUTTON_LABEL_B',
		'SDL_GAMEPAD_BUTTON_LABEL_CIRCLE',
		'SDL_GAMEPAD_BUTTON_LABEL_CROSS',
		'SDL_GAMEPAD_BUTTON_LABEL_SQUARE',
		'SDL_GAMEPAD_BUTTON_LABEL_TRIANGLE',
		'SDL_GAMEPAD_BUTTON_LABEL_UNKNOWN',
		'SDL_GAMEPAD_BUTTON_LABEL_X',
		'SDL_GAMEPAD_BUTTON_LABEL_Y'
	],
	#category : 'SDL3-Enumerations',
	#package : 'SDL3',
	#tag : 'Enumerations'
}

{ #category : 'accessing enum' }
SDL3GamepadButtonLabel class >> a [
	"This method was automatically generated"
	^ SDL_GAMEPAD_BUTTON_LABEL_A
]

{ #category : 'accessing enum' }
SDL3GamepadButtonLabel class >> b [
	"This method was automatically generated"
	^ SDL_GAMEPAD_BUTTON_LABEL_B
]

{ #category : 'accessing enum' }
SDL3GamepadButtonLabel class >> circle [
	"This method was automatically generated"
	^ SDL_GAMEPAD_BUTTON_LABEL_CIRCLE
]

{ #category : 'accessing enum' }
SDL3GamepadButtonLabel class >> cross [
	"This method was automatically generated"
	^ SDL_GAMEPAD_BUTTON_LABEL_CROSS
]

{ #category : 'enum declaration' }
SDL3GamepadButtonLabel class >> enumDecl [

	^ #(
	SDL_GAMEPAD_BUTTON_LABEL_UNKNOWN 0
	SDL_GAMEPAD_BUTTON_LABEL_A 1
	SDL_GAMEPAD_BUTTON_LABEL_B 2
	SDL_GAMEPAD_BUTTON_LABEL_X 3
	SDL_GAMEPAD_BUTTON_LABEL_Y 4
	SDL_GAMEPAD_BUTTON_LABEL_CROSS 5
	SDL_GAMEPAD_BUTTON_LABEL_CIRCLE 6
	SDL_GAMEPAD_BUTTON_LABEL_SQUARE 7
	SDL_GAMEPAD_BUTTON_LABEL_TRIANGLE 8 )
]

{ #category : 'accessing enum' }
SDL3GamepadButtonLabel class >> square [
	"This method was automatically generated"
	^ SDL_GAMEPAD_BUTTON_LABEL_SQUARE
]

{ #category : 'accessing enum' }
SDL3GamepadButtonLabel class >> triangle [
	"This method was automatically generated"
	^ SDL_GAMEPAD_BUTTON_LABEL_TRIANGLE
]

{ #category : 'accessing enum' }
SDL3GamepadButtonLabel class >> unknown [
	"This method was automatically generated"
	^ SDL_GAMEPAD_BUTTON_LABEL_UNKNOWN
]

{ #category : 'accessing enum' }
SDL3GamepadButtonLabel class >> x [
	"This method was automatically generated"
	^ SDL_GAMEPAD_BUTTON_LABEL_X
]

{ #category : 'accessing enum' }
SDL3GamepadButtonLabel class >> y [
	"This method was automatically generated"
	^ SDL_GAMEPAD_BUTTON_LABEL_Y
]
