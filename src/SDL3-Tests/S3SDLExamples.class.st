Class {
	#name : 'S3SDLExamples',
	#superclass : 'Object',
	#instVars : [
		'window',
		'renderer',
		'lib'
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

	demo
		ensureInitVideo;
		open;
		clearColor: Color blue darker;
		present.

	shouldFinish := false.
	
	[	[ shouldFinish ] whileFalse: [ 
			demo pollEventsDo: [ :evt |
				Stdio stdout print: evt; lf; flush ].
			5 milliSeconds wait ]
		] forkAt: Processor lowIOPriority.

	5 seconds wait.
	shouldFinish := true.
	
	demo close; ensureQuitVideo
]

{ #category : 'instance creation' }
S3SDLExamples >> clearColor: aColor [

	| success |
	success :=
		lib
			SDL_SetRenderDrawColorFloatRenderer: renderer
			r: aColor red
			g: aColor green
			b: aColor blue
			a: aColor alpha.
	self assert: success.

	success := lib SDL_RenderClear: renderer.
	self assert: success
]

{ #category : 'instance creation' }
S3SDLExamples >> close [

	LibSDL3 uniqueInstance SDL_DestroyRenderer: renderer.
	LibSDL3 uniqueInstance SDL_DestroyWindow: window
]

{ #category : 'instance creation' }
S3SDLExamples >> ensureInitVideo [

	"Return early if video subsystem is already initialized"
	(lib SDL_WasInit: S3SDL_InitFlagsE SDL_INIT_VIDEO)
		= S3SDL_InitFlagsE SDL_INIT_VIDEO value ifTrue: [ ^ self ].
	
	"Initialize the video subsystem"
	self assert: (lib SDL_InitSubSystem: S3SDL_InitFlagsE SDL_INIT_VIDEO)
]

{ #category : 'instance creation' }
S3SDLExamples >> ensureQuitVideo [

	(lib SDL_WasInit: S3SDL_InitFlagsE SDL_INIT_VIDEO)
		= S3SDL_InitFlagsE SDL_INIT_VIDEO ifFalse: [ ^ self ].
	
	lib SDL_QuitSubSystem: S3SDL_InitFlagsE SDL_INIT_VIDEO
]

{ #category : 'initialization' }
S3SDLExamples >> initialize [

	super initialize.
	
	lib := LibSDL3 uniqueInstance
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

	| event |
	event := S3SDL_Event new.

	[ lib SDL_PollEvent: event ] whileTrue: [ aUnaryBlock value: event ]
]

{ #category : 'instance creation' }
S3SDLExamples >> present [

	self assert: (lib SDL_RenderPresent: renderer)
]
