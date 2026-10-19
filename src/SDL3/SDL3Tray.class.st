"
I am a SDL3 FFI binding for `SDL_Tray`.

An opaque handle representing a toplevel system tray object.

See: https://wiki.libsdl.org/SDL3/SDL_Tray
"
Class {
	#name : 'SDL3Tray',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'instance creation' }
SDL3Tray class >> unownedNewIcon: icon tooltip: tooltip [

	^ (self ffiLibrary createTrayIcon: icon tooltip: tooltip)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'finalization' }
SDL3Tray >> destroy [

	self ffiLibrary destroyTray: self
]

{ #category : 'accessing' }
SDL3Tray >> icon: icon [

	self ffiLibrary setTrayIconTray: self icon: icon
]

{ #category : 'accessing' }
SDL3Tray >> menu [

	^ self ffiLibrary getTrayMenu: self
]

{ #category : 'instance creation' }
SDL3Tray >> newMenu [

	^ self ffiLibrary createTrayMenu: self
]

{ #category : 'accessing' }
SDL3Tray >> tooltip: tooltip [

	self ffiLibrary setTrayTooltipTray: self tooltip: tooltip
]
