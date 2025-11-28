Class {
	#name : 'SDL3Demo',
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
SDL3Demo class >> example01ColorWheel [

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
SDL3Demo class >> example02LogInfoSomeSeconds [
	"It is prepared to run headless with:
	./pharo Pharo.image eval 'SDL3Demo example02LogInfoSomeSeconds' "

	| demo shouldFinish |
	demo := self new.
	demo ensureInitVideo; open.
	shouldFinish := false.

	[	| logs |
		logs := LinkedList new.

		"Main loop"
		[ shouldFinish ] whileFalse: [ 

			demo pollEventsDo: [ :evt | "we need to consume events, else window may not show" ].

			logs removeAll.
			logs add: #getRevision -> LibSDL3 uniqueInstance getRevision.
			logs add: #getBasePath -> LibSDL3 uniqueInstance getBasePath.
			logs add: #getCurrentDirectory -> LibSDL3 uniqueInstance getCurrentDirectory.
			logs add: #getCurrentVideoDriver -> LibSDL3 uniqueInstance getCurrentVideoDriver.

			logs add: ''.
			logs add: #getMouseStateX:y:.
			ExternalAddress
				allocate: ExternalType float byteSize
				allocate: ExternalType float byteSize
				during: [ :pointerForX :pointerForY |
					| state |
					state := LibSDL3 uniqueInstance getMouseStateX: pointerForX y: pointerForY.
					logs add: 'x: ', (pointerForX floatAt: 1) asString.
					logs add: 'y: ', (pointerForY floatAt: 1) asString.
					logs addAll: (SDL3MouseButtonFlags allValuesIn: state) ].

			LibSDL3 uniqueInstance getModState in: [ :modState |
				modState > 0 ifTrue: [ 
					logs add: ''.
					logs add: #getModState.
					logs addAll: (SDL3Keymod allValuesIn: modState) ] ].

			"Render frame"
			demo clearColor: Color blue muchDarker.
			[ logs size > 50 ] whileTrue: [ logs removeFirst ]. "cap"
			logs withIndexDo: [ :each :index |
				demo
					showText: each asString
					x: 10 y: 10 * index
					color: Color white ].
			demo present.

			"Do a little wait before next frame"
			50 milliSeconds wait ]

		] fork.

	10 seconds wait.
	shouldFinish := true.
	Processor yield.
	demo close; ensureQuitVideo
]

{ #category : 'examples' }
SDL3Demo class >> example03LogEventsUntilThirdQuit [
	"It is prepared to run headless with:
	./pharo Pharo.image eval --no-quit 'SDL3Demo example03LogEventsUntilThirdQuit' "

	| demo |
	demo := self new.
	demo ensureInitVideo; open.

	[	| logs quitCount |
		logs := LinkedList new.
		quitCount := 0.

		"Main loop"
		[ quitCount < 3 ] whileTrue: [ 

			"Process all pending events"
			demo pollEventsDo: [ :evt |
				logs addLast: evt asString.

				"Handle quit"
				evt type = SDL3EventType quit ifTrue: [
					quitCount := quitCount + 1.
					logs addLast:
						'===> quitCount = ', quitCount asString,
						' (wont''t really quit demo until third)' ] ].

			"Render frame"
			demo clearColor: Color blue muchDarker.
			[ logs size > 50 ] whileTrue: [ logs removeFirst ]. "cap"
			logs withIndexDo: [ :each :index |
				demo showText: each x: 10 y: 10 * index color: Color white ].
			demo present.

			"Do a little wait before next frame"
			15 milliSeconds wait ].
	
		"Tear down"
		demo close.
		UIManager default class = NonInteractiveUIManager ifTrue: [ 
			demo ensureQuitVideo.
			Smalltalk snapshot: false andQuit: true ]

		] fork.
	
	^ demo
]

{ #category : 'examples' }
SDL3Demo class >> example04HandleEvents [
	"It is prepared to run headless with:
	./pharo Pharo.image eval --no-quit 'SDL3Demo example04HandleEvents' "
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
				evt type = SDL3EventType quit
					ifTrue: [ quit := true ].

				evt type = SDL3EventType keyDown ifTrue: [
					
					evt key = SDL3Keycode down asInteger
						ifTrue: [ bright := (bright - 0.1) max: 0 ].
					evt key = SDL3Keycode up asInteger
						ifTrue: [ bright := (bright + 0.1) min: 1.0 ].

					evt key = SDL3Keycode left asInteger
						ifTrue: [ hue := (hue - 5) max: 0 ].
					evt key = SDL3Keycode right asInteger
						ifTrue: [ hue := (hue + 5) min: 360 ].

					evt key = SDL3Keycode escape asInteger
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
			15 milliSeconds wait ].
	
		"Tear down"
		demo close.
		UIManager default class = NonInteractiveUIManager ifTrue: [ 
			demo ensureQuitVideo.
			Smalltalk snapshot: false andQuit: true ]

		] fork.
	
	^ demo
]

{ #category : 'examples' }
SDL3Demo class >> example05Clipboard [
	"It is prepared to run headless with:
	./pharo Pharo.image eval --no-quit 'SDL3Demo example05Clipboard' "
	<sampleInstance>

	| demo |
	demo := self new.
	demo ensureInitVideo; open.

	[	| quit pasted |
		quit := false.
		pasted := OrderedCollection new.

		"main loop"
		[ quit ] whileFalse: [

			"Process all pending events"
			demo pollEventsDo: [ :evt |
				evt type = SDL3EventType quit
					ifTrue: [ quit := true ].
				evt type = SDL3EventType windowCloseRequested
					ifTrue: [ quit := true ].
				evt type = SDL3EventType mouseButtonDown
					ifTrue: [
						| pasteAsTextureFromClipboardBlock |
						Stdio stdout << demo clipboardMimeTypes asString; lf; flush.

						pasteAsTextureFromClipboardBlock := [ :mimeType :bytes |
								| form texture rect |
								form := ImageReadWriter formFromStream: bytes readStream.
								"form writeBMPfileNamed: 'last.bmp'."
								texture := demo unownedNewTextureFromForm: form.
								rect := SDL3FRect new
									x: evt x;
									y: evt y;
									w: form width;
									h: form height;
									yourself. 
								pasted add: (texture -> rect) ].

						demo
							clipboardMimeTypeAnyOf: #('image/png' 'image/bmp')
							ifPresent: pasteAsTextureFromClipboardBlock
							ifAbsent: [ "ignore click" ] ]
				].
			
			"Render frame"
			demo clearColor: Color blue muchDarker.
			pasted do: [ :each | demo renderTexture: each key at: each value ].
			demo present.

			"Do a little wait before next frame"
			15 milliSeconds wait ].
	
		"Tear down"
		pasted do: [ :each | each key destroy ].
		demo close.
		UIManager default class = NonInteractiveUIManager ifTrue: [ 
			demo ensureQuitVideo.
			Smalltalk snapshot: false andQuit: true ]

		] fork.
	
	^ demo
]

{ #category : 'examples' }
SDL3Demo class >> example06OpenFolderDialog [
	"It is prepared to run headless with:
	./pharo Pharo.image eval --no-quit 'SDL3Demo example06OpenFolderDialog' "
	<sampleInstance>

	| demo logs |
	demo := self new.
	demo ensureInitVideo; open.

	logs := LinkedList new.
	logs add: 'CLICK TO OPEN DIALOG'.

	[	| quit |
		quit := false.
		[ quit ] whileFalse: [
			demo pollEventsDo: [ :evt |
				evt type = SDL3EventType quit
					ifTrue: [ quit := true ].
				evt type = SDL3EventType mouseButtonDown
					ifTrue: [
						
						[| result |
						result := demo showOpenFolderModal: true.
						demo showMessageBoxTitle: 'Info' message: 'Thank you'.
						result
							ifEmpty: [ 
								logs addLast: 'Cancelled' ]
							ifNotEmpty: [
								logs addLast:
									('Selected ', result size asString,
									' directories: ', result asString) ]
							] onErrorDo: [ :error | logs addLast: error asString ] ]

				].

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
			15 milliSeconds wait ].

		"Tear down"
		demo close.
		UIManager default class = NonInteractiveUIManager ifTrue: [ 
			demo ensureQuitVideo.
			Smalltalk snapshot: false andQuit: true ]

		] fork.
	
	^ demo
]

{ #category : 'examples' }
SDL3Demo class >> example07SystemCursors [
	"It is prepared to run headless with:
	./pharo Pharo.image eval --no-quit 'SDL3Demo ' "
	<sampleInstance>

	| demo |
	demo := self new.
	demo ensureInitVideo; open.

	[	| quit logs cursorGenerator |
		quit := false.
		logs := LinkedList new.
		logs add: 'Click to change to next System Cursor.'.
		
		cursorGenerator := Generator on: [ :g |
			[ SDL3SystemCursor allValues
				do: [ :each | g yield: each ] ] repeat ].
		
		"main loop"
		[ quit ] whileFalse: [

			"Process all pending events"
			demo pollEventsDo: [ :evt |
				evt type = SDL3EventType quit
					ifTrue: [ quit := true ].
				evt type = SDL3EventType windowCloseRequested
					ifTrue: [ quit := true ].
				evt type = SDL3EventType mouseButtonDown
					ifTrue: [
						| cursorId cursor |
						cursorId := cursorGenerator next. 
						cursor := LibSDL3 uniqueInstance newSystemCursor: cursorId.
						self assert: (LibSDL3 uniqueInstance setCursor: cursor).
						logs add: cursorId item ]

				].
			
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
			15 milliSeconds wait ].
	
		"Tear down"
		demo close.
		UIManager default class = NonInteractiveUIManager ifTrue: [ 
			demo ensureQuitVideo.
			Smalltalk snapshot: false andQuit: true ]

		] fork.
	
	^ demo
]

{ #category : 'private' }
SDL3Demo >> assertSDL3EmptyError [
	<debuggerCompleteToSender>

	lib getError ifNotEmpty: [ :msg | Error new signal: msg ]
]

{ #category : 'private' }
SDL3Demo >> assertSDL3Success: anObject [
	"FFI calls in SDL3 return either true or not NULL to indicate success. In the case of no success, a string may be retrieved from SDL_GetError()."
	<debuggerCompleteToSender>
	
	(anObject = true or: [ anObject isNull not ]) ifTrue: [ ^ self ].

	self assertSDL3EmptyError.
	Error new signal: 'Unknown error in SDL3 FFI call'
]

{ #category : 'renderer' }
SDL3Demo >> clear [

	self assertSDL3Success: renderer renderClear
]

{ #category : 'renderer' }
SDL3Demo >> clearColor: aColor [

	self color: aColor.
	self clear
]

{ #category : 'utilities' }
SDL3Demo >> clipboardMimeTypeAnyOf: mimeTypes ifPresent: presentBlock ifAbsent: absentBlock [

	| mimeType |
	mimeType := mimeTypes
		detect: [ :each | lib hasClipboardData: each ]
		ifNone: [ ^ absentBlock value ].

	^ presentBlock
		value: mimeType
		value:
			(ExternalAddress
				allocate: FFIUInt64 pointerSize
				bytesDuring: [ :dataSizePointer |
					| dataPointer dataSize |
					dataPointer := lib
						getClipboardDataMimeType: mimeType
						size: dataSizePointer.
					dataSize := dataSizePointer signedLongLongAt: 1.
					dataPointer bytesFromNext: dataSize ])
]

{ #category : 'utilities' }
SDL3Demo >> clipboardMimeTypes [

	| mimeTypesCountPointer mimeTypesStringArrayPointer mimeTypesStringArray |
	mimeTypesCountPointer := FFIInt64 newBuffer.
	mimeTypesStringArrayPointer := lib getClipboardMimeTypes: mimeTypesCountPointer.
	mimeTypesStringArray :=
		mimeTypesStringArrayPointer
			arrayOfStringsOfSize: (mimeTypesCountPointer signedLongLongAt: 1). 
	lib free: mimeTypesStringArrayPointer.

	^ mimeTypesStringArray
]

{ #category : 'lifecycle' }
SDL3Demo >> close [

	lib clearError.
	[ 	renderer destroy.
		self assertSDL3EmptyError ] ensure: [
			window destroy.
			self assertSDL3EmptyError ]
]

{ #category : 'renderer' }
SDL3Demo >> color: aColor [

	self assertSDL3Success:
		(renderer
			renderDrawColorFloatR: aColor red
			g: aColor green
			b: aColor blue
			a: aColor alpha)
]

{ #category : 'lifecycle' }
SDL3Demo >> ensureInitVideo [
	"Return early if video subsystem is already initialized"

	(lib wasInit: SDL3InitFlags video)
		= SDL3InitFlags video value ifTrue: [ ^ self ].

	lib
		setAppMetadataAppname: self className
		appversion: 'v1.2.3.4.5.6.7'
		appidentifier: 'org.pharo.sdl3.', self className.

	"Initialize the video subsystem"
	self assert: (lib initSubSystem: SDL3InitFlags video)
]

{ #category : 'lifecycle' }
SDL3Demo >> ensureQuitVideo [

	(lib wasInit: SDL3InitFlags video)
		= SDL3InitFlags video ifFalse: [ ^ self ].
	
	lib quitSubSystem: SDL3InitFlags video
]

{ #category : 'api' }
SDL3Demo >> initialExtent [

	^ 1280 @ 720 "720p"
]

{ #category : 'initialization' }
SDL3Demo >> initialize [

	super initialize.
	
	lib := LibSDL3 uniqueInstance.

	event := SDL3Event new.
	map := SDL3EventMap new
]

{ #category : 'lifecycle' }
SDL3Demo >> open [

	window :=
		lib
			newWindowTitle: self className
			w: self initialExtent x
			h: self initialExtent y
			flags: SDL3WindowFlags resizable | SDL3WindowFlags inputFocus.
	self assertSDL3Success: window.

	renderer := window newRendererFor: nil.
	self assertSDL3Success: window.
	self assertSDL3Success: window startTextInput "Enable SDL3TextEditingEvent"
]

{ #category : 'enumerating' }
SDL3Demo >> pollEvents [

	^ Array new: 10 streamContents: [ :stream |
		self pollEventsDo: [ :evt | stream nextPut: evt copy ]]
]

{ #category : 'enumerating' }
SDL3Demo >> pollEventsDo: aUnaryBlock [

	[ lib pollEvent: event ] whileTrue: [
		aUnaryBlock value: (map conversionOf: event) ]
]

{ #category : 'renderer' }
SDL3Demo >> present [

	self assertSDL3Success: renderer renderPresent
]

{ #category : 'renderer' }
SDL3Demo >> renderTexture: texture at: aSDLFRect [

	self assertSDL3Success:
		(renderer
			renderTexture: texture
			srcrect: nil
			dstrect: aSDLFRect)
]

{ #category : 'utilities' }
SDL3Demo >> showMessageBoxTitle: title message: message [

	lib
		showSimpleMessageBoxFlags: SDL3MessageBoxFlags information 
		title: title
		message: message
		window: window
]

{ #category : 'utilities' }
SDL3Demo >> showOpenFolderModal: aBoolean [

	| callback result semaphore |
	semaphore := Semaphore new.
	
Stdio stdout << '1'; lf; flush.

	callback :=
		FFICallback
			signature: #(void (void *userdata, char **filelist, int filter))
			block: [ :userdata :filelist :filter |

Stdio stdout << '2'; lf; flush.

				result := filelist isNull
					ifTrue: [ #() ]
					ifFalse: [ filelist nullTerminatedArrayOfCStrings ].
				semaphore signal ].

	lib
		showOpenFolderDialogCallback: callback
		userdata: nil
		window: (aBoolean ifTrue: [ window ] ifFalse: [ SDL3Window null ])
		defaultLocation: nil
		allowMany: true.

Stdio stdout << '3'; lf; flush.

	semaphore wait.

Stdio stdout << '4'; lf; flush.

	^ result
]

{ #category : 'renderer' }
SDL3Demo >> showText: aString x: x y: y [

	self assertSDL3Success:
		(renderer
			renderDebugTextX: x
			y: y
			str: aString)
]

{ #category : 'renderer' }
SDL3Demo >> showText: aString x: x y: y color: aColor [

	self color: aColor.
	self showText: aString x: x y: y
]

{ #category : 'utilities' }
SDL3Demo >> unownedNewTextureFromForm: aForm [

	| aSurface aTexture |
	aSurface := aForm asUnownedNewSDL3Surface.
	self assertSDL3Success: aSurface.
	aTexture := renderer newTextureFromSurface: aSurface.
	aSurface destroy.
	^ aTexture
]
