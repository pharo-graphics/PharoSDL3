Class {
	#name : 'SDL3WindowTest',
	#superclass : 'SDL3Test',
	#classInstVars : [
		'waitDuration'
	],
	#category : 'SDL3-Tests-Library',
	#package : 'SDL3-Tests',
	#tag : 'Library'
}

{ #category : 'accessing' }
SDL3WindowTest class >> defaultTimeLimit [
	"Answe rthe default time limit, which includes the #waitDuration."

	^ super defaultTimeLimit + self waitDuration
]

{ #category : 'accessing' }
SDL3WindowTest class >> waitDuration [

	^ waitDuration ifNil: [ 1 seconds ]
]

{ #category : 'accessing' }
SDL3WindowTest class >> waitDuration: aDuration [
	"Establish how much time to wait to see on tests.

	Run a specific test:
	./pharo Pharo.image eval 'SDL3WindowTest waitDuration: 7 seconds. SDL3WindowTest run: #test05ShapedWindow'

	Run whole suite:
	./pharo Pharo.image eval 'SDL3WindowTest waitDuration: 7 seconds. SDL3WindowTest suite run'
	 "

	waitDuration := aDuration
]

{ #category : 'private' }
SDL3WindowTest >> consumeEvents [

	[ sdl pollEvent: SDL3Event new ] whileTrue
]

{ #category : 'running' }
SDL3WindowTest >> setUp [

	super setUp.

	"Ensure video subsystem is initialized"
	self assert: (sdl initSubSystem: SDL3InitFlags video)
]

{ #category : 'tests' }
SDL3WindowTest >> test01CreateWindow [

	| window |
	window :=
		sdl
			newWindowTitle: #test01CreateWindow
			w: 800 h: 600 flags: 0.
	window assertNotNullReturn.

	self assert: window extent equals: 800 @ 600.

	self waitToSee.

	window destroy
]

{ #category : 'tests' }
SDL3WindowTest >> test02CreateWindowAndRenderer [

	| windowHolder rendererHolder window renderer success |
	windowHolder := (FFIExternalValueHolder ofType: SDL3Window) new.
	rendererHolder := (FFIExternalValueHolder ofType: SDL3Renderer) new.

	success :=
		sdl
			newWindowAndRendererTitle: #test02CreateWindowAndRenderer
			width: 800
			height: 600
			windowFlags: 0
			window: windowHolder
			renderer: rendererHolder.
	self assert: success.

	window := windowHolder value.
	renderer := rendererHolder value.
	
	self waitToSee.

	renderer destroy.
	window destroy
]

{ #category : 'tests' }
SDL3WindowTest >> test03BasicRender [

	| window renderer |
	window :=
		sdl
			newWindowTitle: #test03BasicRender
			w: 400 h: 300 flags: 0.
	window assertNotNullReturn.

	renderer := window newRendererFor: nil.
	renderer assertNotNullReturn.

	"Clear background with gray color"
	self assert: (renderer renderDrawColor: Color gray).
	self assert: renderer renderClear.

	"Render a red rectangle"
	self assert: (renderer renderDrawColor: Color red).
	self assert: (renderer renderFillRect: (SDL3FRect x: 10 y: 10 width: 120 height: 30)).

	"Render cyan text (debugging API)"
	self assert: (renderer renderDrawColor: Color cyan).
	self assert: (renderer renderDebugTextX: 20 y: 20 str: 'Hello World').

	"Present will actually render the previous operations"
	self assert: renderer renderPresent.

	self waitToSee.
	
	"Tear down"
	renderer destroy.
	window destroy
]

{ #category : 'tests' }
SDL3WindowTest >> test04TextureFromSurfaceFromForm [

	| window renderer texture shapeForm surface |
	window :=
		sdl
			newWindowTitle: #test04TextureFromSurfaceFromForm
			w: 400 h: 800 flags: 0.
	window assertNotNullReturn.

	renderer := window newRendererFor: nil.
	renderer assertNotNullReturn.

	"Render and present a texture created from a surface created from a Form"
	shapeForm := self iconNamed: #pharoBig.
	surface := shapeForm asUnownedNewSDL3Surface.
	texture := renderer newTextureFromSurface: surface.
	self assert: surface extent equals: 256 @ 256.
	self assert: texture extent equals: 256.0 @ 256.0.
	surface destroy.
	sdl assertSuccess:
		(renderer renderTexture: texture srcrect: nil dstrect: nil).
	sdl assertSuccess: renderer renderPresent.

	self waitToSee.
	
	"Tear down"
	texture destroy.
	renderer destroy.
	window destroy
]

{ #category : 'tests' }
SDL3WindowTest >> test05ShapedWindow [
	"It doesn't seem to work on Mac"

	| window extent shapeForm surface renderer |
	extent := 500 @ 500.
	window :=
		sdl
			newWindowTitle: #test05ShapedWindow
			w: extent x h: extent y
			flags:
				SDL3WindowFlags hidden | 
				SDL3WindowFlags transparent | 
				SDL3WindowFlags borderless.
	window assertNotNullReturn.

	renderer := window newRendererFor: nil.
	renderer assertNotNullReturn.


	shapeForm := Form extent: extent depth: 32.
	shapeForm getCanvas
		fillColor: Color transparent;
		fillOval: (0@0 corner: extent) color: Color blue.
	surface := shapeForm asUnownedNewSDL3Surface.


	window shape: surface.
	window show.


	"Set cyan color"
	sdl assertSuccess: (renderer renderDrawColor: Color cyan).

	"Let's clear with that color"
	sdl assertSuccess: renderer renderClear.

	"Present will actually apply the clear operation"
	sdl assertSuccess: renderer renderPresent.


	self waitToSee.
	
	"Tear down"
	renderer destroy.
	window destroy
]

{ #category : 'tests' }
SDL3WindowTest >> test06Fullscreen [

	| window renderer |
	window :=
		sdl
			newWindowTitle: #test06Fullscreen
			w: 0 h: 0 flags: SDL3WindowFlags fullscreen.
	window assertNotNullReturn.

	renderer := window newRendererFor: nil.
	renderer assertNotNullReturn.

	"Render text (debugging API)"
	renderer
		renderDrawColor: Color white;
		renderDebugTextX: 100 y: 100 str: 'Hello FULLSCREEN'.

	sdl assertSuccess: renderer renderPresent.

	self waitToSee.
	
	"Tear down"
	renderer destroy.
	window destroy
]

{ #category : 'tests' }
SDL3WindowTest >> test07TrayIcons [
	"Note: even if this test creates a window, the API of tray icons doesn't require a window."

	| window iconSurface tray menu clicks menuEntries |
	window := sdl newWindowTitle: #test07TrayIcons w: 300 h: 200 flags: 0.
	window assertNotNullReturn.

	iconSurface := (self iconNamed: #pharo) asUnownedNewSDL3Surface.
	tray := sdl newTrayIcon: iconSurface tooltip: #test07TrayIcons.
	iconSurface destroy.

	clicks := OrderedCollection new.

	menu := tray newMenu.
	menuEntries := (1 to: 10) collect: [ :each |
		| menuEntry |
		menuEntry :=
			menu
				insertTrayEntryAtPos: -1
				label: 'Entry', each asString
				flags: SDL3TrayEntryFlags button.
		menuEntry
			callback: (FFICallback
				signature: #(void (void *userdata, SDL3TrayEntry *entryHolder))
				block: [ :userdata :entryHolder |
					clicks add: (SDL3TrayEntry fromHandle: entryHolder) ])
			userdata: nil.
		menuEntry ].

	menuEntries do: #click. "Simulate clicks"
	
	self waitToSee.

	self assert: clicks size equals: menuEntries size.
	self assert: clicks first label equals: 'Entry1'.
	self assert: clicks last label equals: 'Entry10'.
	
	menuEntries with: clicks do: [ :eachMenuEntry :eachClick |
		self assert: eachMenuEntry getHandle equals: eachClick getHandle ].

	tray destroy.
	window destroy
]

{ #category : 'private' }
SDL3WindowTest >> waitToSee [
	"Perform a wait to consume events and let user visually check the window"

	| endTime |
	endTime := DateAndTime now + self class waitDuration.

	"SDL windows need that events are (regularly?) consumed."	
	[ self consumeEvents. 20 milliSeconds wait ]
		doWhileTrue: [ DateAndTime now < endTime ]
]
