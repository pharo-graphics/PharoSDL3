Class {
	#name : 'SDL3WindowTest',
	#superclass : 'SDL3Test',
	#pools : [
		'SDL3ZConstants'
	],
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

	self
		assert: (sdl initSubSystem: SDL3InitFlags video)
		description: 'Initialize video subsystem'
]

{ #category : 'tests' }
SDL3WindowTest >> test01CreateWindow [

	| window |
	window :=
		sdl
			newWindowTitle: #test01CreateWindow
			w: 800 h: 600 flags: 0.
	window assertNotNullReturn.

	self assert: window title equals: #test01CreateWindow.
	self assert: window extent equals: 800 @ 600.
	self assert: window displayScale > 0.0.
	self assert: window pixelDensity > 0.0.
	self assert: window isBordered.
	self deny: window isFullscreen.
	self deny: window isKeyboardGrabbed.
	self deny: window isMouseGrabbed.
	self deny: window isRelativeMouseMode.
	self deny: window isScreenKeyboardShown.
	self deny: window isTextInputActive.

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

	self assert: renderer outputExtent equals: 400@300.

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
		renderDebugTextX: 100 y: 100 str: 'Hello FULLSCREEN';
		renderPresent.

	self waitToSee.
	self assert: window isFullscreen description: #isFullscreen.
	
	window fullscreen: false.
	renderer
		renderDebugTextX: 100 y: 100 str: 'Good bye FULLSCREEN';
		renderPresent.
	self waitToSee.
	self deny: window isFullscreen description: #isFullscreen.

	"Tear down"
	renderer destroy.
	window destroy
]

{ #category : 'tests' }
SDL3WindowTest >> test07AllWindows [

	| windows |
	windows := (1 to: 5) collect: [ :index |
		sdl
			newWindowTitle: index asString
			w: 300 h: 300 flags: 0 ].

	"The query seems to return last window first"
	self assert: sdl allWindows equals: windows reversed.

	"Tear down"
	windows do: #destroy
]

{ #category : 'tests' }
SDL3WindowTest >> test08CreateWindowWithProperties [

	| rectangle id window |
	rectangle := 100 @ 200 extent: 300 @ 400.

	id := sdl newProperties.
	sdl
		setStringPropertyProps: id
		name: SDL_PROP_WINDOW_CREATE_TITLE_STRING
		value: #test08CreateWindowWithProperties.
	sdl
		setNumberPropertyProps: id
		name: SDL_PROP_WINDOW_CREATE_X_NUMBER
		value: rectangle left.
	sdl
		setNumberPropertyProps: id
		name: SDL_PROP_WINDOW_CREATE_Y_NUMBER
		value: rectangle top.
	sdl
		setNumberPropertyProps: id
		name: SDL_PROP_WINDOW_CREATE_WIDTH_NUMBER
		value: rectangle width.
	sdl
		setNumberPropertyProps: id
		name: SDL_PROP_WINDOW_CREATE_HEIGHT_NUMBER
		value: rectangle height.
	sdl
		setNumberPropertyProps: id
		name: SDL_PROP_WINDOW_CREATE_FLAGS_NUMBER
		value: SDL3WindowFlags highPixelDensity | SDL3WindowFlags resizable.

	window := sdl newWindowWithProperties: id.
	sdl destroyProperties: id.

	self waitToSee.

	self assert: window title equals: #test08CreateWindowWithProperties asString.
	self assert: window position equals: rectangle origin.
	self assert: window extent equals: rectangle extent.
	self deny: (SDL3WindowFlags highPixelDensity & window flags) equals: 0.
	self deny: (SDL3WindowFlags resizable & window flags) equals: 0.
	self assert: (SDL3WindowFlags mouseCapture & window flags) equals: 0.

	"Tear down"
	window destroy
]

{ #category : 'tests' }
SDL3WindowTest >> test08bCreateWindowWithPropertyGroup [

	| rectangle p window |
	rectangle := 100 @ 200 extent: 300 @ 400.

	p := sdl newPropertyGroup
		stringAt: SDL_PROP_WINDOW_CREATE_TITLE_STRING
			put: #test08CreateWindowWithProperties;
		numberAt: SDL_PROP_WINDOW_CREATE_X_NUMBER
			put: rectangle left;
		numberAt: SDL_PROP_WINDOW_CREATE_Y_NUMBER
			put: rectangle top;
		numberAt: SDL_PROP_WINDOW_CREATE_WIDTH_NUMBER
			put: rectangle width;
		numberAt: SDL_PROP_WINDOW_CREATE_HEIGHT_NUMBER
			put: rectangle height;
		numberAt: SDL_PROP_WINDOW_CREATE_FLAGS_NUMBER
			put: SDL3WindowFlags highPixelDensity | SDL3WindowFlags resizable;
		yourself.

	window := sdl newWindowWithProperties: p.
	p destroy.

	self waitToSee.

	self assert: window title equals: #test08CreateWindowWithProperties asString.
	self assert: window position equals: rectangle origin.
	self assert: window extent equals: rectangle extent.
	self deny: (SDL3WindowFlags highPixelDensity & window flags) equals: 0.
	self deny: (SDL3WindowFlags resizable & window flags) equals: 0.
	self assert: (SDL3WindowFlags mouseCapture & window flags) equals: 0.

	"Tear down"
	window destroy
]

{ #category : 'tests' }
SDL3WindowTest >> test09Bordered [

	| window |
	window :=
		sdl
			newWindowTitle: #test01CreateWindow
			w: 800 h: 600 flags: SDL3WindowFlags borderless.
	window assertNotNullReturn.

	self deny: window isBordered description: #isBordered.

	self waitToSee.
	window bordered: true.
	self waitToSee.
	
	self assert: window isBordered description: #isBordered.

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
