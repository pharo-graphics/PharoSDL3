"
Bindings for `SDL_InitFlags` constants in `SDL_init.h`, in SDL3 3.1.3.

This class isn't generated automatically, it's manual. Why? SDL3 doesn't define these flags as an enumeration but as `#define` macros.
CIG already translated `SDL_InitFlags` as an alias of uint32. So, this avoid a potential conflict.


```
/**
 * Initialization flags for SDL_Init and/or SDL_InitSubSystem
 *
 * These are the flags which may be passed to SDL_Init(). You should specify
 * the subsystems which you will be using in your application.
 *
 * \since This datatype is available since SDL 3.0.0.
 *
 * \sa SDL_Init
 * \sa SDL_Quit
 * \sa SDL_InitSubSystem
 * \sa SDL_QuitSubSystem
 * \sa SDL_WasInit
 */
typedef Uint32 SDL_InitFlags;

#define SDL_INIT_AUDIO      0x00000010u /**< `SDL_INIT_AUDIO` implies `SDL_INIT_EVENTS` */
#define SDL_INIT_VIDEO      0x00000020u /**< `SDL_INIT_VIDEO` implies `SDL_INIT_EVENTS` */
#define SDL_INIT_JOYSTICK   0x00000200u /**< `SDL_INIT_JOYSTICK` implies `SDL_INIT_EVENTS`, should be initialized on the same thread as SDL_INIT_VIDEO on Windows if you don't set SDL_HINT_JOYSTICK_THREAD */
#define SDL_INIT_HAPTIC     0x00001000u
#define SDL_INIT_GAMEPAD    0x00002000u /**< `SDL_INIT_GAMEPAD` implies `SDL_INIT_JOYSTICK` */
#define SDL_INIT_EVENTS     0x00004000u
#define SDL_INIT_SENSOR     0x00008000u /**< `SDL_INIT_SENSOR` implies `SDL_INIT_EVENTS` */
#define SDL_INIT_CAMERA     0x00010000u /**< `SDL_INIT_CAMERA` implies `SDL_INIT_EVENTS` */
```
"
Class {
	#name : 'SDL3InitFlags',
	#superclass : 'SDL3MacroDefinedFlag',
	#classVars : [
		'SDL_INIT_AUDIO',
		'SDL_INIT_CAMERA',
		'SDL_INIT_EVENTS',
		'SDL_INIT_GAMEPAD',
		'SDL_INIT_HAPTIC',
		'SDL_INIT_JOYSTICK',
		'SDL_INIT_SENSOR',
		'SDL_INIT_VIDEO'
	],
	#category : 'SDL3-Own',
	#package : 'SDL3-Own'
}

{ #category : 'accessing enum' }
SDL3InitFlags class >> audio [
	"This method was automatically generated"
	^ SDL_INIT_AUDIO
]

{ #category : 'accessing enum' }
SDL3InitFlags class >> camera [
	"This method was automatically generated"
	^ SDL_INIT_CAMERA
]

{ #category : 'enum declaration' }
SDL3InitFlags class >> enumDecl [
	"self rebuildEnumAccessors"
	
	^ #(
		SDL_INIT_AUDIO 16r00000010
		SDL_INIT_VIDEO 16r00000020
		SDL_INIT_JOYSTICK 16r00000200
		SDL_INIT_HAPTIC 16r00001000
		SDL_INIT_GAMEPAD 16r00002000
		SDL_INIT_EVENTS 16r00004000
		SDL_INIT_SENSOR 16r00008000
		SDL_INIT_CAMERA 16r00010000 )
]

{ #category : 'accessing enum' }
SDL3InitFlags class >> events [
	"This method was automatically generated"
	^ SDL_INIT_EVENTS
]

{ #category : 'accessing enum' }
SDL3InitFlags class >> gamepad [
	"This method was automatically generated"
	^ SDL_INIT_GAMEPAD
]

{ #category : 'accessing enum' }
SDL3InitFlags class >> haptic [
	"This method was automatically generated"
	^ SDL_INIT_HAPTIC
]

{ #category : 'accessing enum' }
SDL3InitFlags class >> joystick [
	"This method was automatically generated"
	^ SDL_INIT_JOYSTICK
]

{ #category : 'accessing enum' }
SDL3InitFlags class >> sensor [
	"This method was automatically generated"
	^ SDL_INIT_SENSOR
]

{ #category : 'accessing enum' }
SDL3InitFlags class >> video [
	"This method was automatically generated"
	^ SDL_INIT_VIDEO
]
