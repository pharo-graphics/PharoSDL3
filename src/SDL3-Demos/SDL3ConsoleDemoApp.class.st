"
I am a specialized `SDL3App` designed for demo applications that require a single window and a standard 2D renderer. I automate the boilerplate of window and renderer creation, making it easier to focus on the demo logic.

### Key Features
- **Window Management**: Automatically creates and manages a single `SDL3Window` instance.
- **2D Rendering**: Creates an `SDL3Renderer` associated with the window.
- **On-screen Console**: Includes an integrated `SDL3Console` for easy on-screen logging using `#log:`.
- **Drawing Convenience**: Provides high-level methods for common tasks like `#clearColor:`, `#color:`, and `#showText:x:y:`.
- **Resource Lifecycle**: Ensures that both the window and its renderer are correctly destroyed when the application closes.

### Customization
Subclasses can customize the initial window state by overriding the following methods:
- `#initialExtent` to set the default window size (default is 1280x720).
- `#initialWindowFlags` to set SDL3 window flags (default includes resizable and input focus).

### Usage
Typically, a subclass only needs to implement:
- `#step`: To handle frame updates and rendering (remember to call `#present` at the end).
- `#handleEvent:` or specific `visit*` methods: To handle user interaction.
"
Class {
	#name : 'SDL3ConsoleDemoApp',
	#superclass : 'SDL3SingleWindowApp',
	#instVars : [
		'renderer',
		'console'
	],
	#category : 'SDL3-Demos-Base',
	#package : 'SDL3-Demos',
	#tag : 'Base'
}

{ #category : 'testing' }
SDL3ConsoleDemoApp class >> isAbstract [

	^ self == SDL3ConsoleDemoApp
]

{ #category : 'renderer' }
SDL3ConsoleDemoApp >> clear [

	renderer renderClear
]

{ #category : 'renderer' }
SDL3ConsoleDemoApp >> clearColor: aColor [

	renderer renderDrawColor: aColor.
	renderer renderClear
]

{ #category : 'lifecycle' }
SDL3ConsoleDemoApp >> close [

	renderer ifNotNil: [
		renderer destroy.
		renderer := nil ].
		
	super close
]

{ #category : 'renderer' }
SDL3ConsoleDemoApp >> color: aColor [

	renderer renderDrawColor: aColor
]

{ #category : 'accessing' }
SDL3ConsoleDemoApp >> console [

	^ console ifNil: [ console := SDL3Console new ]
]

{ #category : 'lifecycle' }
SDL3ConsoleDemoApp >> initializeRenderer [

	renderer := window newRenderer
]

{ #category : 'logging' }
SDL3ConsoleDemoApp >> log: aString [

	self console addLine: aString
]

{ #category : 'lifecycle' }
SDL3ConsoleDemoApp >> open [

	super open.

	self initializeRenderer
]

{ #category : 'renderer' }
SDL3ConsoleDemoApp >> present [

	console ifNotNil: [ console renderOn: renderer ].
	renderer renderPresent
]

{ #category : 'renderer' }
SDL3ConsoleDemoApp >> showText: aString x: x y: y [

	renderer
		renderDebugTextX: x
		y: y
		str: aString
]

{ #category : 'renderer' }
SDL3ConsoleDemoApp >> showText: aString x: x y: y color: aColor [

	renderer renderDrawColor: aColor.
	renderer
		renderDebugTextX: x
		y: y
		str: aString
]
