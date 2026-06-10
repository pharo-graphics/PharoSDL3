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
	./pharo Pharo.image eval 'SDL3WindowTest waitDuration: 7 seconds. SDL3WindowTest run: #test12ShapedWindow'

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
		SDL3Window
			unsafeNewTitle: #test01CreateWindow
			w: 400 h: 300 flags: 0.

	self assert: window title equals: #test01CreateWindow.

	self assert: window extent equals: 400 @ 300.
	self assert: window width equals: 400.
	self assert: window height equals: 300.
	self assert: window displayScale > 0.0.
	self assert: window pixelDensity > 0.0.
	self assert: window isBordered.
	self deny: window isMaximized.
	self deny: window isMinimized.
	self deny: window isFullscreen.
	self deny: window isHidden.
	self deny: window isKeyboardGrabbed.
	self deny: window isMouseGrabbed.
	self deny: window isRelativeMouseMode.
	self deny: window isScreenKeyboardShown.
	self deny: window isTextInputActive.

	self waitToSee.

	window destroy
]

{ #category : 'tests' }
SDL3WindowTest >> test02AllWindows [

	| windows |
	windows := (1 to: 5) collect: [ :index |
		SDL3Window
			unsafeNewTitle: index asString
			w: 300 h: 300 flags: 0 ].

	"The query seems to return last window first"
	self assert: sdl allWindows equals: windows reversed.

	"Tear down"
	windows do: #destroy
]

{ #category : 'tests' }
SDL3WindowTest >> test03CreateWindowWithProperties [

	| rectangle id window |
	rectangle := 100 @ 200 extent: 600 @ 300.

	id := sdl newProperties.
	sdl
		setStringPropertyProps: id
		name: SDL_PROP_WINDOW_CREATE_TITLE_STRING
		value: #test03CreateWindowWithProperties.
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

	self assert: window title equals: #test03CreateWindowWithProperties asString.
	self assert: window position equals: rectangle origin.
	self assert: window extent equals: rectangle extent.
	self assert: window isHighPixelDensity.
	self assert: window isResizable.
	self deny: window isMouseCaptured.

	"Tear down"
	window destroy
]

{ #category : 'tests' }
SDL3WindowTest >> test04CreateWindowWithPropertyGroup [

	| rectangle p window |
	rectangle := 100 @ 200 extent: 600 @ 300.

	p := SDL3PropertyGroup unsafeNew
		stringAt: SDL_PROP_WINDOW_CREATE_TITLE_STRING
			put: #test04CreateWindowWithPropertyGroup;
		numberAt: SDL_PROP_WINDOW_CREATE_X_NUMBER
			put: rectangle left;
		numberAt: SDL_PROP_WINDOW_CREATE_Y_NUMBER
			put: rectangle top;
		numberAt: SDL_PROP_WINDOW_CREATE_WIDTH_NUMBER
			put: rectangle width;
		numberAt: SDL_PROP_WINDOW_CREATE_HEIGHT_NUMBER
			put: rectangle height;
		numberAt: SDL_PROP_WINDOW_CREATE_FLAGS_NUMBER
			put: SDL_WINDOW_HIGH_PIXEL_DENSITY | SDL_WINDOW_RESIZABLE;
		yourself.

	window := SDL3Window unsafeNewWithProperties: p.
	p destroy.

	self waitToSee.

	self assert: window title equals: #test04CreateWindowWithPropertyGroup asString.
	self assert: window position equals: rectangle origin.
	self assert: window extent equals: rectangle extent.
	self assert: window isHighPixelDensity.
	self assert: window isResizable.
	self deny: window isMouseCaptured.

	"Tear down"
	window destroy
]

{ #category : 'tests' }
SDL3WindowTest >> test05CreateWindowAndRenderer [

	| windowHolder rendererHolder extent window renderer success |
	windowHolder := (FFIExternalValueHolder ofType: SDL3Window) new.
	rendererHolder := (FFIExternalValueHolder ofType: SDL3Renderer) new.
	extent := 400 @ 300.

	success :=
		sdl
			newWindowAndRendererTitle: #test05CreateWindowAndRenderer
			width: extent x
			height: extent y
			windowFlags: 0
			window: windowHolder
			renderer: rendererHolder.
	self assert: success.

	window := windowHolder value.
	renderer := rendererHolder value.

	self waitToSee.

	self assert: renderer renderTargetOrNil isNil.
	self deny: renderer isRenderClipEnabled.
	self deny: renderer isRenderViewportSet.

	"We don't worry about pixel density since we didn't add High-DPI flag"
	self assert: renderer scale equals: 1.0 @ 1.0.
	self assert: renderer outputExtent equals: extent.
	self assert: window pixelExtent equals: extent.
	self assert: window extent equals: extent.

	renderer destroy.
	window destroy
]

{ #category : 'tests' }
SDL3WindowTest >> test06CreateRenderer [

	| window renderer drivers |
	window :=
		SDL3Window
			unsafeNewTitle: #test06CreateRenderer
			w: 400 h: 300 flags: 0.

	drivers := sdl renderDrivers.

	self denyEmpty: drivers.
	self timeLimit: (drivers size * 10) seconds.

	"GL/GLES fail on CI's win/mac"
	(drivers first: 2) do: [ :eachName |
		window title: ('<1s> - <2s>'
			expandMacrosWith: #test06CreateRenderer
			with: eachName).

		renderer := window newRendererFor: eachName.

		self waitToSee.
		
		renderer destroy ].

	window destroy
]

{ #category : 'tests' }
SDL3WindowTest >> test07RenderBasicOperations [

	| window renderer |
	window :=
		SDL3Window
			unsafeNewTitle: #test07RenderBasicOperations
			w: 400 h: 300 flags: 0.

	"Create the default renderer"
	renderer := window newRenderer.

	"Clear background with gray color"
	renderer renderDrawColor: Color gray.
	renderer renderClear.

	"Render a red rectangle"
	renderer renderDrawColor: Color red.
	renderer renderFillRect: (SDL3FRect x: 10 y: 10 width: 120 height: 30).

	"Render cyan text (debugging API)"
	renderer renderDrawColor: Color cyan.
	renderer renderDebugTextX: 20 y: 20 str: 'Hello World'.

	"Present will actually render the previous operations"
	renderer renderPresent.

	self waitToSee.
	
	"Tear down"
	renderer destroy.
	window destroy
]

{ #category : 'tests' }
SDL3WindowTest >> test08RenderTextureFromSurfaceFromForm [

	| window renderer texture form surface |
	window :=
		SDL3Window
			unsafeNewTitle: #test08RenderTextureFromSurfaceFromForm
			w: 400 h: 800 flags: 0.

	renderer := window newRenderer.

	"Render and present a texture created from a surface created from a Form"

	form := self iconNamed: #pharoBig.
	surface := form asUnownedNewSDL3Surface.
	texture := renderer newTextureFromSurface: surface.
	self assert: surface extent equals: 256 @ 256.
	self assert: texture extent equals: 256.0 @ 256.0.
	self assert: texture paletteOrNil isNil.
	surface destroy.
	renderer renderTexture: texture srcrect: nil dstrect: nil.
	renderer renderPresent.

	self waitToSee.
	
	"Tear down"
	texture destroy.
	renderer destroy.
	window destroy
]

{ #category : 'tests' }
SDL3WindowTest >> test09Bordered [

	| window renderer |
	window :=
		SDL3Window
			unsafeNewTitle: #test09Bordered
			w: 800 h: 600 flags: SDL3WindowFlags borderless.

	renderer := window newRenderer.

	renderer renderDrawColor: Color white.
	renderer
		renderDebugTextX: 20 y: 20
			str: ('<1s>: <2p>' expandMacrosWith: #isBordered with: window isBordered);
		renderPresent.
	self waitToSee.
	self deny: window isBordered.

	window bordered: true.
	renderer
		renderDebugTextX: 20 y: 40
			str: ('<1s>: <2p>' expandMacrosWith: #isBordered with: window isBordered);
		renderPresent.
	self waitToSee.
	self assert: window isBordered.

	window destroy
]

{ #category : 'tests' }
SDL3WindowTest >> test10Hidden [

	| window |
	window :=
		SDL3Window
			unsafeNewTitle: #test10Hidden
			w: 800 h: 600 flags: SDL3WindowFlags hidden.

	self assert: window isHidden.
	self waitToSee.
	window show.
	self deny: window isHidden.

	window destroy
]

{ #category : 'tests' }
SDL3WindowTest >> test11Fullscreen [

	| window renderer |
	window :=
		SDL3Window
			unsafeNewTitle: #test11Fullscreen
			w: 0 h: 0 flags: SDL3WindowFlags fullscreen.

	renderer := window newRenderer.

	renderer renderDrawColor: Color white.
	renderer
		renderDebugTextX: 20 y: 20
			str: ('<1s>: <2p>' expandMacrosWith: #isFullscreen with: window isFullscreen);
		renderPresent.

	self waitToSee.
	window sync.
	self assert: window isFullscreen.
	
	window fullscreen: false.
	renderer
		renderDebugTextX: 20 y: 40
			str: ('<1s>: <2p>' expandMacrosWith: #isFullscreen with: window isFullscreen);
		renderPresent.
	self waitToSee.
	self deny: window isFullscreen.

	"Tear down"
	renderer destroy.
	window destroy
]

{ #category : 'tests' }
SDL3WindowTest >> test12ShapedWindow [

	| window extent shapeForm surface renderer texture |
	extent := 500 @ 500.
	window :=
		SDL3Window
			unsafeNewTitle: #test12ShapedWindow
			w: extent x h: extent y
			flags:
				SDL3WindowFlags hidden | SDL3WindowFlags transparent
				| SDL3WindowFlags borderless.

	self assert: window isTransparent.
	renderer := window newRenderer.

	shapeForm := Form extent: extent depth: 32.
	shapeForm getCanvas
		fillColor: Color transparent;
		fillOval: (0@0 corner: extent) color: Color blue.
	surface := shapeForm asUnownedNewSDL3Surface.
	window shape: surface.
	"Surface can be destroyed, as it was copied by SDL"
	surface destroy.

	window show.
	renderer renderDrawColor: Color blue darker.
	renderer renderClear.
	renderer renderDrawColor: Color yellow.
	renderer renderDebugTextX: extent x / 2 y: 20 str: 'TOP'.
	renderer renderDebugTextX: extent x / 2 y: extent y - 20 str: 'BOTTOM'.
	renderer renderDebugTextX: 20 y: extent y / 2 str: 'LEFT'.
	renderer renderDebugTextX: extent x - 40 y: extent y / 2 str: 'RIGHT'.
	renderer renderPresent.
	self waitToSee.

	"Change shape and render the icon"
	shapeForm := self iconNamed: #pharoBig.
	surface := shapeForm asUnownedNewSDL3Surface.
	texture := renderer newTextureFromSurface: surface.
	window shape: surface.
	surface destroy.
	renderer renderTexture: texture srcrect: nil dstrect: nil.
	renderer renderPresent.
	self waitToSee.
	
	"Tear down"
	renderer destroy.
	window destroy
]

{ #category : 'tests' }
SDL3WindowTest >> test13CocoaWindowPointer [

	| window cocoaPointer |
	OSPlatform current isMacOS ifFalse: [ ^ self skip ].

	window :=
		SDL3Window
			unsafeNewTitle: #test13CocoaWindowPointer
			w: 800 h: 600 flags: SDL3WindowFlags borderless.

	cocoaPointer := window propertyGroup pointerAt: SDL_PROP_WINDOW_COCOA_WINDOW_POINTER ifAbsent: nil.

	self deny: cocoaPointer isNull.

	window destroy
]

{ #category : 'tests' }
SDL3WindowTest >> test14Utility [

	| window |
	window :=
		SDL3Window
			unsafeNewTitle: #test14Utility
			w: 400 h: 300 flags: SDL3WindowFlags utility.

	self assert: window isUtility.
	self waitToSee.

	window destroy
]

{ #category : 'tests' }
SDL3WindowTest >> test15AlwaysOnTop [

	| window |
	window :=
		SDL3Window
			unsafeNewTitle: #test15AlwaysOnTop
			w: 400 h: 300 flags: 0.

	self deny: window isAlwaysOnTop.
	self waitToSee.

	window alwaysOnTopOnTop: true.
	self assert: window isAlwaysOnTop.
	self waitToSee.

	window alwaysOnTopOnTop: false.
	self deny: window isAlwaysOnTop.
	self waitToSee.

	window destroy
]

{ #category : 'tests' }
SDL3WindowTest >> test16Modal [

	| parent child |
	parent :=
		SDL3Window
			unsafeNewTitle: #test16Modal
			w: 600 h: 400 flags: 0.

	child :=
		SDL3Window
			unsafeNewTitle: #test16ModalChild
			w: 300 h: 200 flags: 0.

	child parent: parent.
	self assert: child parentOrNil equals: parent.

	child modal: true.
	self assert: child isModal.
	self waitToSee.

	child modal: false.
	self deny: child isModal.
	self waitToSee.

	child destroy.
	parent destroy
]

{ #category : 'tests' }
SDL3WindowTest >> test17Popup [

	| parent popup |
	parent :=
		SDL3Window
			unsafeNewTitle: #test17Popup
			w: 600 h: 400 flags: 0.

	popup :=
		SDL3Window
			unsafeNewPopupParent: parent
			offsetX: 50
			offsetY: 50
			w: 200
			h: 100
			flags: SDL3WindowFlags tooltip.

	self assert: popup parentOrNil equals: parent.
	self assert: popup isTooltip.
	
	"Popup position is relative to parent"
	self assert: popup position equals: 50 @ 50.

	self waitToSee.

	popup destroy.
	parent destroy
]

{ #category : 'tests' }
SDL3WindowTest >> test18PopupMenu [

	| parent popup |
	parent :=
		SDL3Window
			unsafeNewTitle: #test18PopupMenu
			w: 600 h: 400 flags: 0.

	popup :=
		SDL3Window
			unsafeNewPopupParent: parent
			offsetX: 100
			offsetY: 100
			w: 200
			h: 150
			flags: SDL3WindowFlags popupMenu.

	self assert: popup parentOrNil equals: parent.
	self assert: popup isPopupMenu.
	
	self waitToSee.

	popup destroy.
	parent destroy
]

{ #category : 'tests' }
SDL3WindowTest >> test19Occluded [

	| extent windowA windowB |
	extent := 400 @ 300.
	windowA :=
		SDL3Window
			unsafeNewTitle: #test19Occluded
			w: extent x h: extent y flags: 0.

	"Usually a newly created visible window is not occluded, unless it's completely covered by another app"
	self deny: windowA isOccluded.
	self waitToSee.

	"B's extent = 2 * A's extent"
	windowB :=
		SDL3Window
			unsafeNewTitle: #test19Occluded
			w: extent x * 2 h: extent y * 2 flags: 0.

	"Ensure B is positioned to fully occlude A"
	windowB position: windowA position - (extent x // 4).

	self waitToSee.
	self deny: windowB isOccluded.
	self assert: windowA isOccluded.

	windowB destroy.
	windowA destroy
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
