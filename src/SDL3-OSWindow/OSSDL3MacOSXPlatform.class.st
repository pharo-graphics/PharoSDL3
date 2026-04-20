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

{ #category : 'private' }
OSSDL3MacOSXPlatform >> allowTouchpadInertia [

	| nsUserDefaultsClass standardUserDefaults key |
	nsUserDefaultsClass := self objc lookupClass: 'NSUserDefaults'.

	standardUserDefaults :=
		self objc
			sendMessage: (self objc lookupSelector: 'standardUserDefaults')
			to: (self objc lookupClass: 'NSUserDefaults').

	key := self objc nsStringOf: 'AppleMomentumScrollSupported'.

	self objc
		sendMessage: (self objc lookupSelector: 'setBool:forKey:')
		to: standardUserDefaults
		with: (ExternalAddress fromAddress: 1)
		with: key.
		
	self objc release: key
]

{ #category : 'public' }
OSSDL3MacOSXPlatform >> initPlatformSpecific [

	| sharedApplication |
	sharedApplication := self objc sharedApplication.
	
	self objc
		sendMessage: (self objc lookupSelector: 'finishLaunching')
		to: sharedApplication.

	SDLOSXPharoMenu uniqueInstance installInOSXWindow.

	self allowTouchpadInertia
]

{ #category : 'private' }
OSSDL3MacOSXPlatform >> objc [

	^ ObjCLibrary uniqueInstance
]

{ #category : 'public' }
OSSDL3MacOSXPlatform >> platformSpecificHandleOf: aOSSDL3BackendWindow [

	^ aOSSDL3BackendWindow sdl3Window propertyGroup
		pointerAt: SDL_PROP_WINDOW_COCOA_WINDOW_POINTER
		ifAbsent: nil
]
