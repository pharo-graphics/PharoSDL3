"
Bindings for `SDL_MouseButtonFlags` constants in `SDL_mouse.h`, in SDL3 3.2.10.

This class isn't generated automatically, it's manual. Why? SDL3 doesn't define these flags as an enumeration but as `#define` macros.


```
/**
 * A bitmask of pressed mouse buttons, as reported by SDL_GetMouseState, etc.
 *
 * - Button 1: Left mouse button
 * - Button 2: Middle mouse button
 * - Button 3: Right mouse button
 * - Button 4: Side mouse button 1
 * - Button 5: Side mouse button 2
 *
 * \since This datatype is available since SDL 3.2.0.
 *
 * \sa SDL_GetMouseState
 * \sa SDL_GetGlobalMouseState
 * \sa SDL_GetRelativeMouseState
 */
typedef Uint32 SDL_MouseButtonFlags;

#define SDL_BUTTON_LEFT     1
#define SDL_BUTTON_MIDDLE   2
#define SDL_BUTTON_RIGHT    3
#define SDL_BUTTON_X1       4
#define SDL_BUTTON_X2       5

#define SDL_BUTTON_MASK(X)  (1u << ((X)-1))
#define SDL_BUTTON_LMASK    SDL_BUTTON_MASK(SDL_BUTTON_LEFT)
#define SDL_BUTTON_MMASK    SDL_BUTTON_MASK(SDL_BUTTON_MIDDLE)
#define SDL_BUTTON_RMASK    SDL_BUTTON_MASK(SDL_BUTTON_RIGHT)
#define SDL_BUTTON_X1MASK   SDL_BUTTON_MASK(SDL_BUTTON_X1)
#define SDL_BUTTON_X2MASK   SDL_BUTTON_MASK(SDL_BUTTON_X2)
```
"
Class {
	#name : 'SDL3MouseButtonFlags',
	#superclass : 'SDL3MacroDefinedFlag',
	#classVars : [
		'SDL_BUTTON_LEFT',
		'SDL_BUTTON_MIDDLE',
		'SDL_BUTTON_RIGHT',
		'SDL_BUTTON_X1',
		'SDL_BUTTON_X2'
	],
	#category : 'SDL3-Own',
	#package : 'SDL3-Own'
}

{ #category : 'enum declaration' }
SDL3MouseButtonFlags class >> enumDecl [
	"self initializeEnumeration; rebuildEnumAccessors"
	
	^ #(
		SDL_BUTTON_LEFT     1
		SDL_BUTTON_MIDDLE   2
		SDL_BUTTON_RIGHT    3
		SDL_BUTTON_X1       4
		SDL_BUTTON_X2       5
		)
]

{ #category : 'accessing enum' }
SDL3MouseButtonFlags class >> left [
	"This method was automatically generated"
	^ SDL_BUTTON_LEFT
]

{ #category : 'accessing enum' }
SDL3MouseButtonFlags class >> middle [
	"This method was automatically generated"
	^ SDL_BUTTON_MIDDLE
]

{ #category : 'accessing enum' }
SDL3MouseButtonFlags class >> right [
	"This method was automatically generated"
	^ SDL_BUTTON_RIGHT
]

{ #category : 'accessing enum' }
SDL3MouseButtonFlags class >> x1 [
	"This method was automatically generated"
	^ SDL_BUTTON_X1
]

{ #category : 'accessing enum' }
SDL3MouseButtonFlags class >> x2 [
	"This method was automatically generated"
	^ SDL_BUTTON_X2
]
