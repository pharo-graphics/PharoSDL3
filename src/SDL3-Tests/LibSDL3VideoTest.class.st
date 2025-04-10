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

	self assert: lib SDL_GetError equals: ''.
]

{ #category : 'private' }
LibSDL3VideoTest >> pollAllEvents [

	[ lib SDL_PollEvent: S3SDL_Event new ] whileTrue
]

{ #category : 'running' }
LibSDL3VideoTest >> setUp [

	super setUp.

	lib := LibSDL3 uniqueInstance.

	"Return early if video subsystem is already initialized"
	(lib SDL_WasInit: S3SDLInitFlags SDL_INIT_VIDEO)
		= S3SDLInitFlags SDL_INIT_VIDEO value ifTrue: [ ^ self ].
	
	"Initialize the video subsystem"
	self assert: (lib SDL_InitSubSystem: S3SDLInitFlags SDL_INIT_VIDEO)
]

{ #category : 'running' }
LibSDL3VideoTest >> tearDown [

	(lib SDL_WasInit: S3SDLInitFlags SDL_INIT_VIDEO)
		= S3SDLInitFlags SDL_INIT_VIDEO ifTrue: [
			lib SDL_QuitSubSystem: S3SDLInitFlags SDL_INIT_VIDEO ].

	super tearDown
]

{ #category : 'tests' }
LibSDL3VideoTest >> test01ClipboardAPI [

	"Copy&paste a non-ASCII string"
	self assert: (lib SDL_SetClipboardText: 'Hëllo').
	self assert: lib SDL_HasClipboardText.
	self assert: lib SDL_GetClipboardText equals: 'Hëllo'.

	"Clear"
	self assert: lib SDL_ClearClipboardData.
	self deny: lib SDL_HasClipboardText
]

{ #category : 'tests' }
LibSDL3VideoTest >> test02CreateWindow [

	| window |
	window :=
		lib
			SDL_CreateWindowTitle: 'Pharo SDL3'
			w: 800 h: 600
			flags: 0.
	self deny: window isNull.

	self waitToSee.

	lib SDL_DestroyWindow: window.
	self assertEmptySDLError
]

{ #category : 'tests' }
LibSDL3VideoTest >> test03CreateWindowAndRenderer [

	| window renderer success |
	window := S3SDL_Window newPointer.
	renderer := S3SDL_Renderer newPointer.

	success :=
		lib
			SDL_CreateWindowAndRendererTitle: 'Pharo SDL3'
			width: 800
			height: 600
			window_flags: 0
			window: window
			renderer: renderer.
	self assert: success.
	
	self waitToSee.

	lib SDL_ClearError.
	lib SDL_DestroyRenderer: renderer getHandle.
	self assertEmptySDLError.
	lib SDL_DestroyWindow: window getHandle.
	self assertEmptySDLError
]

{ #category : 'tests' }
LibSDL3VideoTest >> test04CreateRendererAndClear [

	| success window renderer |
	window :=
		lib
			SDL_CreateWindowTitle: 'Pharo SDL3'
			w: 800 h: 600 flags: 0.
	success := window isNull not.
	self assert: success.

	renderer := lib SDL_CreateRendererWindow: window name: nil.
	success := renderer isNull not.
	self assert: success.

	"Set cyan color"
	success :=
		lib
			SDL_SetRenderDrawColorFloatRenderer: renderer
			r: 0.0 g: 1.0 b: 1.0 a: 0.0.
	self assert: success.

	"Let's clear with that color"
	success := lib SDL_RenderClear: renderer.
	self assert: success.

	"Present will actually apply the clear operation"
	success := lib SDL_RenderPresent: renderer.
	self assert: success.

	self waitToSee.
	
	"Tear down"
	lib SDL_DestroyRenderer: renderer.
	self assertEmptySDLError.
	lib SDL_DestroyWindow: window.
	self assertEmptySDLError
]

{ #category : 'tests' }
LibSDL3VideoTest >> test05RenderSurface [

	| extent window renderer texture shapeForm surface |
	extent := 600@800.

	window :=
		lib
			SDL_CreateWindowTitle: ''
			w: extent x h: extent y flags: 0.
	self assertEmptySDLError.
	renderer := lib SDL_CreateRendererWindow: window name: nil.
	self assertEmptySDLError.

	shapeForm := self iconNamed: #pharoBig.
	surface := shapeForm asUnownedNewSDL3Surface.
	texture := lib SDL_CreateTextureFromSurfaceRenderer: renderer surface: surface.
	lib SDL_RenderTextureRenderer: renderer texture: texture srcrect: nil dstrect: nil.
	lib SDL_RenderPresent: renderer.


	self waitToSee.
	
	"Tear down"
	lib SDL_DestroySurface: surface.
	self assertEmptySDLError.
	lib SDL_DestroyTexture: texture.
	self assertEmptySDLError.
	lib SDL_DestroyRenderer: renderer.
	self assertEmptySDLError.
	lib SDL_DestroyWindow: window.
	self assertEmptySDLError
]

{ #category : 'tests' }
LibSDL3VideoTest >> test06ShapedWindow [
	"It doesn't seem to work on Mac"

	| success window extent shapeForm surface renderer |
	extent := 500 @ 500.
	window :=
		lib
			SDL_CreateWindowTitle: ''
			w: extent x h: extent y
			flags: S3SDLWindowFlags SDL_WINDOW_HIDDEN | S3SDLWindowFlags SDL_WINDOW_TRANSPARENT "| S3SDLWindowFlags SDL_WINDOW_BORDERLESS".
	success := window isNull not.
	self assert: success.

	renderer := lib SDL_CreateRendererWindow: window name: nil.
	self assertEmptySDLError.


	shapeForm := Form extent: extent depth: 32.
	shapeForm getCanvas
		fillColor: Color transparent;
		fillOval: (0@0 corner: extent) color: Color blue.
	surface := shapeForm asUnownedNewSDL3Surface.

	lib SDL_SetWindowShapeWindow: window shape: surface.
	lib SDL_ShowWindow: window.



	"Set cyan color"
	success :=
		lib
			SDL_SetRenderDrawColorFloatRenderer: renderer
			r: 0.0 g: 1.0 b: 1.0 a: 0.0.
	self assert: success.

	"Let's clear with that color"
	success := lib SDL_RenderClear: renderer.
	self assert: success.

	"Present will actually apply the clear operation"
	success := lib SDL_RenderPresent: renderer.
	self assert: success.


	self pollAllEvents.

	2 seconds wait.
	self waitToSee.
	
	"Tear down"
	lib SDL_DestroyRenderer: renderer.
	self assertEmptySDLError.
	lib SDL_DestroyWindow: window.
	self assertEmptySDLError
]

{ #category : 'tests' }
LibSDL3VideoTest >> test07Fullscreen [

	| success window |
	window :=
		lib
			SDL_CreateWindowTitle: ''
			w: 0 h: 0
			flags: S3SDLWindowFlags SDL_WINDOW_FULLSCREEN.
	success := window isNull not.
	self assert: success.

	self waitToSee.
	self waitToSee.
	
	"Tear down"
	lib SDL_DestroyWindow: window.
	self assertEmptySDLError
]

{ #category : 'private' }
LibSDL3VideoTest >> waitToSee [
	"May perform a wait to let use visually check the window"

	0.5 second wait
]
