Class {
	#name : 'SDL3MessageBoxConstants',
	#superclass : 'SharedPool',
	#classVars : [
		'SDL_MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT',
		'SDL_MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT',
		'SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT',
		'SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT',
		'SDL_MESSAGEBOX_ERROR',
		'SDL_MESSAGEBOX_INFORMATION',
		'SDL_MESSAGEBOX_WARNING'
	],
	#category : 'SDL3-Library',
	#package : 'SDL3',
	#tag : 'Library'
}

{ #category : 'accessing - constants' }
SDL3MessageBoxConstants class >> SDL_MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT [

	^ SDL_MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT
]

{ #category : 'accessing - constants' }
SDL3MessageBoxConstants class >> SDL_MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT [

	^ SDL_MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT
]

{ #category : 'accessing - constants' }
SDL3MessageBoxConstants class >> SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT [

	^ SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT
]

{ #category : 'accessing - constants' }
SDL3MessageBoxConstants class >> SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT [

	^ SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT
]

{ #category : 'accessing - constants' }
SDL3MessageBoxConstants class >> SDL_MESSAGEBOX_ERROR [

	^ SDL_MESSAGEBOX_ERROR
]

{ #category : 'accessing - constants' }
SDL3MessageBoxConstants class >> SDL_MESSAGEBOX_INFORMATION [

	^ SDL_MESSAGEBOX_INFORMATION
]

{ #category : 'accessing - constants' }
SDL3MessageBoxConstants class >> SDL_MESSAGEBOX_WARNING [

	^ SDL_MESSAGEBOX_WARNING
]

{ #category : 'class initialization' }
SDL3MessageBoxConstants class >> initialize [

	SDL_MESSAGEBOX_ERROR := 16r00000010.
	SDL_MESSAGEBOX_WARNING := 16r00000020.
	SDL_MESSAGEBOX_INFORMATION := 16r00000040.
	SDL_MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT := 16r00000080.
	SDL_MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT := 16r00000100.
	SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT := 16r00000001.
	SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT := 16r00000002
]
