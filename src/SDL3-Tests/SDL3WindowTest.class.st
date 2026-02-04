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
SDL3WindowTest class >> waitDuration [

	^ waitDuration ifNil: [ 1 seconds ]
]

{ #category : 'accessing' }
SDL3WindowTest class >> waitDuration: aDuration [
	"Establish how much time to wait to see on tests.

	Run a specific test:
	./pharo Pharo.image eval 'SDL3VideoTest waitDuration: 7 seconds. SDL3VideoTest run: #test06ShapedWindow'

	Run whole suite:
	./pharo Pharo.image eval 'SDL3VideoTest waitDuration: 7 seconds. SDL3VideoTest suite run'
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
	sdl assertSuccess: window.

	self assert: window extent equals: 800 @ 600.

	self waitToSee.

	window destroy
]

{ #category : 'tests' }
SDL3WindowTest >> test02CreateWindowAndRenderer [

	| windowPointer rendererPointer window renderer success |
	windowPointer := (FFIExternalValueHolder ofType: SDL3Window) new.
	rendererPointer := (FFIExternalValueHolder ofType: SDL3Renderer) new.

	success :=
		sdl
			newWindowAndRendererTitle: #test02CreateWindowAndRenderer
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
SDL3WindowTest >> test03BasicRender [

	| window renderer |
	window :=
		sdl
			newWindowTitle: #test03BasicRender
			w: 400 h: 300 flags: 0.
	sdl assertSuccess: window.

	renderer := window newRendererFor: nil.
	sdl assertSuccess: renderer.

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
SDL3WindowTest >> test04TextureFromSurfaceFromForm [

	| window renderer texture shapeForm surface |
	window :=
		sdl
			newWindowTitle: #test04TextureFromSurfaceFromForm
			w: 400 h: 800 flags: 0.
	sdl assertSuccess: window.
	renderer := window newRendererFor: nil.
	sdl assertSuccess: renderer.

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

	| success window extent shapeForm surface renderer |
	extent := 500 @ 500.
	window :=
		sdl
			newWindowTitle: #test05ShapedWindow
			w: extent x h: extent y
			flags:
				SDL3WindowFlags hidden | 
				SDL3WindowFlags transparent | 
				SDL3WindowFlags borderless.
	sdl assertSuccess: window.

	renderer := window newRendererFor: nil.
	sdl assertSuccess: renderer.


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
SDL3WindowTest >> test06Fullscreen [

	| window renderer |
	window :=
		sdl
			newWindowTitle: #test06Fullscreen
			w: 0 h: 0 flags: SDL3WindowFlags fullscreen.
	sdl assertSuccess: window.
	renderer := window newRendererFor: nil.
	sdl assertSuccess: renderer.

	"Render text (debugging API)"
	renderer
		renderDrawColorFloatR: 1.0 g: 1.0 b: 1.0 a: 1.0;
		renderDebugTextX: 100 y: 100 str: 'Hello FULLSCREEN'.

	sdl assertSuccess: renderer renderPresent.

	self waitToSee.
	
	"Tear down"
	renderer destroy.
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
