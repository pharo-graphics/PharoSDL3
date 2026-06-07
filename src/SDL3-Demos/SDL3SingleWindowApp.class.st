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

{ #category : 'lifecycle' }
SDL3SingleWindowApp >> close [

	window ifNotNil: [
		window destroy.
		window := nil ].
		
	super close
]

{ #category : 'accessing' }
SDL3SingleWindowApp >> initialExtent [

	^ 1280 @ 720
]

{ #category : 'accessing' }
SDL3SingleWindowApp >> initialWindowFlags [

	^ SDL_WINDOW_RESIZABLE | SDL_WINDOW_INPUT_FOCUS
]

{ #category : 'lifecycle' }
SDL3SingleWindowApp >> open [

	window :=
		SDL3Window
			unsafeNewTitle: self updatedTitle
			w: self initialExtent x
			h: self initialExtent y
			flags: self initialWindowFlags.
]

{ #category : 'lifecycle' }
SDL3SingleWindowApp >> prepareToLoop [

	self open.
	super prepareToLoop
]

{ #category : 'private' }
SDL3SingleWindowApp >> updateTitle [

	window title: self updatedTitle
]

{ #category : 'accessing' }
SDL3SingleWindowApp >> updatedTitle [

	^ self className, ' - ESC to quit'
]
