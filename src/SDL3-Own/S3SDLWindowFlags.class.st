"
Bindings for `SDL_WindowFlags` constants in `SDL_video.h`, in SDL3 3.2.8.

This class isn't generated automatically, it's manual. Why? SDL3 doesn't define these flags as an enumeration but as `#define` macros.


```
/**
 * The flags on a window.
 *
 * These cover a lot of true/false, or on/off, window state. Some of it is
 * immutable after being set through SDL_CreateWindow(), some of it can be
 * changed on existing windows by the app, and some of it might be altered by
 * the user or system outside of the app's control.
 *
 * \since This datatype is available since SDL 3.2.0.
 *
 * \sa SDL_GetWindowFlags
 */
typedef Uint64 SDL_WindowFlags;

#define SDL_WINDOW_FULLSCREEN           SDL_UINT64_C(0x0000000000000001)    /**< window is in fullscreen mode */
#define SDL_WINDOW_OPENGL               SDL_UINT64_C(0x0000000000000002)    /**< window usable with OpenGL context */
#define SDL_WINDOW_OCCLUDED             SDL_UINT64_C(0x0000000000000004)    /**< window is occluded */
#define SDL_WINDOW_HIDDEN               SDL_UINT64_C(0x0000000000000008)    /**< window is neither mapped onto the desktop nor shown in the taskbar/dock/window list; SDL_ShowWindow() is required for it to become visible */
#define SDL_WINDOW_BORDERLESS           SDL_UINT64_C(0x0000000000000010)    /**< no window decoration */
#define SDL_WINDOW_RESIZABLE            SDL_UINT64_C(0x0000000000000020)    /**< window can be resized */
#define SDL_WINDOW_MINIMIZED            SDL_UINT64_C(0x0000000000000040)    /**< window is minimized */
#define SDL_WINDOW_MAXIMIZED            SDL_UINT64_C(0x0000000000000080)    /**< window is maximized */
#define SDL_WINDOW_MOUSE_GRABBED        SDL_UINT64_C(0x0000000000000100)    /**< window has grabbed mouse input */
#define SDL_WINDOW_INPUT_FOCUS          SDL_UINT64_C(0x0000000000000200)    /**< window has input focus */
#define SDL_WINDOW_MOUSE_FOCUS          SDL_UINT64_C(0x0000000000000400)    /**< window has mouse focus */
#define SDL_WINDOW_EXTERNAL             SDL_UINT64_C(0x0000000000000800)    /**< window not created by SDL */
#define SDL_WINDOW_MODAL                SDL_UINT64_C(0x0000000000001000)    /**< window is modal */
#define SDL_WINDOW_HIGH_PIXEL_DENSITY   SDL_UINT64_C(0x0000000000002000)    /**< window uses high pixel density back buffer if possible */
#define SDL_WINDOW_MOUSE_CAPTURE        SDL_UINT64_C(0x0000000000004000)    /**< window has mouse captured (unrelated to MOUSE_GRABBED) */
#define SDL_WINDOW_MOUSE_RELATIVE_MODE  SDL_UINT64_C(0x0000000000008000)    /**< window has relative mode enabled */
#define SDL_WINDOW_ALWAYS_ON_TOP        SDL_UINT64_C(0x0000000000010000)    /**< window should always be above others */
#define SDL_WINDOW_UTILITY              SDL_UINT64_C(0x0000000000020000)    /**< window should be treated as a utility window, not showing in the task bar and window list */
#define SDL_WINDOW_TOOLTIP              SDL_UINT64_C(0x0000000000040000)    /**< window should be treated as a tooltip and does not get mouse or keyboard focus, requires a parent window */
#define SDL_WINDOW_POPUP_MENU           SDL_UINT64_C(0x0000000000080000)    /**< window should be treated as a popup menu, requires a parent window */
#define SDL_WINDOW_KEYBOARD_GRABBED     SDL_UINT64_C(0x0000000000100000)    /**< window has grabbed keyboard input */
#define SDL_WINDOW_VULKAN               SDL_UINT64_C(0x0000000010000000)    /**< window usable for Vulkan surface */
#define SDL_WINDOW_METAL                SDL_UINT64_C(0x0000000020000000)    /**< window usable for Metal view */
#define SDL_WINDOW_TRANSPARENT          SDL_UINT64_C(0x0000000040000000)    /**< window with transparent buffer */
#define SDL_WINDOW_NOT_FOCUSABLE        SDL_UINT64_C(0x0000000080000000)    /**< window should not be focusable */
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
