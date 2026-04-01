Class {
	#name : 'SDL3GamepadBindingType',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_GAMEPAD_BINDTYPE_AXIS',
		'SDL_GAMEPAD_BINDTYPE_BUTTON',
		'SDL_GAMEPAD_BINDTYPE_HAT',
		'SDL_GAMEPAD_BINDTYPE_NONE'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
SDL3GamepadBindingType class >> axis [
	"This method was automatically generated"
	^ SDL_GAMEPAD_BINDTYPE_AXIS
]

{ #category : 'accessing enum' }
SDL3GamepadBindingType class >> button [
	"This method was automatically generated"
	^ SDL_GAMEPAD_BINDTYPE_BUTTON
]

{ #category : 'enum declaration' }
SDL3GamepadBindingType class >> enumDecl [

	^ #(
	SDL_GAMEPAD_BINDTYPE_NONE 0
	SDL_GAMEPAD_BINDTYPE_BUTTON 1
	SDL_GAMEPAD_BINDTYPE_AXIS 2
	SDL_GAMEPAD_BINDTYPE_HAT 3 )
]

{ #category : 'accessing enum' }
SDL3GamepadBindingType class >> hat [
	"This method was automatically generated"
	^ SDL_GAMEPAD_BINDTYPE_HAT
]

{ #category : 'accessing enum' }
SDL3GamepadBindingType class >> none [
	"This method was automatically generated"
	^ SDL_GAMEPAD_BINDTYPE_NONE
]
