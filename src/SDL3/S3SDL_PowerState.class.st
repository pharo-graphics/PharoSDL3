Class {
	#name : 'S3SDL_PowerState',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_POWERSTATE_CHARGED',
		'SDL_POWERSTATE_CHARGING',
		'SDL_POWERSTATE_ERROR',
		'SDL_POWERSTATE_NO_BATTERY',
		'SDL_POWERSTATE_ON_BATTERY',
		'SDL_POWERSTATE_UNKNOWN'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
S3SDL_PowerState class >> charged [
	"This method was automatically generated"
	^ SDL_POWERSTATE_CHARGED
]

{ #category : 'accessing enum' }
S3SDL_PowerState class >> charging [
	"This method was automatically generated"
	^ SDL_POWERSTATE_CHARGING
]

{ #category : 'enum declaration' }
S3SDL_PowerState class >> enumDecl [

	^ #(
	SDL_POWERSTATE_ERROR -1
	SDL_POWERSTATE_UNKNOWN 0
	SDL_POWERSTATE_ON_BATTERY 1
	SDL_POWERSTATE_NO_BATTERY 2
	SDL_POWERSTATE_CHARGING 3
	SDL_POWERSTATE_CHARGED 4 )
]

{ #category : 'accessing enum' }
S3SDL_PowerState class >> error [
	"This method was automatically generated"
	^ SDL_POWERSTATE_ERROR
]

{ #category : 'accessing enum' }
S3SDL_PowerState class >> noBattery [
	"This method was automatically generated"
	^ SDL_POWERSTATE_NO_BATTERY
]

{ #category : 'accessing enum' }
S3SDL_PowerState class >> onBattery [
	"This method was automatically generated"
	^ SDL_POWERSTATE_ON_BATTERY
]

{ #category : 'accessing enum' }
S3SDL_PowerState class >> unknown [
	"This method was automatically generated"
	^ SDL_POWERSTATE_UNKNOWN
]
