"
Bindings for the bit masks on `SDL_MouseButtonFlags` defined in `SDL_mouse.h`, in SDL3 3.4.0.

This class isn't generated automatically, since CIG doesn't parse this kind of `#define` macros that use functions:


```
#define SDL_BUTTON_MASK(X)  (1u << ((X)-1))
#define SDL_BUTTON_LMASK    SDL_BUTTON_MASK(SDL_BUTTON_LEFT)
#define SDL_BUTTON_MMASK    SDL_BUTTON_MASK(SDL_BUTTON_MIDDLE)
#define SDL_BUTTON_RMASK    SDL_BUTTON_MASK(SDL_BUTTON_RIGHT)
#define SDL_BUTTON_X1MASK   SDL_BUTTON_MASK(SDL_BUTTON_X1)
#define SDL_BUTTON_X2MASK   SDL_BUTTON_MASK(SDL_BUTTON_X2)
```
"
Class {
	#name : 'SDL3MouseButtonFlagsMask',
	#superclass : 'SDL3MacroDefinedFlag',
	#classVars : [
		'SDL_BUTTON_LMASK',
		'SDL_BUTTON_MMASK',
		'SDL_BUTTON_RMASK',
		'SDL_BUTTON_X1MASK',
		'SDL_BUTTON_X2MASK'
	],
	#category : 'SDL3-Own',
	#package : 'SDL3-Own'
}

{ #category : 'enum declaration' }
SDL3MouseButtonFlagsMask class >> enumDecl [
	"self initializeEnumeration; rebuildEnumAccessors"
	
	^ #(
		#left    1 
		#middle    2
		#right    4
		#x1   8
		#x2   16
		)
]

{ #category : 'accessing enum' }
SDL3MouseButtonFlagsMask class >> left [
	"This method was automatically generated"
	^ SDL_BUTTON_LMASK
]

{ #category : 'accessing enum' }
SDL3MouseButtonFlagsMask class >> middle [
	"This method was automatically generated"
	^ SDL_BUTTON_MMASK
]

{ #category : 'accessing enum' }
SDL3MouseButtonFlagsMask class >> right [
	"This method was automatically generated"
	^ SDL_BUTTON_RMASK
]

{ #category : 'accessing enum' }
SDL3MouseButtonFlagsMask class >> x1 [
	"This method was automatically generated"
	^ SDL_BUTTON_X1MASK
]

{ #category : 'accessing enum' }
SDL3MouseButtonFlagsMask class >> x2 [
	"This method was automatically generated"
	^ SDL_BUTTON_X2MASK
]
