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
	#name : 'S3SDLWindowFlags',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_WINDOW_ALWAYS_ON_TOP',
		'SDL_WINDOW_BORDERLESS',
		'SDL_WINDOW_EXTERNAL',
		'SDL_WINDOW_FULLSCREEN',
		'SDL_WINDOW_HIDDEN',
		'SDL_WINDOW_HIGH_PIXEL_DENSITY',
		'SDL_WINDOW_INPUT_FOCUS',
		'SDL_WINDOW_KEYBOARD_GRABBED',
		'SDL_WINDOW_MAXIMIZED',
		'SDL_WINDOW_METAL',
		'SDL_WINDOW_MINIMIZED',
		'SDL_WINDOW_MODAL',
		'SDL_WINDOW_MOUSE_CAPTURE',
		'SDL_WINDOW_MOUSE_FOCUS',
		'SDL_WINDOW_MOUSE_GRABBED',
		'SDL_WINDOW_MOUSE_RELATIVE_MODE',
		'SDL_WINDOW_NOT_FOCUSABLE',
		'SDL_WINDOW_OCCLUDED',
		'SDL_WINDOW_OPENGL',
		'SDL_WINDOW_POPUP_MENU',
		'SDL_WINDOW_RESIZABLE',
		'SDL_WINDOW_TOOLTIP',
		'SDL_WINDOW_TRANSPARENT',
		'SDL_WINDOW_UTILITY',
		'SDL_WINDOW_VULKAN'
	],
	#category : 'SDL3-Own',
	#package : 'SDL3-Own'
}

{ #category : 'accessing enum' }
S3SDLWindowFlags class >> SDL_WINDOW_ALWAYS_ON_TOP [
	"This method was automatically generated"
	^ SDL_WINDOW_ALWAYS_ON_TOP
]

{ #category : 'accessing enum' }
S3SDLWindowFlags class >> SDL_WINDOW_BORDERLESS [
	"This method was automatically generated"
	^ SDL_WINDOW_BORDERLESS
]

{ #category : 'accessing enum' }
S3SDLWindowFlags class >> SDL_WINDOW_EXTERNAL [
	"This method was automatically generated"
	^ SDL_WINDOW_EXTERNAL
]

{ #category : 'accessing enum' }
S3SDLWindowFlags class >> SDL_WINDOW_FULLSCREEN [
	"This method was automatically generated"
	^ SDL_WINDOW_FULLSCREEN
]

{ #category : 'accessing enum' }
S3SDLWindowFlags class >> SDL_WINDOW_HIDDEN [
	"This method was automatically generated"
	^ SDL_WINDOW_HIDDEN
]

{ #category : 'accessing enum' }
S3SDLWindowFlags class >> SDL_WINDOW_HIGH_PIXEL_DENSITY [
	"This method was automatically generated"
	^ SDL_WINDOW_HIGH_PIXEL_DENSITY
]

{ #category : 'accessing enum' }
S3SDLWindowFlags class >> SDL_WINDOW_INPUT_FOCUS [
	"This method was automatically generated"
	^ SDL_WINDOW_INPUT_FOCUS
]

{ #category : 'accessing enum' }
S3SDLWindowFlags class >> SDL_WINDOW_KEYBOARD_GRABBED [
	"This method was automatically generated"
	^ SDL_WINDOW_KEYBOARD_GRABBED
]

{ #category : 'accessing enum' }
S3SDLWindowFlags class >> SDL_WINDOW_MAXIMIZED [
	"This method was automatically generated"
	^ SDL_WINDOW_MAXIMIZED
]

{ #category : 'accessing enum' }
S3SDLWindowFlags class >> SDL_WINDOW_METAL [
	"This method was automatically generated"
	^ SDL_WINDOW_METAL
]

{ #category : 'accessing enum' }
S3SDLWindowFlags class >> SDL_WINDOW_MINIMIZED [
	"This method was automatically generated"
	^ SDL_WINDOW_MINIMIZED
]

{ #category : 'accessing enum' }
S3SDLWindowFlags class >> SDL_WINDOW_MODAL [
	"This method was automatically generated"
	^ SDL_WINDOW_MODAL
]

{ #category : 'accessing enum' }
S3SDLWindowFlags class >> SDL_WINDOW_MOUSE_CAPTURE [
	"This method was automatically generated"
	^ SDL_WINDOW_MOUSE_CAPTURE
]

{ #category : 'accessing enum' }
S3SDLWindowFlags class >> SDL_WINDOW_MOUSE_FOCUS [
	"This method was automatically generated"
	^ SDL_WINDOW_MOUSE_FOCUS
]

{ #category : 'accessing enum' }
S3SDLWindowFlags class >> SDL_WINDOW_MOUSE_GRABBED [
	"This method was automatically generated"
	^ SDL_WINDOW_MOUSE_GRABBED
]

{ #category : 'accessing enum' }
S3SDLWindowFlags class >> SDL_WINDOW_MOUSE_RELATIVE_MODE [
	"This method was automatically generated"
	^ SDL_WINDOW_MOUSE_RELATIVE_MODE
]

{ #category : 'accessing enum' }
S3SDLWindowFlags class >> SDL_WINDOW_NOT_FOCUSABLE [
	"This method was automatically generated"
	^ SDL_WINDOW_NOT_FOCUSABLE
]

{ #category : 'accessing enum' }
S3SDLWindowFlags class >> SDL_WINDOW_OCCLUDED [
	"This method was automatically generated"
	^ SDL_WINDOW_OCCLUDED
]

{ #category : 'accessing enum' }
S3SDLWindowFlags class >> SDL_WINDOW_OPENGL [
	"This method was automatically generated"
	^ SDL_WINDOW_OPENGL
]

{ #category : 'accessing enum' }
S3SDLWindowFlags class >> SDL_WINDOW_POPUP_MENU [
	"This method was automatically generated"
	^ SDL_WINDOW_POPUP_MENU
]

{ #category : 'accessing enum' }
S3SDLWindowFlags class >> SDL_WINDOW_RESIZABLE [
	"This method was automatically generated"
	^ SDL_WINDOW_RESIZABLE
]

{ #category : 'accessing enum' }
S3SDLWindowFlags class >> SDL_WINDOW_TOOLTIP [
	"This method was automatically generated"
	^ SDL_WINDOW_TOOLTIP
]

{ #category : 'accessing enum' }
S3SDLWindowFlags class >> SDL_WINDOW_TRANSPARENT [
	"This method was automatically generated"
	^ SDL_WINDOW_TRANSPARENT
]

{ #category : 'accessing enum' }
S3SDLWindowFlags class >> SDL_WINDOW_UTILITY [
	"This method was automatically generated"
	^ SDL_WINDOW_UTILITY
]

{ #category : 'accessing enum' }
S3SDLWindowFlags class >> SDL_WINDOW_VULKAN [
	"This method was automatically generated"
	^ SDL_WINDOW_VULKAN
]

{ #category : 'enum declaration' }
S3SDLWindowFlags class >> enumDecl [
	"self
		initializeEnumeration;
		rebuildEnumAccessors"
	
	^ #(
		SDL_WINDOW_FULLSCREEN           16r0000000001
		SDL_WINDOW_OPENGL               16r0000000002
		SDL_WINDOW_OCCLUDED             16r0000000004
		SDL_WINDOW_HIDDEN               16r0000000008
		SDL_WINDOW_BORDERLESS           16r0000000010
		SDL_WINDOW_RESIZABLE            16r0000000020
		SDL_WINDOW_MINIMIZED            16r0000000040
		SDL_WINDOW_MAXIMIZED            16r0000000080
		SDL_WINDOW_MOUSE_GRABBED        16r0000000100
		SDL_WINDOW_INPUT_FOCUS          16r0000000200
		SDL_WINDOW_MOUSE_FOCUS          16r0000000400
		SDL_WINDOW_EXTERNAL             16r0000000800
		SDL_WINDOW_MODAL                16r0000001000
		SDL_WINDOW_HIGH_PIXEL_DENSITY   16r0000002000
		SDL_WINDOW_MOUSE_CAPTURE        16r0000004000
		SDL_WINDOW_MOUSE_RELATIVE_MODE  16r0000008000
		SDL_WINDOW_ALWAYS_ON_TOP        16r0000010000
		SDL_WINDOW_UTILITY              16r0000020000
		SDL_WINDOW_TOOLTIP              16r0000040000
		SDL_WINDOW_POPUP_MENU           16r0000080000
		SDL_WINDOW_KEYBOARD_GRABBED     16r0000100000
		SDL_WINDOW_VULKAN               16r0010000000
		SDL_WINDOW_METAL                16r0020000000
		SDL_WINDOW_TRANSPARENT          16r0040000000
		SDL_WINDOW_NOT_FOCUSABLE        16r0080000000
		)
]
