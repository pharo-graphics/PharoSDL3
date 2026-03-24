"
Bindings for `SDL_TrayEntryFlags` constants in `SDL_tray.h`, in SDL3 3.2.10.

This class isn't generated automatically, it's manual. Why? SDL3 doesn't define these flags as an enumeration but as `#define` macros.

```
/**
 * Flags that control the creation of system tray entries.
 *
 * Some of these flags are required; exactly one of them must be specified at
 * the time a tray entry is created. Other flags are optional; zero or more of
 * those can be OR'ed together with the required flag.
 *
 * \since This datatype is available since SDL 3.2.0.
 *
 * \sa SDL_InsertTrayEntryAt
 */
typedef Uint32 SDL_TrayEntryFlags;

#define SDL_TRAYENTRY_BUTTON      0x00000001u /**< Make the entry a simple button. Required. */
#define SDL_TRAYENTRY_CHECKBOX    0x00000002u /**< Make the entry a checkbox. Required. */
#define SDL_TRAYENTRY_SUBMENU     0x00000004u /**< Prepare the entry to have a submenu. Required */
#define SDL_TRAYENTRY_DISABLED    0x80000000u /**< Make the entry disabled. Optional. */
#define SDL_TRAYENTRY_CHECKED     0x40000000u /**< Make the entry checked. This is valid only for checkboxes. Optional. */
```
"
Class {
	#name : 'SDL3TrayEntryFlags',
	#superclass : 'SDL3MacroDefinedFlag',
	#classVars : [
		'SDL_TRAYENTRY_BUTTON',
		'SDL_TRAYENTRY_CHECKBOX',
		'SDL_TRAYENTRY_CHECKED',
		'SDL_TRAYENTRY_DISABLED',
		'SDL_TRAYENTRY_SUBMENU'
	],
	#category : 'SDL3-Own',
	#package : 'SDL3-Own'
}

{ #category : 'accessing enum' }
SDL3TrayEntryFlags class >> button [
	"This method was automatically generated"
	^ SDL_TRAYENTRY_BUTTON
]

{ #category : 'accessing enum' }
SDL3TrayEntryFlags class >> checkbox [
	"This method was automatically generated"
	^ SDL_TRAYENTRY_CHECKBOX
]

{ #category : 'accessing enum' }
SDL3TrayEntryFlags class >> checked [
	"This method was automatically generated"
	^ SDL_TRAYENTRY_CHECKED
]

{ #category : 'accessing enum' }
SDL3TrayEntryFlags class >> disabled [
	"This method was automatically generated"
	^ SDL_TRAYENTRY_DISABLED
]

{ #category : 'enum declaration' }
SDL3TrayEntryFlags class >> enumDecl [
	"self initializeEnumeration; rebuildEnumAccessors"
	
	^ #(
		SDL_TRAYENTRY_BUTTON   1
		SDL_TRAYENTRY_CHECKBOX 2
		SDL_TRAYENTRY_SUBMENU  4
		SDL_TRAYENTRY_DISABLED 2147483648
		SDL_TRAYENTRY_CHECKED  1073741824
		)
]

{ #category : 'accessing enum' }
SDL3TrayEntryFlags class >> submenu [
	"This method was automatically generated"
	^ SDL_TRAYENTRY_SUBMENU
]
