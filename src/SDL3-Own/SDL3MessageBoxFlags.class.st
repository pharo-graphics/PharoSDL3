"
Bindings for `SDL_MessageBoxFlags` constants in `SDL_messagebox.h`, in SDL3 3.2.8.

This class isn't generated automatically, it's manual. Why? SDL3 doesn't define these flags as an enumeration but as `#define` macros.


```
/**
 * Message box flags.
 *
 * If supported will display warning icon, etc.
 *
 * \since This datatype is available since SDL 3.2.0.
 */
typedef Uint32 SDL_MessageBoxFlags;

#define SDL_MESSAGEBOX_ERROR                    0x00000010u /**< error dialog */
#define SDL_MESSAGEBOX_WARNING                  0x00000020u /**< warning dialog */
#define SDL_MESSAGEBOX_INFORMATION              0x00000040u /**< informational dialog */
#define SDL_MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT    0x00000080u /**< buttons placed left to right */
#define SDL_MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT    0x00000100u /**< buttons placed right to left */
```
"
Class {
	#name : 'SDL3MessageBoxFlags',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT',
		'SDL_MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT',
		'SDL_MESSAGEBOX_ERROR',
		'SDL_MESSAGEBOX_INFORMATION',
		'SDL_MESSAGEBOX_WARNING'
	],
	#category : 'SDL3-Own',
	#package : 'SDL3-Own'
}

{ #category : 'accessing enum' }
SDL3MessageBoxFlags class >> buttonsLeftToRight [
	"This method was automatically generated"
	^ SDL_MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT
]

{ #category : 'accessing enum' }
SDL3MessageBoxFlags class >> buttonsRightToLeft [
	"This method was automatically generated"
	^ SDL_MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT
]

{ #category : 'enum declaration' }
SDL3MessageBoxFlags class >> enumDecl [
	
	^ #(
		SDL_MESSAGEBOX_ERROR                    16r0010
		SDL_MESSAGEBOX_WARNING                  16r0020
		SDL_MESSAGEBOX_INFORMATION              16r0040
		SDL_MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT    16r0080
		SDL_MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT    16r0100
		)
]

{ #category : 'accessing enum' }
SDL3MessageBoxFlags class >> error [
	"This method was automatically generated"
	^ SDL_MESSAGEBOX_ERROR
]

{ #category : 'accessing enum' }
SDL3MessageBoxFlags class >> information [
	"This method was automatically generated"
	^ SDL_MESSAGEBOX_INFORMATION
]

{ #category : 'accessing enum' }
SDL3MessageBoxFlags class >> warning [
	"This method was automatically generated"
	^ SDL_MESSAGEBOX_WARNING
]
