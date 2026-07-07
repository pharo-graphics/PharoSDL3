"
I demonstrate how to use the system tray icon and menu.
"
Class {
	#name : 'SDL3TrayMenuDemoApp',
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
SDL3TrayMenuDemoApp >> close [

	tray ifNotNil: [ 
		sdl destroyTray: tray. 
		tray := nil ].
	super close
]

{ #category : 'accessing' }
SDL3TrayMenuDemoApp >> initialExtent [

	^ 400 @ 300
]

{ #category : 'lifecycle' }
SDL3TrayMenuDemoApp >> prepareToLoop [

	super prepareToLoop.
	self setupTray
]

{ #category : 'initialization' }
SDL3TrayMenuDemoApp >> setupTray [

	| strings iconSurface menu submenu |
	strings := #('One' 'Two' 'Three' 'Four' 'Five').
	logEntryLabelCallback :=
		FFICallback
			signature: #(void (void *userdata, SDL3TrayEntry *entryHandle))
			block: [ :userdata :entryHandle |
				| entry |
				entry := SDL3TrayEntry fromHandle: entryHandle.
				console addLine: 'Click on ', entry label surroundedBySingleQuotes ].

	iconSurface := (self iconNamed: #pharo) asUnownedNewSDL3Surface.
	tray := SDL3Tray unsafeNewIcon: iconSurface tooltip: 'PharoSDL3'.
	iconSurface destroy.

	menu := tray newMenu.

	"Basic: Add a button that is disabled and doesn't have a callback"
	menu
		insertEntryAt: -1
			label: 'Disabled button'
			flags: SDL3TrayEntryFlags button | SDL3TrayEntryFlags disabled.

	"Add separator"
	menu
		insertEntryAt: -1
			label: nil
			flags: SDL3TrayEntryFlags button.
			
	"Add submenu with buttons"
	submenu :=
		(menu
			insertEntryAt: -1
				label: 'Buttons'
				flags: SDL3TrayEntryFlags submenu)
			newSubmenu.
	strings do: [ :each |
		(submenu
			insertEntryAt: -1
				label: 'Button ', each
				flags: SDL3TrayEntryFlags button)
			callback: logEntryLabelCallback userdata: nil ].

	"Add submenu with checkboxes"
	submenu :=
		(menu
			insertEntryAt: -1
				label: 'Checkboxes'
				flags: SDL3TrayEntryFlags submenu)
			newSubmenu.
	strings do: [ :each |
		(submenu
			insertEntryAt: -1
				label: 'Checkbox ', each
				flags: SDL3TrayEntryFlags checkbox)
			callback: logEntryLabelCallback userdata: nil ].

	console addLine: 'Click on the system tray menu with Pharo icon.'
]

{ #category : 'hooks' }
SDL3TrayMenuDemoApp >> step [

	self clearColor: Color blue muchDarker.
	self present
]
