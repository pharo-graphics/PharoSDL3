"
I am the OSWindowHandle interface implemented using SDL3 library.

I manage the interaction with an SDL3_Window, handling its lifecycle,
attributes (title, icon, extent, position, modes), and event dispatching.
"
Class {
	#name : 'OSSDL3BackendWindow',
	#superclass : 'OSBackendWindow',
	#traits : 'LibTSDL3',
	#classTraits : 'LibTSDL3 classTrait',
	#instVars : [
		'sdl3Window',
		'currentCursor',
		'currentDraggableCallback'
	],
	#pools : [
		'SDL3SystemCursor',
		'SDL3Typedef'
	],
	#category : 'SDL3-OSWindow-Core',
	#package : 'SDL3-OSWindow',
	#tag : 'Core'
}

{ #category : 'configuration' }
OSSDL3BackendWindow class >> formRendererClass [

	^ OSEnvironment current
		at: 'PHARO_WINDOW_RENDERER'
		ifPresent: [ :aClass |
			(self environment hasClassNamed: aClass)
				ifFalse: [ self error: 'Renderer not found' ].
			self environment classNamed: aClass ]
		ifAbsent: [ OSSDL3FormRenderer ]
]

{ #category : 'instance creation' }
OSSDL3BackendWindow class >> fromAttributes: attributes for: anOSWindow [

	^ self basicNew
		initializeFromAttributes: attributes for: anOSWindow;
		yourself
]

{ #category : 'accessing' }
OSSDL3BackendWindow >> borderless [

	^ sdl3Window isBorderless
]

{ #category : 'accessing' }
OSSDL3BackendWindow >> borderless: aBoolean [
	"Set the window to be borderless if aBoolean is true."

	sdl3Window bordered: aBoolean not
]

{ #category : 'accessing' }
OSSDL3BackendWindow >> bounds: newBounds [

	self
		position: newBounds origin;
		extent: newBounds extent
]

{ #category : 'accessing' }
OSSDL3BackendWindow >> clipboardText [
	"Answer the current text in the system clipboard."

	^ LibSDL3 uniqueInstance utf8StringFromExternalAddress: LibSDL3 uniqueInstance getClipboardText
]

{ #category : 'accessing' }
OSSDL3BackendWindow >> clipboardText: aString [
	"Set the system clipboard text to aString."

	LibSDL3 uniqueInstance setClipboardText: aString
]

{ #category : 'deleting' }
OSSDL3BackendWindow >> destroy [
	"Destroy the backend window and release its resources, including any associated GPU device and callbacks."

	sdl3Window ifNotNil: [
		OSSDL3Driver current unregisterWindowWithId: sdl3Window id.

		renderer ifNotNil: [ 
			renderer destroy.
			renderer := nil ].

		currentCursor ifNotNil: [ 
			currentCursor destroy.
			currentCursor := nil ].
		currentDraggableCallback := nil. "Callback will be collected by GC"

		sdl3Window destroy.
		sdl3Window := nil ].

	osWindow := nil
]

{ #category : 'accessing' }
OSSDL3BackendWindow >> extent [
	"Answer the size of the window."

	^ sdl3Window extent
]

{ #category : 'accessing' }
OSSDL3BackendWindow >> extent: aPoint [
	"Set the window extent to aPoint."

	sdl3Window extent: aPoint
]

{ #category : 'accessing' }
OSSDL3BackendWindow >> fullscreen: aBoolean [
	"Set the window to fullscreen mode if aBoolean is true."

	sdl3Window fullscreen: aBoolean
]

{ #category : 'accessing' }
OSSDL3BackendWindow >> hide [

	sdl3Window hide
]

{ #category : 'accessing' }
OSSDL3BackendWindow >> icon: aForm [
	"Set the window icon to aForm."

	| surface |
	surface := aForm asUnownedNewSDL3Surface.
	[ sdl3Window icon: surface ] ensure: [ surface destroy ]
]

{ #category : 'initialization' }
OSSDL3BackendWindow >> initializeFromAttributes: attributes for: anOSWindow [

	self initialize.

	osWindow := anOSWindow.

	sdl3Window := self ffiLibrary
		newWindowTitle: attributes title
		w: attributes width
		h: attributes height
		flags: (self windowFlagsFromAttributes: attributes).
	sdl3Window assertNotNullReturn.
	
	osWindow setJustCreatedHandle: self
]

{ #category : 'text input' }
OSSDL3BackendWindow >> isTextInputActive [

	^ sdl3Window isTextInputActive
]

{ #category : 'testing' }
OSSDL3BackendWindow >> isValid [
	"Answer true if the SDL window handle is still valid."

	^ (sdl3Window isNotNil and: [ sdl3Window isNull not ])
]

{ #category : 'cursor' }
OSSDL3BackendWindow >> lookupSystemCursor: aCursor ifNotFound: aBlock [
	"Lookup the SDL3 equivalent for a standard Pharo cursor."

	| cursorID |
	cursorID :=
		self systemCursorConversionTable
			at: aCursor
			ifAbsent: [ ^ aBlock value ].

	^ LibSDL3 uniqueInstance newSystemCursor: cursorID
]

{ #category : 'accessing' }
OSSDL3BackendWindow >> maximize [

	sdl3Window maximize
]

{ #category : 'accessing' }
OSSDL3BackendWindow >> minimize [

	sdl3Window minimize
]

{ #category : 'factory' }
OSSDL3BackendWindow >> newFormRenderer: form [
	"Create and answer a new Form-based renderer for this window."

	^ renderer :=
		self class formRendererClass new
			form: form;
			backendWindow: self;
			yourself
]

{ #category : 'accessing' }
OSSDL3BackendWindow >> platformSpecificHandle [
	
	^ OSPlatform current osSDL3Platform platformSpecificHandleOf: self
]

{ #category : 'accessing' }
OSSDL3BackendWindow >> position [
	"Answer the window's top-left position."

	^ sdl3Window position
]

{ #category : 'accessing' }
OSSDL3BackendWindow >> position: aPoint [
	"Set the window's position to aPoint."

	sdl3Window position: aPoint
]

{ #category : 'accessing' }
OSSDL3BackendWindow >> raise [
	"Raise the window to the front."

	sdl3Window raise
]

{ #category : 'accessing' }
OSSDL3BackendWindow >> resizable [

	^ sdl3Window isResizable
]

{ #category : 'accessing' }
OSSDL3BackendWindow >> resizable: aBoolean [
	"Set the window's resizable attribute."

	sdl3Window resizable: aBoolean
]

{ #category : 'accessing' }
OSSDL3BackendWindow >> restore [
	"Restore the window from a maximized or minimized state."

	sdl3Window restore
]

{ #category : 'accessing' }
OSSDL3BackendWindow >> screenScaleFactor [
	"Answer the window's display scale factor provided by SDL3.
	
	Based on OSSDL2BackendWindow>>#fetchDPI, which states:

	In OS X disable the computation of a DPI based scale factor. These values
	are completely wrong and we are getting scale factors that are very large
	even in non-retina display. This workaround does not affect the support for
	retina display because that is handled by fetching the size of the drawing surface.
	"

	^ OSPlatform current isMacOS 
		ifTrue: [ 1.0 ]
		ifFalse: [ sdl3Window displayScale ]
]

{ #category : 'accessing' }
OSSDL3BackendWindow >> sdl3Window [
	"Answer the underlying SDL window handle."

	^ sdl3Window
]

{ #category : 'cursor' }
OSSDL3BackendWindow >> setMouseCursor: aCursor mask: aMask andScale: aScale [
	"Set the window's mouse cursor to aCursor (a Form). The mask and scale are currently ignored in this SDL3 implementation as we use color surfaces."

	| surface sdlCursor offset |
	sdlCursor := self lookupSystemCursor: aCursor ifNotFound: [ 
		surface := aCursor asUnownedNewSDL3Surface.
		offset := aCursor offset.
		[ 
			LibSDL3 uniqueInstance newColorCursorSurface: surface hotX: offset x negated hotY: offset y negated
		] ensure: [ surface destroy ]
	].

	currentCursor ifNotNil: [ currentCursor destroy ].
	currentCursor := sdlCursor.
	currentCursor setActive
]

{ #category : 'testing' }
OSSDL3BackendWindow >> shouldRegisterAfterRestart [

	^ sdl3Window isNotNil
]

{ #category : 'accessing' }
OSSDL3BackendWindow >> show [
	"Show the window."

	sdl3Window show
]

{ #category : 'text input' }
OSSDL3BackendWindow >> startTextInput [

	sdl3Window startTextInput
]

{ #category : 'text input' }
OSSDL3BackendWindow >> startTextInputAtRectangle: aRectangle [

	sdl3Window
		startTextInput;
		textInputAreaRect: (SDL_Rect newFrom: aRectangle)
			cursor: 0
]

{ #category : 'text input' }
OSSDL3BackendWindow >> stopTextInput [

	sdl3Window stopTextInput
]

{ #category : 'private' }
OSSDL3BackendWindow >> systemCursorConversionTable [
	"Answer a dictionary mapping Pharo standard cursors to SDL3 system cursor constants."

	^ {
		Cursor normal -> SDL_SYSTEM_CURSOR_DEFAULT.
		Cursor overEditableText -> SDL_SYSTEM_CURSOR_TEXT.
		Cursor wait -> SDL_SYSTEM_CURSOR_WAIT.
		Cursor crossHair -> SDL_SYSTEM_CURSOR_CROSSHAIR.
		"Using PROGRESS for wait since Pharo doesn't have a distinct progress cursor in basic set"
		Cursor wait -> SDL_SYSTEM_CURSOR_PROGRESS.
		Cursor resizeLeft -> SDL_SYSTEM_CURSOR_W_RESIZE.
		Cursor resizeRight -> SDL_SYSTEM_CURSOR_E_RESIZE.
		Cursor resizeTop -> SDL_SYSTEM_CURSOR_N_RESIZE.
		Cursor resizeBottom -> SDL_SYSTEM_CURSOR_S_RESIZE.
		Cursor resizeTopLeft -> SDL_SYSTEM_CURSOR_NW_RESIZE.
		Cursor resizeTopRight -> SDL_SYSTEM_CURSOR_NE_RESIZE.
		Cursor resizeBottomLeft -> SDL_SYSTEM_CURSOR_SW_RESIZE.
		Cursor resizeBottomRight -> SDL_SYSTEM_CURSOR_SE_RESIZE.
		Cursor move -> SDL_SYSTEM_CURSOR_MOVE.
		Cursor webLink -> SDL_SYSTEM_CURSOR_POINTER.
	} asDictionary
]

{ #category : 'accessing' }
OSSDL3BackendWindow >> title [
	"Answer the window title."

	^ sdl3Window title
]

{ #category : 'accessing' }
OSSDL3BackendWindow >> title: aString [
	"Set the window title to aString."

	sdl3Window title: aString
]

{ #category : 'events' }
OSSDL3BackendWindow >> updateToNewResolution [
	"Force the regeneration of the renderer because we have a new resolution"

	renderer updateToNewResolution
]

{ #category : 'private' }
OSSDL3BackendWindow >> windowFlagsFromAttributes: attributes [

	| flags |
	flags := SDL3WindowFlags highPixelDensity.

	attributes fullscreen ifTrue: [ flags := flags bitOr: SDL3WindowFlags fullscreen ].
	attributes borderless ifTrue: [ flags := flags bitOr: SDL3WindowFlags borderless ].
	attributes resizable ifTrue: [ flags := flags bitOr: SDL3WindowFlags resizable ].
	attributes maximized ifTrue: [ flags := flags bitOr: SDL3WindowFlags maximized ].
	attributes minimized ifTrue: [ flags := flags bitOr: SDL3WindowFlags minimized ].

	^ flags
]

{ #category : 'accessing' }
OSSDL3BackendWindow >> windowId [
	"Answer the unique ID of the underlying SDL window."

	^ sdl3Window id
]
