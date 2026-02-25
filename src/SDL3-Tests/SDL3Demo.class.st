Class {
	#name : 'SDL3Demo',
	#superclass : 'Object',
	#instVars : [
		'window',
		'renderer',
		'event',
		'map',
		'dialogFileCallback',
		'sdl',
		'initialExtent'
	],
	#category : 'SDL3-Tests-Library',
	#package : 'SDL3-Tests',
	#tag : 'Library'
}

{ #category : 'examples' }
SDL3Demo class >> example00ColorWheel [
	"
	./pharo Pharo.image eval 'SDL3Demo example00ColorWheel'
	"

	| demo |
	demo := self new.

	demo ensureInitSDL3; open.

	(Color wheel: 20) do: [ :each |
		demo
			clearColor: each;
			present.
		0.1 seconds wait ].

	demo close; ensureQuitSDL3
]

{ #category : 'examples' }
SDL3Demo class >> example01MultipleWindows [
	"
	./pharo Pharo.image eval 'SDL3Demo example01MultipleWindows'
	"

	| defaultSecondsToWait demos extent consumeEventsBlock |
	defaultSecondsToWait := 0.5.
	extent := 200 @ 300.

	consumeEventsBlock := [ :demo :duration |
		| endTime |
		endTime := DateAndTime now + duration seconds wait.
		[ demo pollEventsDo: [ :_ | ]. 25 milliSeconds wait ]
			doWhileTrue: [ DateAndTime now < endTime ] ].

	demos := (1 to: 4) collect: [ :i | self new ].
	demos first ensureInitSDL3.

	Stdio stdout << 'open'; lf.
	demos do: [ :demo | demo initialExtent: extent//2; open ].

	Stdio stdout << 'title'; lf.
	demos withIndexDo: [ :demo :index | demo window title: index asString ].

	Stdio stdout << 'resize'; lf.
	demos do: [ :demo |
		demo window resizable: true; extent: extent; sync.
		demo clearColor: Color yellow; present.
		consumeEventsBlock value: demo value: defaultSecondsToWait ].

	Stdio stdout << 'position'; lf.
	demos withIndexDo: [ :demo :index |
		demo window position: (Point x: extent x * index y: extent y) ].

	Stdio stdout << 'flash'; lf.
	demos do: [ :demo |
		demo window flashWithOperation: SDL3FlashOperation untilFocused ].

	Stdio stdout << 'raise'; lf.
	demos with: (Color wheel: demos size) do: [ :demo :color |
		demo window raise.
		demo clearColor: color; present.
		consumeEventsBlock value: demo value: defaultSecondsToWait ].

	Stdio stdout << 'hide & show'; lf.
	demos with: (Color wheel: demos size) do: [ :demo :color |
		demo window hide.
		consumeEventsBlock value: demo value: defaultSecondsToWait.
		demo window show.
		demo clearColor: color; present. "Need to paint again"
		consumeEventsBlock value: demo value: defaultSecondsToWait ].

	Stdio stdout << 'maximize & restore'; lf.
	demos with: (Color wheel: demos size) do: [ :demo :color |
		demo window maximize; sync.
		demo clearColor: color; present.
		consumeEventsBlock value: demo value: defaultSecondsToWait.
		demo window restore; sync.
		demo clearColor: color; present.
		consumeEventsBlock value: demo value: defaultSecondsToWait ].

	Stdio stdout << 'fullscreen true/false'; lf.
	demos with: (Color wheel: demos size) do: [ :demo :color |
		demo window fullscreen: true; sync.
		demo clearColor: color; present.
		consumeEventsBlock value: demo value: defaultSecondsToWait.
		demo window fullscreen: false; sync.
		demo clearColor: color; present.
		consumeEventsBlock value: demo value: defaultSecondsToWait ].

	Stdio stdout << 'minimize & restore'; lf.
	demos do: [ :demo |
		demo window minimize; sync.
		consumeEventsBlock value: demo value: defaultSecondsToWait.
		demo window restore; sync.
		consumeEventsBlock value: demo value: defaultSecondsToWait ].

	Stdio stdout << 'close'; lf.
	demos do: [ :demo | demo close ].
	demos first ensureQuitSDL3
]

{ #category : 'examples' }
SDL3Demo class >> example02LogState [
	"SDL2 event subsystem conflicts with SDL3 event subsystem. Run this demo on a headless Pharo to appreciate it correctly.'.
	Example:
		./pharo Pharo.image eval 'SDL3Demo example02LogState' "

	| demo logs quit |
	self
		assert: (SDL2 wasInit: 16384) = 0 "SDL_INIT_EVENTS"
		description: 'SDL2 is already initialized'.

	demo := self new.
	demo ensureInitSDL3; open.

	quit := false.
	logs := LinkedList new.

	"Main loop"
	[ quit ] whileFalse: [
		| lib |
		lib := LibSDL3 uniqueInstance.

		demo pollEventsDo: [ :evt |
			"Handle quit"
			evt type = SDL3EventType quit ifTrue: [ quit := true ] ].

		"Log some SDL state values"
		logs add: #SYSTEM.
		#(#getBasePath #getCurrentDirectory #getCurrentVideoDriver
		#getRevision #getSystemPageSize #getSystemTheme
		#gpuDrivers #renderDrivers #videoDrivers) do: [ :each |
			logs add: each -> (lib perform: each) ].

		logs add: ''.
		logs add: #DISPLAYS.
		logs add: #getPrimaryDisplay -> lib getPrimaryDisplay.
		logs add: #numberOfDisplays -> lib numberOfDisplays.
		lib displayIDs do: [ :eachId |
			logs add: ''.
			logs add: 'DisplayID' -> eachId.
			logs add: 'Name' -> (lib getDisplayName: eachId).
			logs add: 'Desktop display mode' -> (lib getDesktopDisplayMode: eachId).
			logs add: 'Current display mode' -> (lib getCurrentDisplayMode: eachId).
			logs add: 'All display modes' -> (lib fullscreenDisplayModesOf: eachId).
			logs add: 'Scale' -> (lib getDisplayContentScale: eachId).
			logs add: 'Orientation (current)' -> (lib getCurrentDisplayOrientation: eachId).
			logs add: 'Orientation (natural)' -> (lib getNaturalDisplayOrientation: eachId).
			logs add: 'Bounds' -> (lib boundsOfDisplay: eachId).
			logs add: 'Bounds (usable)' -> (lib usableBoundsOfDisplay: eachId) ].

		logs add: ''.
		logs add: #WINDOW.
		#(displayScale extent isKeyboardGrabbed isMouseGrabbed pixelDensity
		pixelFormat title) do: [ :each |
			logs add: each -> (demo window perform: each) ].

		logs add: ''.
		logs add: #getMouseStateX:y:.
		ExternalAddress
			allocate: ExternalType float byteSize
			allocate: ExternalType float byteSize
			during: [ :pointerForX :pointerForY |
				| state |
				state := lib getMouseStateX: pointerForX y: pointerForY.
				logs add: 'x: ', (pointerForX floatAt: 1) asString.
				logs add: 'y: ', (pointerForY floatAt: 1) asString.
				logs addAll: (SDL3MouseButtonFlags allValuesIn: state) ].

		lib getModState in: [ :modState |
			modState > 0 ifTrue: [ 
				logs add: ''.
				logs add: #getModState.
				logs addAll: (SDL3Keymod allValuesIn: modState) ] ].

		(lib getKeyboardState: nil) in: [ :booleanArray |
			logs add: ''.
			logs add: #getKeyboardState:.

			SDL3Scancode allValues
				select: [ :each | booleanArray boolean8AtOffset: each value ]
				thenDo: [ :each |
					| key |
					key := lib
						getKeyFromScancode: each
						modstate: lib getModState
						keyEvent: true.
					logs add:
						('Scancode: {1} Key: {2]' format: {
							each item.
							SDL3Keycode itemAt: key ifAbsent: [ 'Unknown' ] }) ] ].

		"Render frame"
		demo clearColor: Color blue muchDarker.
		logs withIndexDo: [ :each :index |
			demo
				showText: each asString
				x: 10 y: 10 * index
				color: Color white ].
		logs removeAll.
		demo present.

		"Do a little wait before next frame"
		15 milliSeconds wait ].

	"Tear down"
	demo close; ensureQuitSDL3
]

{ #category : 'examples' }
SDL3Demo class >> example03LogEventsUntilThirdQuit [
	"SDL2 event subsystem conflicts with SDL3 event subsystem. Run this demo on a headless Pharo to appreciate it correctly.'.
	Example:
		./pharo Pharo.image eval 'SDL3Demo example03LogEventsUntilThirdQuit' "

	| demo logs quitCount |
	self
		assert: (SDL2 wasInit: 16384) = 0 "SDL_INIT_EVENTS"
		description: 'SDL2 is already initialized'.

	demo := self new.
	demo ensureInitSDL3; open.

	quitCount := 0.
	logs := LinkedList new.

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
	demo close; ensureQuitSDL3
]

{ #category : 'examples' }
SDL3Demo class >> example04HandleEvents [
	"SDL2 event subsystem conflicts with SDL3 event subsystem. Run this demo on a headless Pharo to appreciate it correctly.'.
	Example:
		./pharo Pharo.image eval 'SDL3Demo example04HandleEvents' "

	| demo quit hue bright backgroundColor |
	self
		assert: (SDL2 wasInit: 16384) = 0 "SDL_INIT_EVENTS"
		description: 'SDL2 is already initialized'.

	demo := self new.
	demo ensureInitSDL3; open.

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
	demo close; ensureQuitSDL3
]

{ #category : 'examples' }
SDL3Demo class >> example05Clipboard [
	"SDL2 event subsystem conflicts with SDL3 event subsystem. Run this demo on a headless Pharo to appreciate it correctly.'.
	Example:
		./pharo Pharo.image eval 'SDL3Demo example05Clipboard' "

	| demo quit pasted |
	self
		assert: (SDL2 wasInit: 16384) = 0 "SDL_INIT_EVENTS"
		description: 'SDL2 is already initialized'.

	demo := self new.
	demo ensureInitSDL3; open.

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
	demo close; ensureQuitSDL3
]

{ #category : 'examples' }
SDL3Demo class >> example06OpenFolderDialog [
	"SDL2 event subsystem conflicts with SDL3 event subsystem. Run this demo on a headless Pharo to appreciate it correctly.'.
	Example:
		./pharo Pharo.image eval 'SDL3Demo example06OpenFolderDialog' "

	| demo logs quit |
	self
		assert: (SDL2 wasInit: 16384) = 0 "SDL_INIT_EVENTS"
		description: 'SDL2 is already initialized'.

	demo := self new.
	demo ensureInitSDL3; open.

	quit := false.
	logs := LinkedList new.
	logs add: 'CLICK TO OPEN DIALOG'.

	[ quit ] whileFalse: [
		demo pollEventsDo: [ :evt |
			evt type = SDL3EventType quit
				ifTrue: [
					demo
						showMessageBoxTitle: 'Good bye'
						message: 'Come back soon'.
					quit := true ].
			evt type = SDL3EventType mouseButtonDown
				ifTrue: [
					demo
						showOpenFolderIfSuccess: [ :result |
							logs addLast:
								('Selected ', result size asString,
								' directories: ', result asString) ]
						ifError: [
							logs addLast: 'Error!!!' ] ]
				].

		"Render frame"
		demo clearColor: Color random muchDarker.
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
	demo close; ensureQuitSDL3
]

{ #category : 'examples' }
SDL3Demo class >> example07SystemCursors [
	"SDL2 event subsystem conflicts with SDL3 event subsystem. Run this demo on a headless Pharo to appreciate it correctly.'.
	Example:
		./pharo Pharo.image eval 'SDL3Demo example07SystemCursors' "

	| demo quit logs cursorGenerator |
	self
		assert: (SDL2 wasInit: 16384) = 0 "SDL_INIT_EVENTS"
		description: 'SDL2 is already initialized'.

	demo := self new.
	demo ensureInitSDL3; open.

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
	demo close; ensureQuitSDL3
]

{ #category : 'examples' }
SDL3Demo class >> example08TrayMenu [
	"SDL2 event subsystem conflicts with SDL3 event subsystem. Run this demo on a headless Pharo to appreciate it correctly.'.
	Example:
		./pharo Pharo.image eval 'SDL3Demo example08TrayMenu' "

	| demo quit logs sdl tray logEntryLabelCallback strings |
	self
		assert: (SDL2 wasInit: 16384) = 0 "SDL_INIT_EVENTS"
		description: 'SDL2 is already initialized'.

	demo := self new.
	demo ensureInitSDL3; open.
	sdl := LibSDL3 uniqueInstance.

	quit := false.
	logs := LinkedList new.

	"TO DO: Extract to a demo class! the set up is in the following block closure:"
	[	| iconSurface menu submenu |
		strings := #('One' 'Two' 'Three' 'Four' 'Five').
		logEntryLabelCallback :=
			FFICallback
				signature: #(void (void *userdata, SDL3TrayEntry *entryHandle))
				block: [ :userdata :entryHandle |
					| entry |
					entry := SDL3TrayEntry fromHandle: entryHandle.
					logs add: 'Click on ', entry label surroundedBySingleQuotes ].

		iconSurface := (self iconNamed: #pharo) asUnownedNewSDL3Surface.
		tray := sdl newTrayIcon: iconSurface tooltip: 'PharoSDL3'.
		iconSurface destroy.

		menu := tray newMenu.

		"Basic: Add a button that is disabled and doesn't have a callback"
		(menu
			insertEntryAt: -1
				label: 'Disabled button'
				flags: SDL3TrayEntryFlags button | SDL3TrayEntryFlags disabled)
			assertNotNullReturn.

		"Add separator"
		(menu
			insertEntryAt: -1
				label: nil
				flags: SDL3TrayEntryFlags button)
			assertNotNullReturn.
				
		"Add submenu with buttons"
		submenu :=
			(menu
				insertEntryAt: -1
					label: 'Buttons'
					flags: SDL3TrayEntryFlags submenu)
				assertNotNullReturn;
				newSubmenu.
		strings do: [ :each |
			(submenu
				insertEntryAt: -1
					label: 'Button ', each
					flags: SDL3TrayEntryFlags button)
				assertNotNullReturn;
				callback: logEntryLabelCallback userdata: nil ].

		"Add submenu with checkboxes"
		submenu :=
			(menu
				insertEntryAt: -1
					label: 'Checkboxes'
					flags: SDL3TrayEntryFlags submenu)
				assertNotNullReturn;
				newSubmenu.
		strings do: [ :each |
			(submenu
				insertEntryAt: -1
					label: 'Checkbox ', each
					flags: SDL3TrayEntryFlags checkbox)
				assertNotNullReturn;
				callback: logEntryLabelCallback userdata: nil ].

		logs add: 'Click on the system tray menu with Pharo icon.'.
		] value.


	"main loop"
	[ quit ] whileFalse: [

		"Process all pending events"
		demo pollEventsDo: [ :evt |
			evt type = SDL3EventType quit
				ifTrue: [ quit := true ].
			evt type = SDL3EventType windowCloseRequested
				ifTrue: [ quit := true ] ].
		
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
	tray ifNotNil: [ tray destroy ].
	demo close; ensureQuitSDL3
]

{ #category : 'examples' }
SDL3Demo class >> example09Progress [
	"SDL2 event subsystem conflicts with SDL3 event subsystem. Run this demo on a headless Pharo to appreciate it correctly.'.
	Example:
		./pharo Pharo.image eval 'SDL3Demo example09Progress' "

	| demo numberOfSteps |
	self
		assert: (SDL2 wasInit: 16384) = 0 "SDL_INIT_EVENTS"
		description: 'SDL2 is already initialized'.

	demo := self new.

	demo
		ensureInitSDL3;
		initialExtent: 400 @ 200;
		open.

	demo window progressState: SDL3ProgressState normal.
	numberOfSteps := 10.
	1 to: numberOfSteps do: [ :index |
		demo window
			title: 'Progress: ', index asString, '/', numberOfSteps asString;
			progressValue: (index / numberOfSteps).
		0.5 seconds wait ].
	demo window
		title: 'Progress: Error';
		progressState: SDL3ProgressState error.
	1.0 seconds wait.

	"Tear down"
	demo close; ensureQuitSDL3
]

{ #category : 'renderer' }
SDL3Demo >> clear [

	sdl assertSuccess: renderer renderClear
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
		detect: [ :each | sdl hasClipboardData: each ]
		ifNone: [ ^ absentBlock value ].

	^ presentBlock
		value: mimeType
		value:
			(ExternalAddress
				allocate: FFIUInt64 pointerSize
				bytesDuring: [ :dataSizePointer |
					| dataPointer dataSize |
					dataPointer := sdl
						getClipboardDataMimeType: mimeType
						size: dataSizePointer.
					dataSize := dataSizePointer signedLongLongAt: 1.
					dataPointer bytesFromNext: dataSize ])
]

{ #category : 'utilities' }
SDL3Demo >> clipboardMimeTypes [

	| mimeTypesCountPointer mimeTypesStringArrayPointer mimeTypesStringArray |
	mimeTypesCountPointer := FFIInt64 newBuffer.
	mimeTypesStringArrayPointer := sdl getClipboardMimeTypes: mimeTypesCountPointer.
	mimeTypesStringArray :=
		mimeTypesStringArrayPointer
			arrayOfStringsOfSize: (mimeTypesCountPointer signedLongLongAt: 1). 
	sdl free: mimeTypesStringArrayPointer.

	^ mimeTypesStringArray
]

{ #category : 'lifecycle' }
SDL3Demo >> close [

	renderer destroy.
	window destroy
]

{ #category : 'renderer' }
SDL3Demo >> color: aColor [

	sdl assertSuccess: (renderer renderDrawColor: aColor)
]

{ #category : 'lifecycle' }
SDL3Demo >> ensureInitSDL3 [

	"Set (optional) metadata"
	sdl
		setAppMetadataAppname: self className
		appversion: 'v1.2.3'
		appidentifier: 'org.pharo.sdl3.', self className.

	"Initialize the video subsystem"
	self assert: (sdl initSubSystem: SDL3InitFlags video)
]

{ #category : 'lifecycle' }
SDL3Demo >> ensureQuitSDL3 [

	sdl quit
]

{ #category : 'accessing' }
SDL3Demo >> initialExtent [

	^ initialExtent
]

{ #category : 'accessing' }
SDL3Demo >> initialExtent: anObject [

	initialExtent := anObject
]

{ #category : 'initialization' }
SDL3Demo >> initialize [

	super initialize.
	
	sdl := LibSDL3 uniqueInstance.

	event := SDL3Event new.
	map := SDL3EventMap new.
	
	initialExtent := 1280 @ 720 "720p"
]

{ #category : 'lifecycle' }
SDL3Demo >> open [

	window :=
		sdl
			newWindowTitle: self className
			w: initialExtent x
			h: initialExtent y
			flags: SDL3WindowFlags resizable | SDL3WindowFlags inputFocus.
	window assertNotNullReturn.

	renderer := window newRendererFor: nil.
	renderer assertNotNullReturn.

	sdl assertSuccess: window startTextInput "Enable SDL3TextEditingEvent"
]

{ #category : 'enumerating' }
SDL3Demo >> pollEvents [

	^ Array new: 10 streamContents: [ :stream |
		self pollEventsDo: [ :evt | stream nextPut: evt copy ]]
]

{ #category : 'enumerating' }
SDL3Demo >> pollEventsDo: aUnaryBlock [

	[ sdl pollEvent: event ] whileTrue: [
		aUnaryBlock value: (map conversionOf: event) ]
]

{ #category : 'renderer' }
SDL3Demo >> present [

	sdl assertSuccess: renderer renderPresent
]

{ #category : 'renderer' }
SDL3Demo >> renderTexture: texture at: aSDLFRect [

	sdl assertSuccess:
		(renderer
			renderTexture: texture
			srcrect: nil
			dstrect: aSDLFRect)
]

{ #category : 'utilities' }
SDL3Demo >> showMessageBoxTitle: title message: message [

	sdl
		showSimpleMessageBoxFlags: SDL3MessageBoxFlags information 
		title: title
		message: message
		window: window
]

{ #category : 'utilities' }
SDL3Demo >> showOpenFolderIfSuccess: acceptOrCancelBlock ifError: errorBlock [

	dialogFileCallback ifNotNil: [ ^ errorBlock value ].

	dialogFileCallback :=
		FFICallback
			signature: #(void (void *userdata, char **filelist, int filter))
			block: [ :userdata :filelist :filter |
				filelist isNull
					ifTrue: [ errorBlock value ]
					ifFalse: [ acceptOrCancelBlock value: filelist nullTerminatedArrayOfCStrings ].
				dialogFileCallback := nil ].

	sdl
		showOpenFolderDialogCallback: dialogFileCallback
		userdata: nil
		window: window
		defaultLocation: OSPlatform current currentWorkingDirectoryPath
		allowMany: true
]

{ #category : 'renderer' }
SDL3Demo >> showText: aString x: x y: y [

	sdl assertSuccess:
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
	aSurface assertNotNullReturn.
	aTexture := renderer newTextureFromSurface: aSurface.
	aSurface destroy.
	^ aTexture
]

{ #category : 'accessing' }
SDL3Demo >> window [

	^ window
]
