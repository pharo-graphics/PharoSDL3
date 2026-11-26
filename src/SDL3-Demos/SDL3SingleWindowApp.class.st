"
I am a specialized `SDL3App` designed for demo applications that require a single window. I automate the boilerplate of window creation, making it easier to focus on the demo logic.

Subclasses can customize the initial window state by overriding the following methods:
- `#initialExtent` to set the default window size (default is 1280x720).
- `#initialWindowFlags` to set SDL3 window flags (default includes resizable and input focus)
"
Class {
	#name : 'SDL3SingleWindowApp',
	#superclass : 'SDL3App',
	#instVars : [
		'window'
	],
	#category : 'SDL3-Demos-Base',
	#package : 'SDL3-Demos',
	#tag : 'Base'
}

{ #category : 'testing' }
SDL3SingleWindowApp class >> isAbstract [

	^ self == SDL3SingleWindowApp
]

{ #category : 'pacing' }
SDL3SingleWindowApp >> applyPacer [
	"Hook for subclasses to configure renderers or swapchains when the pacer is initialized or toggled."
]

{ #category : 'accessing' }
SDL3SingleWindowApp >> initialExtent [

	^ 1280 @ 720
]

{ #category : 'accessing' }
SDL3SingleWindowApp >> initialWindowFlags [

	^ SDL_WINDOW_RESIZABLE | SDL_WINDOW_INPUT_FOCUS
]

{ #category : 'initialization' }
SDL3SingleWindowApp >> initialize [

	super initialize.
	loop pacer: SDL3VSyncPacer new
]

{ #category : 'initialization' }
SDL3SingleWindowApp >> initializeKeybindings [

	self
		bindKey: SDLK_V
		description: 'Toggle frame pacer (VSync / Cooperative)'
		action: [ self togglePacer ].
	super initializeKeybindings
]

{ #category : 'accessing' }
SDL3SingleWindowApp >> pacer [

	^ loop pacer
]

{ #category : 'pacing' }
SDL3SingleWindowApp >> pacer: aFramePacer [

	loop pacer: aFramePacer.
	self applyPacer.
	self updateTitle
]

{ #category : 'lifecycle' }
SDL3SingleWindowApp >> setUp [

	super setUp.

	DiScope own: (window :=
		SDL3Window
			unownedNewTitle: self updatedTitle
			width: self initialExtent x
			height: self initialExtent y
			flags: self initialWindowFlags)
]

{ #category : 'pacing' }
SDL3SingleWindowApp >> togglePacer [

	self pacer: self pacer toggled
]

{ #category : 'private' }
SDL3SingleWindowApp >> updateTitle [

	window ifNotNil: [ window title: self updatedTitle ]
]

{ #category : 'accessing' }
SDL3SingleWindowApp >> updatedTitle [

	^ '{1} [{2}]' format: {
		self className.
		self pacer shortName }
]

{ #category : 'visiting - concrete' }
SDL3SingleWindowApp >> visitKeyboardDownEvent: aKeyboardDownEvent [

	super visitKeyboardDownEvent: aKeyboardDownEvent.
	self updateTitle
]

{ #category : 'visiting - concrete' }
SDL3SingleWindowApp >> visitWindowCloseRequestedEvent: aWindowEvent [

	"Quit if user clicked on main window's close"
	aWindowEvent windowID = window id ifTrue: [ loop requestQuit ].

	super visitWindowCloseRequestedEvent: aWindowEvent
]

{ #category : 'accessing' }
SDL3SingleWindowApp >> window [

	^ window
]
