Class {
	#name : 'SDL3InitConstants',
	#superclass : 'SharedPool',
	#classVars : [
		'SDL_INIT_AUDIO',
		'SDL_INIT_CAMERA',
		'SDL_INIT_EVENTS',
		'SDL_INIT_GAMEPAD',
		'SDL_INIT_HAPTIC',
		'SDL_INIT_JOYSTICK',
		'SDL_INIT_SENSOR',
		'SDL_INIT_VIDEO'
	],
	#category : 'SDL3-Library',
	#package : 'SDL3',
	#tag : 'Library'
}

{ #category : 'accessing - constants' }
SDL3InitConstants class >> SDL_INIT_AUDIO [

	^ SDL_INIT_AUDIO
]

{ #category : 'accessing - constants' }
SDL3InitConstants class >> SDL_INIT_CAMERA [

	^ SDL_INIT_CAMERA
]

{ #category : 'accessing - constants' }
SDL3InitConstants class >> SDL_INIT_EVENTS [

	^ SDL_INIT_EVENTS
]

{ #category : 'accessing - constants' }
SDL3InitConstants class >> SDL_INIT_GAMEPAD [

	^ SDL_INIT_GAMEPAD
]

{ #category : 'accessing - constants' }
SDL3InitConstants class >> SDL_INIT_HAPTIC [

	^ SDL_INIT_HAPTIC
]

{ #category : 'accessing - constants' }
SDL3InitConstants class >> SDL_INIT_JOYSTICK [

	^ SDL_INIT_JOYSTICK
]

{ #category : 'accessing - constants' }
SDL3InitConstants class >> SDL_INIT_SENSOR [

	^ SDL_INIT_SENSOR
]

{ #category : 'accessing - constants' }
SDL3InitConstants class >> SDL_INIT_VIDEO [

	^ SDL_INIT_VIDEO
]

{ #category : 'class initialization' }
SDL3InitConstants class >> initialize [

	SDL_INIT_AUDIO := 16r00000010.
	SDL_INIT_VIDEO := 16r00000020.
	SDL_INIT_JOYSTICK := 16r00000200.
	SDL_INIT_HAPTIC := 16r00001000.
	SDL_INIT_GAMEPAD := 16r00002000.
	SDL_INIT_EVENTS := 16r00004000.
	SDL_INIT_SENSOR := 16r00008000.
	SDL_INIT_CAMERA := 16r00010000
]
