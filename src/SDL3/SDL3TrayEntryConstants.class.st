Class {
	#name : 'SDL3TrayEntryConstants',
	#superclass : 'SharedPool',
	#classVars : [
		'SDL_TRAYENTRY_BUTTON',
		'SDL_TRAYENTRY_CHECKBOX',
		'SDL_TRAYENTRY_CHECKED',
		'SDL_TRAYENTRY_DISABLED',
		'SDL_TRAYENTRY_SUBMENU'
	],
	#category : 'SDL3-Library',
	#package : 'SDL3',
	#tag : 'Library'
}

{ #category : 'accessing - constants' }
SDL3TrayEntryConstants class >> SDL_TRAYENTRY_BUTTON [

	^ SDL_TRAYENTRY_BUTTON
]

{ #category : 'accessing - constants' }
SDL3TrayEntryConstants class >> SDL_TRAYENTRY_CHECKBOX [

	^ SDL_TRAYENTRY_CHECKBOX
]

{ #category : 'accessing - constants' }
SDL3TrayEntryConstants class >> SDL_TRAYENTRY_CHECKED [

	^ SDL_TRAYENTRY_CHECKED
]

{ #category : 'accessing - constants' }
SDL3TrayEntryConstants class >> SDL_TRAYENTRY_DISABLED [

	^ SDL_TRAYENTRY_DISABLED
]

{ #category : 'accessing - constants' }
SDL3TrayEntryConstants class >> SDL_TRAYENTRY_SUBMENU [

	^ SDL_TRAYENTRY_SUBMENU
]

{ #category : 'class initialization' }
SDL3TrayEntryConstants class >> initialize [

	SDL_TRAYENTRY_BUTTON := 16r00000001.
	SDL_TRAYENTRY_CHECKBOX := 16r00000002.
	SDL_TRAYENTRY_SUBMENU := 16r00000004.
	SDL_TRAYENTRY_DISABLED := 16r80000000.
	SDL_TRAYENTRY_CHECKED := 16r40000000
]
