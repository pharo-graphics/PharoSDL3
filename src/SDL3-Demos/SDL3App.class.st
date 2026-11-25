"
I am an abstract base class for SDL3 demo applications. I provide a consistent lifecycle and event-handling framework to simplify the creation of interactive SDL3 examples in Pharo.

I manage the core SDL3 components, including:
- The `SDL3Library` unique instance.
- An `SDL3MainLoop` to drive the application.
- An `SDL3EventMap` for efficient event dispatching.
- A `quitRequested` flag for graceful termination.

### Event Handling
I use the Visitor design pattern (`TSDL3HierarchicalEventVisitor`) to process SDL3 events. Subclasses can override specific `visit*` methods (e.g., `visitKeyboardDownEvent:`, `visitMouseMotionEvent:`) to implement their logic. By default, I handle:
- `ESCAPE` key: Requests the application to stop.
- `Quit` event: Requests the application to stop.

### Lifecycle Hooks
Subclasses should utilize the following template methods:
- `subsystemInitFlags`: Override to specify which SDL3 subsystems to initialize (default is `SDL_INIT_VIDEO`).
- `setUp`: Sent just before the main loop begins. Ideal for resource initialization (windows, renderers, shaders).
- `step`: Sent on every frame. Use this for simulation updates or rendering triggers.
- `tearDown`: Final cleanup hook sent after the main loop terminates and before resources are disposed.

### Execution Modes
I support two ways of running:
1. `run`: Synchronous execution on the current thread. This is mandatory for macOS UI applications where the main thread must poll events.
2. `start`: Asynchronous execution. It forks a background process to run the event loop.
"
Class {
	#name : 'SDL3App',
	#superclass : 'Object',
	#traits : 'TSDL3HierarchicalEventVisitor',
	#classTraits : 'TSDL3HierarchicalEventVisitor classTrait',
	#instVars : [
		'sdl',
		'loop',
		'eventMap',
		'event',
		'keybindings'
	],
	#pools : [
		'SDL3AllEnumerations'
	],
	#category : 'SDL3-Demos-Base',
	#package : 'SDL3-Demos',
	#tag : 'Base'
}

{ #category : 'event handling' }
SDL3App >> bindKey: aKeycode description: aString action: aBlock [

	keybindings add: (SDL3KeyBinding
		key: aKeycode
		description: aString
		action: aBlock)
]

{ #category : 'event handling' }
SDL3App >> bindingFor: aKeycodeOrInteger [

	^ keybindings detect: [ :each | each matchesKey: aKeycodeOrInteger ]
]

{ #category : 'event handling' }
SDL3App >> bindingFor: aKeycodeOrInteger ifFound: aBlock [

	keybindings
		detect: [ :each | each matchesKey: aKeycodeOrInteger ]
		ifFound: aBlock
]

{ #category : 'events' }
SDL3App >> handleEvent: aSDL3MappedEvent [

	aSDL3MappedEvent accept: self
]

{ #category : 'events' }
SDL3App >> handleEvents [

	[ sdl pollEvent: event ] whileTrue: [
		self handleEvent: (eventMap value: event) ]
]

{ #category : 'initialization' }
SDL3App >> initialize [

	super initialize.
	sdl := SDL3Library uniqueInstance.
	eventMap := SDL3EventMap new.
	event := SDL_Event new.
	keybindings := OrderedCollection new.
	self initializeKeybindings.
	loop :=
		SDL3CappedLoop new
			hertz: 60;
			stepBlock: [ :deltaUS | self mainStep ];
			yourself
]

{ #category : 'initialization' }
SDL3App >> initializeKeybindings [

	self
		bindKey: SDLK_ESCAPE
		description: 'Quit application'
		action: [ loop requestQuit ]
]

{ #category : 'accessing' }
SDL3App >> keybindings [

	^ keybindings
]

{ #category : 'accessing' }
SDL3App >> loop [

	^ loop
]

{ #category : 'hooks' }
SDL3App >> mainStep [

	self handleEvents.
	self step
]

{ #category : 'printing' }
SDL3App >> printControlsBannerOn: aStream [

	aStream
		nextPutAll: self className;
		lf;
		nextPutAll: (String new: 45 withAll: $=);
		lf.
	(self class hasComment and: [ self class comment trim isNotEmpty ]) ifTrue: [
		self class comment trim lines do: [ :line |
			aStream nextPutAll: line; lf ].
		aStream lf ].
	keybindings ifNotEmpty: [
		aStream
			nextPutAll: 'Key bindings:';
			lf.
		keybindings do: [ :each |
			aStream
				nextPutAll: '- ';
				nextPutAll: ('[' , each keyName , ']' padRightTo: 14);
				nextPutAll: each description;
				lf ] ].
	aStream
		nextPutAll: (String new: 45 withAll: $=);
		lf;
		lf
]

{ #category : 'printing' }
SDL3App >> printPerformanceSummaryOn: aStream [

	loop frameCount > 0 ifFalse: [ ^ self ].

	aStream
		nextPutAll: self className;
		nextPutAll: ' Performance Summary:';
		lf;
		nextPutAll: ('- Total frames: {1}' format: { loop frameCount });
		lf;
		nextPutAll: ('- Average FPS:  {1} ({2}% idle)' format: {
			loop fps printShowingDecimalPlaces: 1.
			loop idleHeadroomPercentage rounded });
		lf;
		lf
]

{ #category : 'lifecycle' }
SDL3App >> run [

	self sdlInit.
	[ DiScope during: [ [
		self setUp.
		loop start ] ensure: [
		self tearDown ] ] ] ensure: [
		self sdlQuit ]
]

{ #category : 'lifecycle' }
SDL3App >> runForSeconds: aNumber [
	"Run the app and automatically quit after a number of seconds.
	Useful for CI smoke testing where no user interaction is available."

	[ (Delay forSeconds: aNumber) wait. loop requestQuit ]
		forkAt: Processor userInterruptPriority.

	self run
]

{ #category : 'lifecycle' }
SDL3App >> sdlInit [

	sdl setLogPriorities: SDL_LOG_PRIORITY_TRACE.

	self assert: (sdl initSubSystem: self subsystemInitFlags)
]

{ #category : 'lifecycle' }
SDL3App >> sdlQuit [
	
	sdl quit
]

{ #category : 'lifecycle' }
SDL3App >> setUp [
	"Hook for subclasses to open windows and acquire resources before the main loop."

	self printControlsBannerOn: Stdio stdout
]

{ #category : 'hooks' }
SDL3App >> step [
]

{ #category : 'hooks' }
SDL3App >> subsystemInitFlags [

	^ SDL_INIT_VIDEO
]

{ #category : 'lifecycle' }
SDL3App >> tearDown [
	"Hook for subclasses to perform custom teardown before resources are disposed"

	self printPerformanceSummaryOn: Stdio stdout
]

{ #category : 'visiting - concrete' }
SDL3App >> visitKeyboardDownEvent: aKeyboardDownEvent [

	self
		bindingFor: aKeyboardDownEvent key
		ifFound: [ :binding | binding executeWithEvent: aKeyboardDownEvent ].

	^ self visitKeyboardEvent: aKeyboardDownEvent
]

{ #category : 'visiting - concrete' }
SDL3App >> visitQuitEvent: aQuitEvent [

	loop requestQuit.
	
	^ self visitMappedEvent: aQuitEvent
]
