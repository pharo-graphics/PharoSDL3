Class {
	#name : 'SDL3VideoTest',
	#superclass : 'SDL3Test',
	#classInstVars : [
		'shouldWaitToSee'
	],
	#category : 'SDL3-Tests-Library',
	#package : 'SDL3-Tests',
	#tag : 'Library'
}

{ #category : 'accessing' }
SDL3VideoTest class >> shouldWaitToSee [

	^ shouldWaitToSee ifNil: [ UIManager default class ~= NonInteractiveUIManager ]
]

{ #category : 'accessing' }
SDL3VideoTest class >> shouldWaitToSee: aBoolean [
	"Establish whether the wait to see tests is actually enabled.
	Useful to be run from terminal, e.g.:
	
	./pharo Pharo.image eval 'SDL3VideoTest shouldWaitToSee: true. LibSDL3VideoTest suite run'
	
	./pharo Pharo.image eval 'SDL3VideoTest shouldWaitToSee: true. LibSDL3VideoTest run: #test06ShapedWindow'

	 "

	shouldWaitToSee := aBoolean
]

{ #category : 'private' }
SDL3VideoTest >> assertEmptySDLError [

	self assertEmpty: lib getError
]

{ #category : 'private' }
SDL3VideoTest >> pollAllEvents [

	[ lib pollEvent: SDL3Event new ] whileTrue
]

{ #category : 'running' }
SDL3VideoTest >> setUp [

	super setUp.

	"Return early if video subsystem is already initialized"
	(lib wasInit: SDL3InitFlags video)
		= SDL3InitFlags video value ifTrue: [ ^ self ].
	
	"Initialize the video subsystem"
	self assert: (lib initSubSystem: SDL3InitFlags video)
]

{ #category : 'tests' }
SDL3VideoTest >> test01ClipboardAPI [

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
			arrayOfStringsOfSize: (mimeTypesCountPointer int64AtOffset: 0). 
	lib free: mimeTypesStringArrayPointer.

	self assert: mimeTypesStringArray equals: #('text/plain;charset=utf-8').
	
	"Clear"
	self assert: lib clearClipboardData.
	self deny: lib hasClipboardText
]

{ #category : 'tests' }
SDL3VideoTest >> test02CreateWindow [

	| window |
	window :=
		lib
			newWindowTitle: #test02CreateWindow
			w: 800 h: 600 flags: 0.
	lib assertSuccess: window.

	self assert: window extent equals: 800 @ 600.

	self waitToSee.

	window destroy
]

{ #category : 'tests' }
SDL3VideoTest >> test03CreateWindowAndRenderer [

	| windowPointer rendererPointer window renderer success |
	windowPointer := (FFIExternalValueHolder ofType: SDL3Window) new.
	rendererPointer := (FFIExternalValueHolder ofType: SDL3Renderer) new.

	success :=
		lib
			newWindowAndRendererTitle: #test03CreateWindowAndRenderer
			width: 800
			height: 600
			windowFlags: 0
			window: windowPointer
			renderer: rendererPointer.
	self assert: success.

	window := windowPointer value.
	renderer := rendererPointer value.
	
	self waitToSee.

	renderer destroy.
	window destroy
]

{ #category : 'tests' }
SDL3VideoTest >> test04BasicRender [

	| window renderer |
	window :=
		lib
			newWindowTitle: #test04BasicRender
			w: 400 h: 300 flags: 0.
	lib assertSuccess: window.

	renderer := window newRendererFor: nil.
	lib assertSuccess: renderer.

	"Clear background with gray color"
	self assert: (renderer renderDrawColorFloatR: 0.5 g: 0.5 b: 0.5 a: 1.0).
	self assert: renderer renderClear.

	"Render a red rectangle"
	self assert: (renderer renderDrawColorFloatR: 0.5 g: 0.0 b: 0.0 a: 1.0).
	self assert: (renderer renderFillRect: (SDL3FRect x: 10 y: 10 width: 120 height: 30)).

	"Render cyan text (debugging API)"
	self assert: (renderer renderDrawColorFloatR: 0.0 g: 1.0 b: 1.0 a: 1.0).
	self assert: (renderer renderDebugTextX: 20 y: 20 str: 'Hello World').

	"Present will actually render the previous operations"
	self assert: renderer renderPresent.

	self waitToSee.
	
	"Tear down"
	renderer destroy.
	window destroy
]

{ #category : 'tests' }
SDL3VideoTest >> test05TextureFromSurfaceFromForm [

	| window renderer texture shapeForm surface |
	window :=
		lib
			newWindowTitle: #test05TextureFromSurfaceFromForm
			w: 400 h: 800 flags: 0.
	lib assertSuccess: window.
	renderer := window newRendererFor: nil.
	lib assertSuccess: renderer.

	"Render and present a texture created from a surface created from a Form"
	shapeForm := self iconNamed: #pharoBig.
	surface := shapeForm asUnownedNewSDL3Surface.
	texture := renderer newTextureFromSurface: surface.
	self assert: surface extent equals: 256 @ 256.
	self assert: texture extent equals: 256.0 @ 256.0.
	surface destroy.
	renderer renderTexture: texture srcrect: nil dstrect: nil.
	renderer renderPresent.
	self assertEmptySDLError.

	self waitToSee.
	
	"Tear down"
	texture destroy.
	self assertEmptySDLError.
	renderer destroy.
	window destroy
]

{ #category : 'tests' }
SDL3VideoTest >> test06ShapedWindow [
	"It doesn't seem to work on Mac"

	| success window extent shapeForm surface renderer |
	extent := 500 @ 500.
	window :=
		lib
			newWindowTitle: #test06ShapedWindow
			w: extent x h: extent y
			flags:
				SDL3WindowFlags hidden | 
				SDL3WindowFlags transparent | 
				SDL3WindowFlags borderless.
	lib assertSuccess: window.

	renderer := window newRendererFor: nil.
	lib assertSuccess: renderer.


	shapeForm := Form extent: extent depth: 32.
	shapeForm getCanvas
		fillColor: Color transparent;
		fillOval: (0@0 corner: extent) color: Color blue.
	surface := shapeForm asUnownedNewSDL3Surface.


	window shape: surface.
	window show.


	"Set cyan color"
	success := renderer renderDrawColorFloatR: 0.0 g: 1.0 b: 1.0 a: 0.0.
	self assert: success.

	"Let's clear with that color"
	success := renderer renderClear.
	self assert: success.

	"Present will actually apply the clear operation"
	success := renderer renderPresent.
	self assert: success.


	self waitToSee.
	
	"Tear down"
	renderer destroy.
	window destroy
]

{ #category : 'tests' }
SDL3VideoTest >> test07Fullscreen [

	| window renderer |
	window :=
		lib
			newWindowTitle: #test07Fullscreen
			w: 0 h: 0 flags: SDL3WindowFlags fullscreen.
	lib assertSuccess: window.
	renderer := window newRendererFor: nil.
	lib assertSuccess: renderer.

	"Render text (debugging API)"
	renderer
		renderDrawColorFloatR: 1.0 g: 1.0 b: 1.0 a: 1.0;
		renderDebugTextX: 100 y: 100 str: 'Hello FULLSCREEN';
		renderPresent.
	self assertEmptySDLError.

	self waitToSee.
	
	"Tear down"
	renderer destroy.
	window destroy
]

{ #category : 'tests' }
SDL3VideoTest >> test08CursorAPI [

	| cursorId cursor |
	cursorId := SDL3SystemCursor crosshair.
	cursor := lib newSystemCursor: cursorId.
	self assert: (lib setCursor: cursor).

	self assert: lib getCursor getHandle equals: cursor getHandle.

	lib hideCursor.
	self deny: lib cursorVisible.

	lib showCursor.
	self assert: lib cursorVisible.

	lib destroyCursor: cursor.
	
	cursor := lib getDefaultCursor.
	self deny: cursor isNull.
	self assert: (lib setCursor: cursor).
	"You do not have to call SDL_DestroyCursor() on the return value, but it is safe to do so."
	lib destroyCursor: cursor 
]

{ #category : 'tests' }
SDL3VideoTest >> test09RenderDrivers [

	| driverNames |
	driverNames := lib renderDrivers.

	self denyEmpty: driverNames.
	self assert: (#(vulkan metal direct3d) includesAnyOf: driverNames)
]

{ #category : 'tests' }
SDL3VideoTest >> test10QueryDisplays [

	self assert: lib displayIDs size equals: lib numberOfDisplays
]

{ #category : 'private' }
SDL3VideoTest >> waitToSee [
	"May perform a wait to let user visually check the window"

	self class shouldWaitToSee ifFalse: [ ^self ].

	"SDL windows need that events are consumed"
	self pollAllEvents.
	2 seconds wait.
	self pollAllEvents
]
