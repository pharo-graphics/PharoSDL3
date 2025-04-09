Class {
	#name : 'S3Demo',
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
S3Demo class >> example01ColorWheel [

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
S3Demo class >> example02LogEventsForSomeSconds [

	| demo shouldFinish |
	demo := self new.
	demo ensureInitVideo; open.
	shouldFinish := false.

	[	| logs |
		logs := LinkedList new.

		"Main loop"
		[ shouldFinish ] whileFalse: [ 

			"Process all pending events"
			demo pollEventsDo: [ :evt | logs addLast: evt asString ].

			"Render frame"
			demo clearColor: Color blue muchDarker.
			[ logs size > 50 ] whileTrue: [ logs removeFirst ]. "cap"
			logs withIndexDo: [ :each :index |
				demo
					showText: each
					x: 10 y: 10 * index
					color: Color white ].
			demo present.

			"Do a little wait before next frame"
			5 milliSeconds wait ]

		] fork.

	7 seconds wait.
	shouldFinish := true.
	Processor yield.
	demo close; ensureQuitVideo
]

{ #category : 'examples' }
S3Demo class >> example03HandleEvents [
	"It is prepared to run headless with:
	./pharo Pharo.image eval --no-quit 'S3Demo example03HandleEvents' "
	<sampleInstance>

	| demo |
	demo := self new.
	demo ensureInitVideo; open.

	[	| quit hue bright backgroundColor |
		quit := false.
		hue := 250.
		bright := 0.5.

		"main loop"
		[ quit ] whileFalse: [

			"Process all pending events"
			demo pollEventsDo: [ :evt |
				evt type = S3SDL_EventType SDL_EVENT_QUIT
					ifTrue: [ quit := true ].

				evt type = S3SDL_EventType SDL_EVENT_KEY_DOWN ifTrue: [
					
					evt scancode = S3SDL_Scancode SDL_SCANCODE_DOWN
						ifTrue: [ bright := (bright - 0.1) max: 0 ].
					evt scancode = S3SDL_Scancode SDL_SCANCODE_UP
						ifTrue: [ bright := (bright + 0.1) min: 1.0 ].

					evt scancode = S3SDL_Scancode SDL_SCANCODE_LEFT
						ifTrue: [ hue := (hue - 5) max: 0 ].
					evt scancode = S3SDL_Scancode SDL_SCANCODE_RIGHT
						ifTrue: [ hue := (hue + 5) min: 360 ].

					evt scancode = S3SDL_Scancode SDL_SCANCODE_ESCAPE
						ifTrue: [ quit := true ] ]
				].
			
			"Render frame"
			backgroundColor := Color h: hue s: 1.0 v: bright.
			demo
				clearColor: backgroundColor;
				showText: ('Hue: {1} Bright: {2}%.' format: { hue. (bright*100) asInteger })
					x: 10 y: 10 color: backgroundColor negated;
				showText: 'Press LEFT/RIGHT to change hue'
					x: 10 y: 20 color: backgroundColor negated;
				showText: 'Press UP/DOWN to change brigthness'
					x: 10 y: 30 color: backgroundColor negated;
				showText: 'Press ESCAPE to quit'
					x: 10 y: 40 color: backgroundColor negated;
				present.

			"Do a little wait before next frame"
			10 milliSeconds wait ].
	
		demo close.
		UIManager default class = NonInteractiveUIManager ifTrue: [ 
			demo ensureQuitVideo.
			Smalltalk snapshot: false andQuit: true ]

		] fork.
	
	^ demo
]

{ #category : 'examples' }
S3Demo class >> example04OpenFolderDialog [
	"It is prepared to run headless with:
	./pharo Pharo.image eval --no-quit 'S3SDLExamples example04OpenFolderDialog' "
	<sampleInstance>

	| demo |
	demo := self new.
	demo ensureInitVideo; open.

	demo
		clearColor: Color blue muchDarker;
		showText: 'CLICK TO OPEN DIALOG' x: 10 y: 10 color: Color white;
		present.
					
	[	| quit logs |
		quit := false.
		logs := LinkedList new.
		[	demo pollEventsDo: [ :evt |
				evt type = S3SDL_EventType SDL_EVENT_WINDOW_CLOSE_REQUESTED
					ifTrue: [ quit := true ].
				evt type = S3SDL_EventType SDL_EVENT_MOUSE_BUTTON_DOWN
					ifTrue: [
						| result |
						result := demo showOpenFolderModal: true.
						logs addLast: result.

						"Stdio stdout
							nextPutAll: '---->';
							nextPutAll: result asString;
							lf; flush" 
						] ].

			"Render frame"
			demo clearColor: Color blue muchDarker.
			logs size > 10 ifTrue: [ logs := logs last: 10 ]. "cap"
			logs withIndexDo: [ :each :index |
				demo showText: each asString x: 10 y: 10 * index ].
			demo present.

			"Do a little wait before next frame"
			10 milliSeconds wait ] doWhileFalse: [ quit ].

		demo close; ensureQuitVideo.
		Stdio stdout nextPutAll: '-- FINISHING EVENT LOOP PROCESS --'; lf; flush 

		] fork.
	
	^ demo
]

{ #category : 'renderer' }
S3Demo >> clear [

	self ensureNoErrorIfFalse: (lib SDL_RenderClear: renderer)
]

{ #category : 'renderer' }
S3Demo >> clearColor: aColor [

	self color: aColor.
	self clear
]

{ #category : 'lifecycle' }
S3Demo >> close [

	lib SDL_ClearError.
	lib SDL_DestroyRenderer: renderer.
	self ensureNoError.
	lib SDL_DestroyWindow: window.
	self ensureNoError
]

{ #category : 'renderer' }
S3Demo >> color: aColor [

	self ensureNoErrorIfFalse:
		(lib
			SDL_SetRenderDrawColorFloatRenderer: renderer
			r: aColor red
			g: aColor green
			b: aColor blue
			a: aColor alpha)
]

{ #category : 'lifecycle' }
S3Demo >> ensureInitVideo [
	"Return early if video subsystem is already initialized"

	(lib SDL_WasInit: S3SDLInitFlags SDL_INIT_VIDEO)
		= S3SDLInitFlags SDL_INIT_VIDEO value ifTrue: [ ^ self ].

	lib
		SDL_SetAppMetadataAppname: self className
		appversion: 'v1.2.3.4.5.6.7'
		appidentifier: 'org.pharo.sdl3.', self className.

	"Initialize the video subsystem"
	self assert: (lib SDL_InitSubSystem: S3SDLInitFlags SDL_INIT_VIDEO)
]

{ #category : 'private' }
S3Demo >> ensureNoError [
	<debuggerCompleteToSender>

	lib SDL_GetError ifNotEmpty: [ :msg | Error new signal: msg ]
]

{ #category : 'private' }
S3Demo >> ensureNoErrorIfFalse: aBoolean [
	<debuggerCompleteToSender>
	
	aBoolean ifTrue: [ ^ self ].
	self ensureNoError
]

{ #category : 'private' }
S3Demo >> ensureNoErrorIfNull: anExternalObject [
	<debuggerCompleteToSender>

	anExternalObject isNull ifFalse: [ ^ self ].
	self ensureNoError
]

{ #category : 'lifecycle' }
S3Demo >> ensureQuitVideo [

	(lib SDL_WasInit: S3SDLInitFlags SDL_INIT_VIDEO)
		= S3SDLInitFlags SDL_INIT_VIDEO ifFalse: [ ^ self ].
	
	lib SDL_QuitSubSystem: S3SDLInitFlags SDL_INIT_VIDEO
]

{ #category : 'initialization' }
S3Demo >> initialize [

	super initialize.
	
	lib := LibSDL3 uniqueInstance.

	event := S3SDL_Event new.
	map := S3SDLEventMap new
]

{ #category : 'lifecycle' }
S3Demo >> open [

	window :=
		lib
			SDL_CreateWindowTitle: 'Pharo-SDL3 Demo'
			w: 800
			h: 600
			flags: S3SDLWindowFlags SDL_WINDOW_RESIZABLE | S3SDLWindowFlags SDL_WINDOW_INPUT_FOCUS.
	self ensureNoErrorIfNull: window.

	renderer := lib SDL_CreateRendererWindow: window name: nil.
	self ensureNoErrorIfNull: window
]

{ #category : 'private' }
S3Demo >> parsedArrayOfCStringsFrom: firstAddress [

	^ Array streamContents: [ :aStream |
		| index currentAddress |
		index := 1.
		[ currentAddress := firstAddress pointerAt: index. currentAddress isNull ] whileFalse: [ 
			aStream nextPut: currentAddress bytesFromCString utf8Decoded.
			index := index + FFIExternalType pointerSize ]
"		aStream nextPut: (firstAddress pointerAt: index) bytesFromCString utf8Decoded.
		index := index + FFIExternalType pointerSize."
"		aStream nextPut: (firstAddress pointerAt: index) bytesFromCString utf8Decoded."
		]
]

{ #category : 'enumerating' }
S3Demo >> pollEvents [

	^ Array new: 10 streamContents: [ :stream |
		self pollEventsDo: [ :evt | stream nextPut: evt copy ]]
]

{ #category : 'enumerating' }
S3Demo >> pollEventsDo: aUnaryBlock [

	[ lib SDL_PollEvent: event ] whileTrue: [
		aUnaryBlock value: (map conversionOf: event) ]
]

{ #category : 'renderer' }
S3Demo >> present [

	self ensureNoErrorIfFalse: (lib SDL_RenderPresent: renderer)
]

{ #category : 'utilities' }
S3Demo >> showOpenFolderModal: aBoolean [

	| callback result |
	callback :=
		FFICallback
			signature: #(void (void *userdata, char **filelist, int filter))
			block: [ :userdata :filelist :filter |
				filelist isNull
					ifTrue: [
"						Stdio stdout nextPutAll: 'User cancelled'."
						result := #() ]
					ifFalse: [
						result := self parsedArrayOfCStringsFrom: filelist.
"						Stdio stdout
							nextPutAll: result asString;
							lf; flush" ] .
						
					"Stdio stdout
							nextPutAll: result asString;
							lf; flush" ].

	lib
		SDL_ShowOpenFolderDialogCallback: callback
		userdata: nil
		window: (aBoolean ifTrue: [ window ] ifFalse: [ S3SDL_Window null ])
		default_location: nil
		allow_many: true.

	Stdio stdout
		nextPutAll: '-> ';
		nextPutAll: result asString;
		lf; flush.

	self
		clearColor: Color random muchDarker;
		present.						

	^ result
]

{ #category : 'renderer' }
S3Demo >> showText: aString x: x y: y [

	self ensureNoErrorIfFalse:
		(lib
			SDL_RenderDebugTextRenderer: renderer
			x: x
			y: y
			str: aString)
]

{ #category : 'renderer' }
S3Demo >> showText: aString x: x y: y color: aColor [

	self color: aColor.
	self showText: aString x: x y: y
]
