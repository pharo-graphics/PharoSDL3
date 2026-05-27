"
Specific SDL initialization for Windows
"
Class {
	#name : 'OSSDL3WindowsPlatform',
	#superclass : 'OSSDL3Platform',
	#category : 'SDL3-OSWindow-Platforms',
	#package : 'SDL3-OSWindow',
	#tag : 'Platforms'
}

{ #category : 'operations' }
OSSDL3WindowsPlatform >> afterMainPharoWindowCreated: aOSWindow [

	| handle |
	handle := aOSWindow platformSpecificHandle.

	[ self enableDebugWindowMenu: handle ] onErrorDo: [
		"There was an error installing the support for
		debug Window: is the VM too old?" ].

	self wtsRegisterSessionNotification: handle
]

{ #category : 'public' }
OSSDL3WindowsPlatform >> beforeMainPharoWindowClosed: aOSWindow [

	| handle |
	handle := aOSWindow platformSpecificHandle.

	self wtsUnRegisterSessionNotification: handle
]

{ #category : 'private' }
OSSDL3WindowsPlatform >> enableDebugWindowMenu: hwnd [

	self
		ffiCall: #(int enableDebugWindowMenu(void* hwnd))
		module: 'PharoVMCore.dll'
]

{ #category : 'public' }
OSSDL3WindowsPlatform >> platformSpecificHandleOf: aOSSDL3BackendWindow [

	^ aOSSDL3BackendWindow sdl3Window propertyGroup
		pointerAt: SDL_PROP_WINDOW_WIN32_HWND_POINTER
		ifAbsent: nil
]

{ #category : 'private' }
OSSDL3WindowsPlatform >> wtsRegisterSessionNotification: handle [

	"Notify for this session NOTIFY_FOR_THIS_SESSION = 0"
	self ffiCall: #(bool WTSRegisterSessionNotification(void* handle, int32 0)) module: 'Wtsapi32.dll'
]

{ #category : 'private' }
OSSDL3WindowsPlatform >> wtsUnRegisterSessionNotification: handle [
	
	self ffiCall: #(bool WTSUnRegisterSessionNotification(void* handle)) module: 'Wtsapi32.dll'
]
