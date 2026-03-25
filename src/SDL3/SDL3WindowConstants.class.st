Class {
	#name : 'SDL3WindowConstants',
	#superclass : 'SharedPool',
	#classVars : [
		'SDL_WINDOWPOS_CENTERED_MASK',
		'SDL_WINDOWPOS_UNDEFINED_MASK',
		'SDL_WINDOW_SURFACE_VSYNC_DISABLED'
	],
	#category : 'SDL3-Library',
	#package : 'SDL3',
	#tag : 'Library'
}

{ #category : 'accessing - constants' }
SDL3WindowConstants class >> SDL_WINDOWPOS_CENTERED_MASK [

	^ SDL_WINDOWPOS_CENTERED_MASK
]

{ #category : 'accessing - constants' }
SDL3WindowConstants class >> SDL_WINDOWPOS_UNDEFINED_MASK [

	^ SDL_WINDOWPOS_UNDEFINED_MASK
]

{ #category : 'accessing - constants' }
SDL3WindowConstants class >> SDL_WINDOW_SURFACE_VSYNC_DISABLED [

	^ SDL_WINDOW_SURFACE_VSYNC_DISABLED
]

{ #category : 'class initialization' }
SDL3WindowConstants class >> initialize [

	SDL_WINDOWPOS_UNDEFINED_MASK := 16r1FFF0000.
	SDL_WINDOWPOS_CENTERED_MASK := 16r2FFF0000.
	SDL_WINDOW_SURFACE_VSYNC_DISABLED := 0
]
