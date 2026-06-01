"
I demonstrate how to use the system tray icon and menu.
"
Class {
	#name : 'SDL3TrayMenuDemo',
	#superclass : 'SDL3ConsoleDemoApp',
	#instVars : [
		'tray',
		'logEntryLabelCallback'
	],
	#category : 'SDL3-Demos-API',
	#package : 'SDL3-Demos',
	#tag : 'API'
}

{ #category : 'lifecycle' }
SDL3TrayMenuDemo >> close [

	tray ifNotNil: [ 
		sdl destroyTray: tray. 
		tray := nil ].
	super close
]

{ #category : 'accessing' }
SDL3TrayMenuDemo >> initialExtent [

	^ 400 @ 300
]

{ #category : 'lifecycle' }
SDL3TrayMenuDemo >> prepareToLoop [

	super prepareToLoop.
	self setupTray
]

{ #category : 'initialization' }
SDL3TrayMenuDemo >> setupTray [

	| strings iconSurface menu submenu |
	strings := #('One' 'Two' 'Three' 'Four' 'Five').
	logEntryLabelCallback :=
		FFICallback
			signature: #(void (void *userdata, SDL3TrayEntry *entryHandle))
			block: [ :userdata :entryHandle |
				| entry |
				entry := SDL3TrayEntry fromHandle: entryHandle.
				self log: 'Click on ', entry label surroundedBySingleQuotes ].

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

	self log: 'Click on the system tray menu with Pharo icon.'
]

{ #category : 'hooks' }
SDL3TrayMenuDemo >> step [

	self clearColor: Color blue muchDarker.
	self present
]
