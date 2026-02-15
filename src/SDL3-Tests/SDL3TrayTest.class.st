Class {
	#name : 'SDL3TrayTest',
	#superclass : 'SDL3Test',
	#instVars : [
		'iconSurface',
		'tray'
	],
	#category : 'SDL3-Tests-Library',
	#package : 'SDL3-Tests',
	#tag : 'Library'
}

{ #category : 'running' }
SDL3TrayTest >> setUp [

	super setUp.

	"Ensure video subsystem is initialized"
	self assert: (sdl initSubSystem: SDL3InitFlags video).
	
	iconSurface := (self iconNamed: #pharo) asUnownedNewSDL3Surface.
	tray := sdl newTrayIcon: iconSurface tooltip: 'Test tooltip'
]

{ #category : 'running' }
SDL3TrayTest >> tearDown [

	iconSurface destroy.
	tray destroy.
	
	super tearDown
]

{ #category : 'tests' }
SDL3TrayTest >> test01EmptyMenu [

	| menu |
	menu := tray newMenu.

	self assert: menu entries isEmpty
]

{ #category : 'tests' }
SDL3TrayTest >> test02InsertButton [

	| menu |
	menu := tray newMenu.

	(menu
		insertEntryAt: 0
		label: 'First entry'
		flags: SDL3TrayEntryFlags button)
		assertNotNullReturn.

	self assert: menu entries size equals: 1.
	self assert: menu entries first label equals: 'First entry'
]

{ #category : 'tests' }
SDL3TrayTest >> test03AppendButton [

	| menu |
	menu := tray newMenu.

	(menu
		insertEntryAt: -1
		label: 'First entry'
		flags: SDL3TrayEntryFlags button)
		assertNotNullReturn.

	self assert: menu entries size equals: 1.
	self assert: menu entries first label equals: 'First entry'
]

{ #category : 'tests' }
SDL3TrayTest >> test04WrongInsertButton [

	| menu |
	menu := tray newMenu.

	self
		should: [
			(menu
				insertEntryAt: 7
				label: 'Entry At Wrong Position'
				flags: SDL3TrayEntryFlags button)
				assertNotNullReturn ]
		raise: SDL3Error.

	self assert: menu entries isEmpty
]

{ #category : 'tests' }
SDL3TrayTest >> test08ClickCallbacks [

	| menu clicks menuEntries callback |
	menu := tray newMenu.

	clicks := OrderedCollection new.
	callback :=
		FFICallback
			signature: #(void (void *userdata, SDL3TrayEntry *entryHolder))
			block: [ :userdata :entryHolder |
				clicks add: (SDL3TrayEntry fromHandle: entryHolder) ].
	
	menuEntries := (1 to: 10) collect: [ :each |
		| menuEntry |
		menuEntry :=
			menu
				insertEntryAt: each - 1
				label: 'Entry', each asString
				flags: SDL3TrayEntryFlags button.
		menuEntry assertNotNullReturn.
		menuEntry callback: callback userdata: nil.
		menuEntry ].

	menuEntries do: #click. "Simulate clicks"
	
	self assert: clicks size equals: menuEntries size.
	self assert: clicks first label equals: 'Entry1'.
	self assert: clicks last label equals: 'Entry10'.

		
	menuEntries with: clicks do: [ :eachMenuEntry :eachClick |
		self assert: eachMenuEntry getHandle equals: eachClick getHandle ]
]
