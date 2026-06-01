"
I am an abstract base class for SDL3 demo applications. I provide a consistent lifecycle and event-handling framework to simplify the creation of interactive SDL3 examples in Pharo.

I manage the core SDL3 components, including:
- The `LibSDL3` unique instance.
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
- `loopWillStart`: Called just before the main loop begins. Ideal for resource initialization (windows, renderers, shaders).
- `step`: Called on every frame. Use this for simulation updates or rendering triggers.
- `loopStopped`: Called after the main loop terminates.
- `close`: Final cleanup hook.

### Execution Modes
I support two ways of running:
1. `run`: Synchronous execution on the current thread. This is mandatory for macOS UI applications where the main thread must poll events.
2. `start`: Asynchronous execution. It forks a background process to run the event loop.

### Logging
By default, I enable `SDL_LOG_PRIORITY_TRACE` in `startNoLoop` to provide detailed debugging information in the console.
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
		'event'
	],
	#pools : [
		'SDL3AllEnumerations'
	],
	#category : 'SDL3-Demos-Base',
	#package : 'SDL3-Demos',
	#tag : 'Base'
}

{ #category : 'lifecycle' }
SDL3App >> close [
	"Template method for cleanup. Subclasses should override and call super close."
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

	sdl := LibSDL3 uniqueInstance.
	eventMap := SDL3EventMap new.
	event := SDL_Event new.

	loop := SDL3CappedLoop new.
	loop
		hertz: 60;
		object: self;
		selector: #mainStep
]

{ #category : 'hooks' }
SDL3App >> mainStep [

	self handleEvents.
	self step
]

{ #category : 'lifecycle' }
SDL3App >> prepareToLoop [
	"Prepare the app before starting the main loop"
]

{ #category : 'lifecycle' }
SDL3App >> run [

	self sdlInit.
	self prepareToLoop.

	loop start.

	self close.
	self sdlQuit
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

{ #category : 'hooks' }
SDL3App >> step [
]

{ #category : 'hooks' }
SDL3App >> subsystemInitFlags [

	^ SDL_INIT_VIDEO
]

{ #category : 'hooks' }
SDL3App >> visitKeyboardDownEvent: aKeyboardDownEvent [

	aKeyboardDownEvent key = SDLK_ESCAPE asInteger ifTrue: [ loop requestQuit ]
]

{ #category : 'hooks' }
SDL3App >> visitQuitEvent: aQuitEvent [

	loop requestQuit
]
