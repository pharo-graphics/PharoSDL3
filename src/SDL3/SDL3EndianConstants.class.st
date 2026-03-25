Class {
	#name : 'SDL3EndianConstants',
	#superclass : 'SharedPool',
	#classVars : [
		'SDL_BIG_ENDIAN',
		'SDL_LIL_ENDIAN'
	],
	#category : 'SDL3-Library',
	#package : 'SDL3',
	#tag : 'Library'
}

{ #category : 'accessing - constants' }
SDL3EndianConstants class >> SDL_BIG_ENDIAN [

	^ SDL_BIG_ENDIAN
]

{ #category : 'accessing - constants' }
SDL3EndianConstants class >> SDL_LIL_ENDIAN [

	^ SDL_LIL_ENDIAN
]

{ #category : 'class initialization' }
SDL3EndianConstants class >> initialize [

	SDL_LIL_ENDIAN := 16r4D2.
	SDL_BIG_ENDIAN := 16r10E1
]
