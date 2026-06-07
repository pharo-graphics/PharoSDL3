"
I execute specific operations on SDL for OSX
"
Class {
	#name : 'OSSDL3MacOSXPlatform',
	#superclass : 'OSSDL3Platform',
	#category : 'SDL3-OSWindow-Platforms',
	#package : 'SDL3-OSWindow',
	#tag : 'Platforms'
}

{ #category : 'public' }
OSSDL3MacOSXPlatform >> afterSetWindowTitle: aString onWindow: aOSWindow [

	| nsString |
	nsString := self objc nsStringOf: aString.

	self objc
		sendMessage: (self objc lookupSelector: 'setTitleWithRepresentedFilename:')
		to: aOSWindow platformSpecificHandle
		with: nsString.

	self objc release: nsString
]

{ #category : 'public' }
OSSDL3MacOSXPlatform >> initPlatformSpecific [

	| sharedApplication |
	sharedApplication := self objc sharedApplication.
	
	self objc
		sendMessage: (self objc lookupSelector: 'finishLaunching')
		to: sharedApplication.

	SDLOSXPharoMenu uniqueInstance installInOSXWindow.

	"Enable AppleMomentumScrollSupported"
	LibSDL3 uniqueInstance setHintName: SDL_HINT_MAC_SCROLL_MOMENTUM value: '1'

]

{ #category : 'private' }
OSSDL3MacOSXPlatform >> objc [

	^ ObjCLibrary uniqueInstance
]

{ #category : 'public' }
OSSDL3MacOSXPlatform >> platformSpecificHandleOf: aOSSDL3BackendWindow [

	^ aOSSDL3BackendWindow sdlWindow propertyGroup
		pointerAt: SDL_PROP_WINDOW_COCOA_WINDOW_POINTER
		ifAbsent: nil
]
