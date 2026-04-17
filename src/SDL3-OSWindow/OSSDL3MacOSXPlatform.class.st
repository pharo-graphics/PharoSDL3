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

	| nsString cocoaWindowHandle |
	nsString := ObjCLibrary uniqueInstance nsStringOf: aString.

	cocoaWindowHandle := aOSWindow platformSpecificHandle.

	ObjCLibrary uniqueInstance
		sendMessage: (ObjCLibrary uniqueInstance lookupSelector: 'setTitleWithRepresentedFilename:')
		to: cocoaWindowHandle
		with: nsString.

	ObjCLibrary uniqueInstance release: nsString
]

{ #category : 'private' }
OSSDL3MacOSXPlatform >> allowTouchpadInertia [

	| nsUserDefaultsClass standardUserDefaultsSel standardUserDefaults key setBoolForKeySel |
	nsUserDefaultsClass := ObjCLibrary uniqueInstance lookupClass: 'NSUserDefaults'.

	standardUserDefaultsSel := ObjCLibrary uniqueInstance
		                           lookupSelector: 'standardUserDefaults'.

	standardUserDefaults := ObjCLibrary uniqueInstance
		                        sendMessage: standardUserDefaultsSel
		                        to: nsUserDefaultsClass.

	key := ObjCLibrary uniqueInstance nsStringOf: 'AppleMomentumScrollSupported'.

	setBoolForKeySel := ObjCLibrary uniqueInstance lookupSelector:
		                    'setBool:forKey:'.

	ObjCLibrary uniqueInstance
		sendMessage: setBoolForKeySel
		to: standardUserDefaults
		with: (ExternalAddress fromAddress: 1)
		with: key.
		
	ObjCLibrary uniqueInstance release: key
]

{ #category : 'public' }
OSSDL3MacOSXPlatform >> initPlatformSpecific [

	| sharedApplication |
	sharedApplication := ObjCLibrary uniqueInstance sharedApplication.
	
	ObjCLibrary uniqueInstance
		sendMessage: (ObjCLibrary uniqueInstance lookupSelector: 'finishLaunching')
		to: sharedApplication.

	SDLOSXPharoMenu uniqueInstance installInOSXWindow.

	self allowTouchpadInertia
]

{ #category : 'public' }
OSSDL3MacOSXPlatform >> platformSpecificHandleOf: aOSSDL3BackendWindow [

	^ aOSSDL3BackendWindow sdl3Window propertyGroup
		pointerAt: SDL_PROP_WINDOW_COCOA_WINDOW_POINTER
		ifAbsent: nil
]
