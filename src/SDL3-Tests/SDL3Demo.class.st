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
		'initialExtent',
		'initialWindowFlags'
	],
	#pools : [
		'SDL3EventType',
		'SDL3ZConstants'
	],
	#category : 'SDL3-Tests-Library',
	#package : 'SDL3-Tests',
	#tag : 'Library'
}

{ #category : 'examples' }
SDL3Demo class >> run00ColorWheel [
	"Open a window and paint it with a wheel of colors.
	Example:
		./pharo Pharo.image eval 'SDL3Demo run00ColorWheel'
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
SDL3Demo class >> run01MultipleWindows [
	"Open multiple windows and perform window operations.
	Example:
		./pharo Pharo.image eval 'SDL3Demo run01MultipleWindows'
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
SDL3Demo class >> run02LogState [
	"SDL2 event subsystem conflicts with SDL3 event subsystem. Run this demo on a headless Pharo to appreciate it correctly.'.
	Example:
		./pharo Pharo.image eval 'SDL3Demo run02LogState'
	"

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
		| sdl |
		sdl := LibSDL3 uniqueInstance.

		demo pollEventsDo: [ :evt |
			"Handle quit"
			evt type = SDL3EventType quit ifTrue: [ quit := true ] ].

		"Log some SDL state values"
		logs add: #SYSTEM.
		#(#allCameraIDs #allKeyboardIDs #allMouseIDs #getBasePath #currentDirectory #getCurrentVideoDriver
		#getRevision #getSystemPageSize #getSystemTheme
		#gpuDrivers #renderDrivers #videoDrivers) do: [ :each |
			logs add: each -> (sdl perform: each) ].

		logs add: ''.
		logs add: #DISPLAYS.
		sdl displays
			do: [ :eachDisplay |
				#(id name isPrimary contentScale bounds usableBounds desktopDisplayMode currentDisplayMode fullscreenDisplayModes currentDisplayOrientation naturalDisplayOrientation) do: [ :each |
					logs add: each -> (eachDisplay perform: each) ] ]
			separatedBy: [ logs add: '' ].

		logs add: ''.
		logs add: #WINDOW.
		#(title extent displayID displayScale pixelDensity pixelFormat isKeyboardGrabbed isMouseGrabbed) do: [ :each |
			logs add: each -> (demo window perform: each) ].

		logs add: ''.
		logs add: #AUDIO.
		#(getCurrentAudioDriver allAudioDrivers) do: [ :each |
			logs add: each -> (sdl perform: each) ].
		logs add: ''.
		sdl allAudioPlaybackDevices, sdl allAudioRecordingDevices do: [ :eachAudioDevice |
			logs add: (String streamContents: [ :stream |
				#(id name isPlayback isPhysical formatSpec gain millisecondsBufferSize) do: [ :each |
					stream
						nextPutAll: each;
						nextPutAll: ': ';
						print: (eachAudioDevice perform: each);
						space ] ]) ].

		logs add: ''.
		logs add: #MOUSE.
		logs add: #position -> sdl mousePosition.
		logs add: #state -> (SDL3MouseButtonFlags allValuesIn: (sdl getMouseStateX: ExternalAddress null y: ExternalAddress null)).

		sdl getModState in: [ :modState |
			modState > 0 ifTrue: [ 
				logs add: ''.
				logs add: #getModState.
				logs addAll: (SDL3Keymod allValuesIn: modState) ] ].

		(sdl getKeyboardState: nil) in: [ :booleanArray |
			logs add: ''.
			logs add: #getKeyboardState:.

			SDL3Scancode allValues
				select: [ :each | booleanArray boolean8AtOffset: each value ]
				thenDo: [ :each |
					| key |
					key := sdl
						getKeyFromScancode: each
						modstate: sdl getModState
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
SDL3Demo class >> run03LogEvents [
	"SDL2 event subsystem conflicts with SDL3 event subsystem. Run this demo on a headless Pharo to appreciate it correctly.'.
	Example:
		./pharo Pharo.image eval 'SDL3Demo run03LogEvents'
	"

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
			logs addLast: evt description "asString".

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
SDL3Demo class >> run04HandleEvents [
	"SDL2 event subsystem conflicts with SDL3 event subsystem. Run this demo on a headless Pharo to appreciate it correctly.'.
	Example:
		./pharo Pharo.image eval 'SDL3Demo run04HandleEvents'
	"

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
SDL3Demo class >> run05ImageClipboard [
	"SDL2 event subsystem conflicts with SDL3 event subsystem. Run this demo on a headless Pharo to appreciate it correctly.'.
	Example:
		./pharo Pharo.image eval 'SDL3Demo run05ImageClipboard'
	"

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
							| form texture |
							form := ImageReadWriter formFromStream: bytes readStream.
							"form writeBMPfileNamed: 'last.bmp'."
							texture := demo unownedNewTextureFromForm: form.
							pasted add:
								(texture -> (SDL3FRect
									x: evt x
									y: evt y
									width: form width
									height: form height)) ].

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
SDL3Demo class >> run06OpenFolderDialog [
	"SDL2 event subsystem conflicts with SDL3 event subsystem. Run this demo on a headless Pharo to appreciate it correctly.'.
	Example:
		./pharo Pharo.image eval 'SDL3Demo run06OpenFolderDialog'
	"

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
SDL3Demo class >> run07SystemCursors [
	"SDL2 event subsystem conflicts with SDL3 event subsystem. Run this demo on a headless Pharo to appreciate it correctly.'.
	Example:
		./pharo Pharo.image eval 'SDL3Demo run07SystemCursors'
	"

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
SDL3Demo class >> run08TrayMenu [
	"SDL2 event subsystem conflicts with SDL3 event subsystem. Run this demo on a headless Pharo to appreciate it correctly.'.
	Example:
		./pharo Pharo.image eval 'SDL3Demo run08TrayMenu'
	"

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
SDL3Demo class >> run09WindowProgress [
	"Some platforms can indicate progress in the window task bar.

	SDL2 event subsystem conflicts with SDL3 event subsystem. Run this demo on a headless Pharo to appreciate it correctly.'.
	Example:
		./pharo Pharo.image eval 'SDL3Demo run09WindowProgress'
	"

	| demo numberOfSteps |
	self
		assert: (SDL2 wasInit: 16384) = 0 "SDL_INIT_EVENTS"
		description: 'SDL2 is already initialized'.

	demo := self new.

	demo
		ensureInitSDL3;
		initialExtent: 400 @ 200;
		open.

	demo consumeEventsDuring: 0.2 seconds.

	demo window progressState: SDL3ProgressState normal.
	numberOfSteps := 10.
	1 to: numberOfSteps do: [ :index |
		demo window
			title: 'Progress: ', index asString, '/', numberOfSteps asString;
			progressValue: (index / numberOfSteps).
		demo consumeEventsDuring: 0.5 seconds ].

	demo window
		title: 'Progress: Error';
		progressState: SDL3ProgressState error.
	demo consumeEventsDuring: 1.0 seconds.

	"Tear down"
	demo close; ensureQuitSDL3
]

{ #category : 'examples' }
SDL3Demo class >> run10PinchToZoom [
	"SDL2 event subsystem conflicts with SDL3 event subsystem. Run this demo on a headless Pharo to appreciate it correctly.'.
	Example:
		./pharo Pharo.image eval 'SDL3Demo run10PinchEvents'
	"

	| demo quit scale texture rect |
	self
		assert: (SDL2 wasInit: 16384) = 0 "SDL_INIT_EVENTS"
		description: 'SDL2 is already initialized'.

	demo := self new.
	demo ensureInitSDL3; open.

	scale := 1.0.
	texture := demo unownedNewTextureFromForm: (self iconNamed: #pharoBig).
	texture assertNotNullReturn.
	rect :=
		SDL3FRect
			x: 0
			y: 0
			width: texture w
			height: texture h.

	quit := false.

	"Main loop"
	[ quit ] whileFalse: [ 

		"Process all pending events"
		demo pollEventsDo: [ :evt |

			evt type = SDL_EVENT_QUIT ifTrue: [ quit := true ].
			
			evt type = SDL_EVENT_PINCH_UPDATE ifTrue: [
				scale := scale * evt scale.
				demo scale: scale ]
			 ].

		"Render frame"
		demo clearColor: Color blue muchDarker.
		demo renderTexture: texture at: rect.
		demo present.

		"Do a little wait before next frame"
		15 milliSeconds wait ].

	"Tear down"
	demo close; ensureQuitSDL3
]

{ #category : 'examples' }
SDL3Demo class >> run11TouchFingers [
	"SDL2 event subsystem conflicts with SDL3 event subsystem. Run this demo on a headless Pharo to appreciate it correctly.'.
	Example:
		./pharo Pharo.image eval 'SDL3Demo run11TouchFingers'
	"

	| sdl demo quit |
	self
		assert: (SDL2 wasInit: 16384) = 0 "SDL_INIT_EVENTS"
		description: 'SDL2 is already initialized'.

	sdl := LibSDL3 uniqueInstance.

	sdl setHintName: SDL_HINT_TOUCH_MOUSE_EVENTS value: '0'.
	sdl setHintName: SDL_HINT_TRACKPAD_IS_TOUCH_ONLY value: '1'.
"	sdl setHintName: SDL_HINT_MOUSE_TOUCH_EVENTS value: '1'."

	demo := self new.
	demo initialExtent: 400 asPoint.
	demo ensureInitSDL3; open.

	quit := false.


	"Main loop"
	[ quit ] whileFalse: [ 

		demo clearColor: Color blue muchDarker.

		"Process all pending events"
		demo pollEventsDo: [ :evt |
			evt type = SDL_EVENT_QUIT ifTrue: [ quit := true ] ].

		demo color: Color white.
		sdl allTouchIDs do: [ :touchID |
			(sdl allFingersOf: touchID) do: [ :finger |
				demo renderRectangle:
					(Rectangle
						center: finger position * demo initialExtent
						extent: 20 asPoint) ] ].

		demo present.

		"Do a little wait before next frame"
		16 milliSeconds wait ].

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

	^ sdl clipboardMimeTypes
]

{ #category : 'lifecycle' }
SDL3Demo >> close [

	renderer ifNotNil: #destroy.
	window ifNotNil: #destroy
]

{ #category : 'renderer' }
SDL3Demo >> color: aColor [

	sdl assertSuccess: (renderer renderDrawColor: aColor)
]

{ #category : 'events' }
SDL3Demo >> consumeEventsDuring: aDuration [

	| end |
	end := DateAndTime now + aDuration.
	[ sdl pollEvent: SDL3Event new ]
		doWhileTrue: [ DateAndTime now < end ]
]

{ #category : 'lifecycle' }
SDL3Demo >> ensureInitSDL3 [

	LibSDL3 uniqueInstance setLogPriorities: SDL3LogPriority trace.

	"Set (optional) metadata"
	sdl
		setAppMetadataAppname: self className
		appversion: 'v1.2.3'
		appidentifier: 'org.pharo.sdl3.', self className.

	self
		assert: (sdl initSubSystem: SDL3InitFlags video | SDL3InitFlags audio)
		description: 'Initialize video and audio subsystems'
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

{ #category : 'accessing' }
SDL3Demo >> initialWindowFlags: anInteger [

	initialWindowFlags := anInteger
]

{ #category : 'initialization' }
SDL3Demo >> initialize [

	super initialize.
	
	sdl := LibSDL3 uniqueInstance.

	event := SDL3Event new.
	map := SDL3EventMap new.
	
	initialWindowFlags := SDL3WindowFlags resizable | SDL3WindowFlags inputFocus.
	initialExtent := 1280 @ 720 "720p"
]

{ #category : 'lifecycle' }
SDL3Demo >> open [

	window :=
		sdl
			newWindowTitle: self className
			w: initialExtent x
			h: initialExtent y
			flags: initialWindowFlags.
	window assertNotNullReturn.

	renderer := window newRendererFor: nil.
	renderer assertNotNullReturn.

	sdl assertSuccess: window startTextInput "Enable SDL3TextEditingEvent"
]

{ #category : 'events' }
SDL3Demo >> pollEvents [

	^ Array new: 10 streamContents: [ :stream |
		self pollEventsDo: [ :evt | stream nextPut: evt copy ]]
]

{ #category : 'events' }
SDL3Demo >> pollEventsDo: aUnaryBlock [

	[ sdl pollEvent: event ] whileTrue: [
		aUnaryBlock value: (map value: event) ]
]

{ #category : 'renderer' }
SDL3Demo >> present [

	sdl assertSuccess: renderer renderPresent
]

{ #category : 'renderer' }
SDL3Demo >> renderRectangle: rectangle [

	sdl assertSuccess:
		(renderer renderRect: (SDL_FRect newFrom: rectangle))
]

{ #category : 'renderer' }
SDL3Demo >> renderTexture: texture at: aSDLFRect [

	sdl assertSuccess:
		(renderer
			renderTexture: texture
			srcrect: nil
			dstrect: aSDLFRect)
]

{ #category : 'renderer' }
SDL3Demo >> scale: aFloat [

	sdl assertSuccess: (renderer renderScaleX: aFloat scaleY: aFloat)
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
