"
Bindings for `SDL_Keymod` constants in `SDL_keycode.h`, in SDL3 3.2.10.

This class isn't generated automatically, it's manual. Why? SDL3 doesn't define these flags as an enumeration but as `#define` macros.


```
/**
 * Valid key modifiers (possibly OR'd together).
 *
 * \since This datatype is available since SDL 3.2.0.
 */
typedef Uint16 SDL_Keymod;

#define SDL_KMOD_NONE   0x0000u /**< no modifier is applicable. */
#define SDL_KMOD_LSHIFT 0x0001u /**< the left Shift key is down. */
#define SDL_KMOD_RSHIFT 0x0002u /**< the right Shift key is down. */
#define SDL_KMOD_LEVEL5 0x0004u /**< the Level 5 Shift key is down. */
#define SDL_KMOD_LCTRL  0x0040u /**< the left Ctrl (Control) key is down. */
#define SDL_KMOD_RCTRL  0x0080u /**< the right Ctrl (Control) key is down. */
#define SDL_KMOD_LALT   0x0100u /**< the left Alt key is down. */
#define SDL_KMOD_RALT   0x0200u /**< the right Alt key is down. */
#define SDL_KMOD_LGUI   0x0400u /**< the left GUI key (often the Windows key) is down. */
#define SDL_KMOD_RGUI   0x0800u /**< the right GUI key (often the Windows key) is down. */
#define SDL_KMOD_NUM    0x1000u /**< the Num Lock key (may be located on an extended keypad) is down. */
#define SDL_KMOD_CAPS   0x2000u /**< the Caps Lock key is down. */
#define SDL_KMOD_MODE   0x4000u /**< the !AltGr key is down. */
#define SDL_KMOD_SCROLL 0x8000u /**< the Scroll Lock key is down. */
#define SDL_KMOD_CTRL   (SDL_KMOD_LCTRL | SDL_KMOD_RCTRL)   /**< Any Ctrl key is down. */
#define SDL_KMOD_SHIFT  (SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT) /**< Any Shift key is down. */
#define SDL_KMOD_ALT    (SDL_KMOD_LALT | SDL_KMOD_RALT)     /**< Any Alt key is down. */
#define SDL_KMOD_GUI    (SDL_KMOD_LGUI | SDL_KMOD_RGUI)     /**< Any GUI key is down. */

```
"
Class {
	#name : 'SDL3Keymod',
	#superclass : 'SDL3MacroDefinedFlag',
	#classVars : [
		'SDL_KMOD_ALT',
		'SDL_KMOD_CAPS',
		'SDL_KMOD_CTRL',
		'SDL_KMOD_GUI',
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
		'SDL_KMOD_SCROLL',
		'SDL_KMOD_SHIFT'
	],
	#category : 'SDL3-Own',
	#package : 'SDL3-Own'
}

{ #category : 'accessing enum' }
SDL3Keymod class >> alt [
	"This method was automatically generated"
	^ SDL_KMOD_ALT
]

{ #category : 'accessing enum' }
SDL3Keymod class >> caps [
	"This method was automatically generated"
	^ SDL_KMOD_CAPS
]

{ #category : 'accessing enum' }
SDL3Keymod class >> ctrl [
	"This method was automatically generated"
	^ SDL_KMOD_CTRL
]

{ #category : 'enum declaration' }
SDL3Keymod class >> enumDecl [
	"self initializeEnumeration; rebuildEnumAccessors"
	
	^ #(
		SDL_KMOD_NONE   16r0000
		SDL_KMOD_LSHIFT 16r0001
		SDL_KMOD_RSHIFT 16r0002
		SDL_KMOD_LEVEL5 16r0004
		SDL_KMOD_LCTRL  16r0040
		SDL_KMOD_RCTRL  16r0080
		SDL_KMOD_LALT   16r0100
		SDL_KMOD_RALT   16r0200
		SDL_KMOD_LGUI   16r0400
		SDL_KMOD_RGUI   16r0800
		SDL_KMOD_NUM    16r1000
		SDL_KMOD_CAPS   16r2000
		SDL_KMOD_MODE   16r4000
		SDL_KMOD_SCROLL 16r8000),
		{#SDL_KMOD_CTRL.  16r0040 | 16r0080.
		#SDL_KMOD_SHIFT.  16r0001 | 16r0002.
		#SDL_KMOD_ALT.    16r0100 | 16r0200.
		#SDL_KMOD_GUI.    16r0400 | 16r0800 }
]

{ #category : 'enum declaration' }
SDL3Keymod class >> enumDeclToCamelCaseDictionary [

	^ super enumDeclToCamelCaseDictionary
		at: #SDL_KMOD_LSHIFT put: #leftShift;
		at: #SDL_KMOD_RSHIFT put: #rightShift;
		at: #SDL_KMOD_LCTRL put: #leftCtrl;
		at: #SDL_KMOD_RCTRL put: #rightCtrl;
		at: #SDL_KMOD_LALT put: #leftAlt;
		at: #SDL_KMOD_RALT put: #rightAlt;
		at: #SDL_KMOD_LGUI put: #leftGUI;
		at: #SDL_KMOD_RGUI put: #rightGUI;
		yourself
]

{ #category : 'accessing enum' }
SDL3Keymod class >> gui [
	"This method was automatically generated"
	^ SDL_KMOD_GUI
]

{ #category : 'accessing enum' }
SDL3Keymod class >> leftAlt [
	"This method was automatically generated"
	^ SDL_KMOD_LALT
]

{ #category : 'accessing enum' }
SDL3Keymod class >> leftCtrl [
	"This method was automatically generated"
	^ SDL_KMOD_LCTRL
]

{ #category : 'accessing enum' }
SDL3Keymod class >> leftGUI [
	"This method was automatically generated"
	^ SDL_KMOD_LGUI
]

{ #category : 'accessing enum' }
SDL3Keymod class >> leftShift [
	"This method was automatically generated"
	^ SDL_KMOD_LSHIFT
]

{ #category : 'accessing enum' }
SDL3Keymod class >> level5 [
	"This method was automatically generated"
	^ SDL_KMOD_LEVEL5
]

{ #category : 'accessing enum' }
SDL3Keymod class >> mode [
	"This method was automatically generated"
	^ SDL_KMOD_MODE
]

{ #category : 'accessing enum' }
SDL3Keymod class >> none [
	"This method was automatically generated"
	^ SDL_KMOD_NONE
]

{ #category : 'accessing enum' }
SDL3Keymod class >> num [
	"This method was automatically generated"
	^ SDL_KMOD_NUM
]

{ #category : 'accessing enum' }
SDL3Keymod class >> rightAlt [
	"This method was automatically generated"
	^ SDL_KMOD_RALT
]

{ #category : 'accessing enum' }
SDL3Keymod class >> rightCtrl [
	"This method was automatically generated"
	^ SDL_KMOD_RCTRL
]

{ #category : 'accessing enum' }
SDL3Keymod class >> rightGUI [
	"This method was automatically generated"
	^ SDL_KMOD_RGUI
]

{ #category : 'accessing enum' }
SDL3Keymod class >> rightShift [
	"This method was automatically generated"
	^ SDL_KMOD_RSHIFT
]

{ #category : 'accessing enum' }
SDL3Keymod class >> scroll [
	"This method was automatically generated"
	^ SDL_KMOD_SCROLL
]

{ #category : 'accessing enum' }
SDL3Keymod class >> shift [
	"This method was automatically generated"
	^ SDL_KMOD_SHIFT
]
