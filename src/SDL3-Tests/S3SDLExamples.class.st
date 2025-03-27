Class {
	#name : 'S3SDLExamples',
	#superclass : 'Object',
	#instVars : [
		'window',
		'renderer',
		'lib',
		'event',
		'map'
	],
	#category : 'SDL3-Tests-Library',
	#package : 'SDL3-Tests',
	#tag : 'Library'
}

{ #category : 'examples' }
S3SDLExamples class >> example01ColorWheel [

	| demo |
	demo := self new.

	demo ensureInitVideo; open.

	(Color wheel: 20) do: [ :each |
		demo
			clearColor: each;
			present.
		0.1 seconds wait ].

	demo close; ensureQuitVideo
]

{ #category : 'examples' }
S3SDLExamples class >> example02StdoutEvents [

	| demo shouldFinish |
	demo := self new.

	demo ensureInitVideo; open.

	shouldFinish := false.
	
	[	[ shouldFinish ] whileFalse: [ 
			demo pollEventsDo: [ :evt |
				Stdio stdout print: evt; lf; flush.
				demo
					clearColor: Color black;
					rendererDrawColor: Color white;
					showText: evt asString x: 10 y: 10;
					present ].
			5 milliSeconds wait ]
		] forkAt: Processor lowIOPriority.

	5 seconds wait.
	shouldFinish := true.
	
	demo close; ensureQuitVideo
]

{ #category : 'renderer' }
S3SDLExamples >> clearColor: aColor [

	self rendererDrawColor: aColor.

	self assert: (lib SDL_RenderClear: renderer)
]

{ #category : 'instance creation' }
S3SDLExamples >> close [

	LibSDL3 uniqueInstance SDL_DestroyRenderer: renderer.
	LibSDL3 uniqueInstance SDL_DestroyWindow: window
]

{ #category : 'instance creation' }
S3SDLExamples >> ensureInitVideo [

	"Return early if video subsystem is already initialized"
	(lib SDL_WasInit: S3SDLInitFlags SDL_INIT_VIDEO)
		= S3SDLInitFlags SDL_INIT_VIDEO value ifTrue: [ ^ self ].
	
	"Initialize the video subsystem"
	self assert: (lib SDL_InitSubSystem: S3SDLInitFlags SDL_INIT_VIDEO)
]

{ #category : 'instance creation' }
S3SDLExamples >> ensureNoError [

	lib SDL_GetError ifNotEmpty: [ :msg | self error: msg ]
]

{ #category : 'instance creation' }
S3SDLExamples >> ensureQuitVideo [

	(lib SDL_WasInit: S3SDLInitFlags SDL_INIT_VIDEO)
		= S3SDLInitFlags SDL_INIT_VIDEO ifFalse: [ ^ self ].
	
	lib SDL_QuitSubSystem: S3SDLInitFlags SDL_INIT_VIDEO
]

{ #category : 'initialization' }
S3SDLExamples >> initialize [

	super initialize.
	
	lib := LibSDL3 uniqueInstance.

	event := S3SDL_Event new.
	map := S3SDLEventMap new
]

{ #category : 'instance creation' }
S3SDLExamples >> open [

	window :=
		lib
			SDL_CreateWindowTitle: 'Pharo-SDL3 Demo'
			w: 800
			h: 600
			flags: 0.
	self assert: window isNull not.

	renderer := lib SDL_CreateRendererWindow: window name: nil.
	self assert: renderer isNull not
]

{ #category : 'enumerating' }
S3SDLExamples >> pollEventsDo: aUnaryBlock [

	[ lib SDL_PollEvent: event ] whileTrue: [
		aUnaryBlock value: (map conversionOf: event) ]
]

{ #category : 'instance creation' }
S3SDLExamples >> present [

	self assert: (lib SDL_RenderPresent: renderer)
]

{ #category : 'renderer' }
S3SDLExamples >> rendererDrawColor: aColor [

	self assert:
		(lib
			SDL_SetRenderDrawColorFloatRenderer: renderer
			r: aColor red
			g: aColor green
			b: aColor blue
			a: aColor alpha)
]

{ #category : 'renderer' }
S3SDLExamples >> showText: aString x: x y: y [

	self assert:
		(lib
			SDL_RenderDebugTextRenderer: renderer
			x: x
			y: y
			str: aString)
]
