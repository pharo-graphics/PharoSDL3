"
I execute specific operations on SDL for OSX
"
Class {
	#name : 'OSSDL3MacOSXPlatform',
	#superclass : 'OSSDL3Platform',
	#category : 'SDL3-OSWindow',
	#package : 'SDL3-OSWindow'
}

{ #category : 'public' }
OSSDL3MacOSXPlatform >> afterMainPharoWindowCreated: aOSSD3LWindow [
]

{ #category : 'public' }
OSSDL3MacOSXPlatform >> afterSetWindowTitle: aString onWindow: aOSSDL3Window [

	| nsString cocoaWindowPointer |
	nsString := ObjCLibrary uniqueInstance nsStringOf: aString.

	cocoaWindowPointer := self platformSpecificHandleOf: aOSSDL3Window backendWindow.

	ObjCLibrary uniqueInstance
		sendMessage: (ObjCLibrary uniqueInstance lookupSelector: 'setTitleWithRepresentedFilename:')
		to: cocoaWindowPointer getHandle
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
OSSDL3MacOSXPlatform >> beforeMainPharoWindowClosed: aOSSDL3Window [
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
