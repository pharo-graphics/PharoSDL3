Class {
	#name : 'SDL3KeyModifierConstants',
	#superclass : 'SharedPool',
	#classVars : [
		'SDL_KMOD_CAPS',
		'SDL_KMOD_LALT',
		'SDL_KMOD_LCTRL',
		'SDL_KMOD_LEVEL5',
		'SDL_KMOD_LGUI',
		'SDL_KMOD_LSHIFT',
		'SDL_KMOD_MODE',
		'SDL_KMOD_NONE',
		'SDL_KMOD_NUM',
		'SDL_KMOD_RALT',
		'SDL_KMOD_RCTRL',
		'SDL_KMOD_RGUI',
		'SDL_KMOD_RSHIFT',
		'SDL_KMOD_SCROLL'
	],
	#category : 'SDL3-Library',
	#package : 'SDL3',
	#tag : 'Library'
}

{ #category : 'class initialization' }
SDL3KeyModifierConstants class >> initialize [

	SDL_KMOD_NONE := 16r0000.
	SDL_KMOD_LSHIFT := 16r0001.
	SDL_KMOD_RSHIFT := 16r0002.
	SDL_KMOD_LEVEL5 := 16r0004.
	SDL_KMOD_LCTRL := 16r0040.
	SDL_KMOD_RCTRL := 16r0080.
	SDL_KMOD_LALT := 16r0100.
	SDL_KMOD_RALT := 16r0200.
	SDL_KMOD_LGUI := 16r0400.
	SDL_KMOD_RGUI := 16r0800.
	SDL_KMOD_NUM := 16r1000.
	SDL_KMOD_CAPS := 16r2000.
	SDL_KMOD_MODE := 16r4000.
	SDL_KMOD_SCROLL := 16r8000
]
