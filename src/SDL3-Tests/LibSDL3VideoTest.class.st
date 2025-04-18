Class {
	#name : 'LibSDL3VideoTest',
	#superclass : 'TestCase',
	#instVars : [
		'lib'
	],
	#category : 'SDL3-Tests-Library',
	#package : 'SDL3-Tests',
	#tag : 'Library'
}

{ #category : 'private' }
LibSDL3VideoTest >> assertEmptySDLError [

	self assert: lib getError equals: ''.
]

{ #category : 'private' }
LibSDL3VideoTest >> pollAllEvents [

	[ lib pollEvent: S3SDL_Event new ] whileTrue
]

{ #category : 'running' }
LibSDL3VideoTest >> setUp [

	super setUp.

	lib := LibSDL3 uniqueInstance.

	"Return early if video subsystem is already initialized"
	(lib wasInit: S3SDLInitFlags SDL_INIT_VIDEO)
		= S3SDLInitFlags SDL_INIT_VIDEO value ifTrue: [ ^ self ].
	
	"Initialize the video subsystem"
	self assert: (lib initSubSystem: S3SDLInitFlags SDL_INIT_VIDEO)
]

{ #category : 'running' }
LibSDL3VideoTest >> tearDown [

	(lib wasInit: S3SDLInitFlags SDL_INIT_VIDEO)
		= S3SDLInitFlags SDL_INIT_VIDEO ifTrue: [
			lib quitSubSystem: S3SDLInitFlags SDL_INIT_VIDEO ].

	super tearDown
]

{ #category : 'tests' }
LibSDL3VideoTest >> test01ClipboardAPI [

	"Copy&paste a non-ASCII string"
	| mimeTypesCountPointer mimeTypesStringArrayPointer mimeTypesStringArray |
	self assert: (lib setClipboardText: 'Hëllo').
	self assert: lib hasClipboardText.
	self assert: lib getClipboardText equals: 'Hëllo'.

	"Clipboard supports more than text"
	mimeTypesCountPointer := FFIInt64 newBuffer.
	mimeTypesStringArrayPointer := lib getClipboardMimeTypes: mimeTypesCountPointer.
	mimeTypesStringArray :=
		mimeTypesStringArrayPointer
			arrayOfStringsOfSize: (mimeTypesCountPointer signedLongLongAt: 1). 
	lib free: mimeTypesStringArrayPointer.

	self assert: mimeTypesStringArray equals: #('text/plain;charset=utf-8').
	
	"Clear"
	self assert: lib clearClipboardData.
	self deny: lib hasClipboardText
]

{ #category : 'tests' }
LibSDL3VideoTest >> test02CreateWindow [

	| window |
	window :=
		lib
			newWindowTitle: 'Pharo SDL3'
			w: 800 h: 600 flags: 0.
	self deny: window isNull.

	self waitToSee.

	lib destroyWindow: window.
	self assertEmptySDLError
]

{ #category : 'tests' }
LibSDL3VideoTest >> test03CreateWindowAndRenderer [

	| windowPointer rendererPointer window renderer success |
	windowPointer := (FFIExternalValueHolder ofType: S3SDL_Window) new.
	rendererPointer := (FFIExternalValueHolder ofType: S3SDL_Renderer) new.

	success :=
		lib
			newWindowAndRendererTitle: 'Pharo SDL3'
			width: 800
			height: 600
			windowFlags: 0
			window: windowPointer
			renderer: rendererPointer.
	self assert: success.

	window := windowPointer value.
	renderer := rendererPointer value.
	
	self waitToSee.

	lib clearError.
	lib destroyRenderer: renderer.
	self assertEmptySDLError.
	lib destroyWindow: window.
	self assertEmptySDLError
]

{ #category : 'tests' }
LibSDL3VideoTest >> test04BasicRender [

	| success window renderer |
	window :=
		lib
			newWindowTitle: 'Pharo SDL3'
			w: 400 h: 300 flags: 0.
	success := window isNull not.
	self assert: success.

	renderer := lib newRendererWindow: window name: nil.
	success := renderer isNull not.
	self assert: success.

	"Clear background with gray color"
	self assert:
		(lib
			setRenderDrawColorFloatRenderer: renderer
			r: 0.5 g: 0.5 b: 0.5 a: 1.0).
	self assert: (lib renderClear: renderer).

	"Render a red rectangle"
	self assert:
		(lib
			setRenderDrawColorFloatRenderer: renderer
			r: 0.5 g: 0.0 b: 0.0 a: 1.0).
	self assert:
		(lib
			renderFillRectRenderer: renderer
			rect:
				(S3SDL_FRect new
					x: 10;
					y: 10;
					w: 120;
					h: 30;
					yourself)).

	"Render cyan text (debugging API)"
	self assert:
		(lib
			setRenderDrawColorFloatRenderer: renderer
			r: 0.0 g: 1.0 b: 1.0 a: 1.0).
	self assert:
		(lib
			renderDebugTextRenderer: renderer
			x: 20 y: 20 str: 'Hello World').

	"Present will actually render the previous operations"
	self assert: (lib renderPresent: renderer).

	self waitToSee.
	
	"Tear down"
	lib destroyRenderer: renderer.
	self assertEmptySDLError.
	lib destroyWindow: window.
	self assertEmptySDLError
]

{ #category : 'tests' }
LibSDL3VideoTest >> test05TextureFromSurfaceFromForm [

	| extent window renderer texture shapeForm surface |
	extent := 400@800.

	window :=
		lib
			newWindowTitle: 'Form -> SDL_Surface -> SDL_Texture'
			w: extent x h: extent y flags: 0.
	self assertEmptySDLError.
	renderer := lib newRendererWindow: window name: nil.
	self assertEmptySDLError.

	"Render and present a texture created from a surface created from a Form"
	shapeForm := self iconNamed: #pharoBig.
	surface := shapeForm asUnownedNewSDL3Surface.
	texture := lib newTextureFromSurfaceRenderer: renderer surface: surface.
	lib destroySurface: surface.
	lib renderTextureRenderer: renderer texture: texture srcrect: nil dstrect: nil.
	lib renderPresent: renderer.
	self assertEmptySDLError.

	self waitToSee.
	
	"Tear down"
	texture destroy.
	self assertEmptySDLError.
	lib destroyRenderer: renderer.
	self assertEmptySDLError.
	lib destroyWindow: window.
	self assertEmptySDLError
]

{ #category : 'tests' }
LibSDL3VideoTest >> test06ShapedWindow [
	"It doesn't seem to work on Mac"

	| success window extent shapeForm surface renderer |
	extent := 500 @ 500.
	window :=
		lib
			newWindowTitle: ''
			w: extent x h: extent y
			flags: S3SDLWindowFlags SDL_WINDOW_HIDDEN | S3SDLWindowFlags SDL_WINDOW_TRANSPARENT "| S3SDLWindowFlags SDL_WINDOW_BORDERLESS".
	success := window isNull not.
	self assert: success.

	renderer := lib newRendererWindow: window name: nil.
	self assertEmptySDLError.


	shapeForm := Form extent: extent depth: 32.
	shapeForm getCanvas
		fillColor: Color transparent;
		fillOval: (0@0 corner: extent) color: Color blue.
	surface := shapeForm asUnownedNewSDL3Surface.

	lib setWindowShapeWindow: window shape: surface.
	lib showWindow: window.



	"Set cyan color"
	success :=
		lib
			setRenderDrawColorFloatRenderer: renderer
			r: 0.0 g: 1.0 b: 1.0 a: 0.0.
	self assert: success.

	"Let's clear with that color"
	success := lib renderClear: renderer.
	self assert: success.

	"Present will actually apply the clear operation"
	success := lib renderPresent: renderer.
	self assert: success.


	self pollAllEvents.

	2 seconds wait.
	self waitToSee.
	
	"Tear down"
	lib destroyRenderer: renderer.
	self assertEmptySDLError.
	lib destroyWindow: window.
	self assertEmptySDLError
]

{ #category : 'tests' }
LibSDL3VideoTest >> test07Fullscreen [

	| success window |
	window :=
		lib
			newWindowTitle: ''
			w: 0 h: 0 flags: S3SDLWindowFlags SDL_WINDOW_FULLSCREEN.
	success := window isNull not.
	self assert: success.

	self waitToSee.
	self waitToSee.
	
	"Tear down"
	lib destroyWindow: window.
	self assertEmptySDLError
]

{ #category : 'private' }
LibSDL3VideoTest >> waitToSee [
	"May perform a wait to let user visually check the window"

	UIManager default class = NonInteractiveUIManager ifTrue: [ ^ self ].
	1 second wait
]
