"
This demo shows parent and child window relationships in SDL3.
It supports utility windows, tooltip windows, popup menus, modal dialogs, and always-on-top windows.
Scroll the mouse wheel over a window to change its opacity.
"
Class {
	#name : 'SDL3WindowChildrenDemoApp',
	#superclass : 'SDL3RendererDemoApp',
	#instVars : [
		'children',
		'childTypes',
		'eventCounts',
		'flashCountdown',
		'isModalActive',
		'colorByType'
	],
	#category : 'SDL3-Demos-API',
	#package : 'SDL3-Demos',
	#tag : 'API'
}

{ #category : 'actions' }
SDL3WindowChildrenDemoApp >> addChild: aWindow type: aSymbol [

	| id |
	id := aWindow id.
	children at: id put: (DiScope own: aWindow).
	childTypes at: id put: aSymbol.
	DiScope own: aWindow unownedNewRenderer "Ensure the window has an associated default renderer"
]

{ #category : 'accessing' }
SDL3WindowChildrenDemoApp >> initialExtent [

	^ 600 @ 300
]

{ #category : 'initialization' }
SDL3WindowChildrenDemoApp >> initialize [

	super initialize.
	children := Dictionary new.
	childTypes := Dictionary new.
	eventCounts := Dictionary new.
	flashCountdown := 0.
	colorByType := {
		#Utility -> Color brown muchDarker muchDarker.
		#PopupTooltip -> Color yellow muchDarker.
		#PopupMenu -> Color green muchDarker.
		#Modal -> Color red muchDarker.
	} asDictionary
]

{ #category : 'initialization' }
SDL3WindowChildrenDemoApp >> initializeKeybindings [

	self
		bindKey: SDLK_U
		description: 'Toggle utility child window'
		action: [
			children values
				detect: [ :each | each isUtility ]
				ifFound: [ :existing | self removeChildWithID: existing id ]
				ifNone: [
					| length child |
					length := 200.
					child :=
						SDL3Window
							unownedNewTitle: ''
							width: length
							height: length
							flags: SDL_WINDOW_UTILITY.
					child parent: window.
					child position: window position + window extent - length.
					self addChild: child type: #Utility ] ];
		bindKey: SDLK_T
		description: 'Show popup tooltip'
		action: [
			| position child |
			self removeTooltips.
			position := sdl mousePositionRounded.
			child := window
				unownedNewPopupParentOffsetX: position x
				offsetY: position y - 300
				width: 200
				height: 300
				flags: SDL_WINDOW_TOOLTIP.
			self addChild: child type: #PopupTooltip ];
		bindKey: SDLK_M
		description: 'Show popup menu'
		action: [
			| position child |
			self removePopupMenus.
			position := sdl mousePositionRounded.
			child := window
				unownedNewPopupParentOffsetX: position x - 10
				offsetY: position y - 10
				width: 150
				height: 300
				flags: SDL_WINDOW_POPUP_MENU.
			self addChild: child type: #PopupMenu ];
		bindKey: SDLK_D
		description: 'Show modal dialog'
		action: [
			| child |
			child := SDL3Window
				unownedNewTitle: 'Modal Dialog'
				width: 150
				height: 150
				flags: 0.
			child parent: window.
			child modal: true.
			self addChild: child type: #Modal ];
		bindKey: SDLK_A
		description: 'Toggle always on top'
		action: [ window alwaysOnTop: window isAlwaysOnTop not ];
		bindKey: SDLK_F
		description: 'Trigger window flash (3s countdown)'
		action: [ flashCountdown := Time millisecondClockValue + 3000 ].
	super initializeKeybindings
]

{ #category : 'private' }
SDL3WindowChildrenDemoApp >> removeChildWithID: aWindowID [

	self removeChildrenSuchThat: [ :childWindow | childWindow id = aWindowID ]
]

{ #category : 'actions' }
SDL3WindowChildrenDemoApp >> removeChildrenSuchThat: aBlock [

	| toRemove |
	toRemove := children values select: aBlock.
	toRemove do: [ :eachWindow |
		| id |
		id := eachWindow id.
		children removeKey: id ifAbsent: [ ].
		eachWindow renderer ifNotNil: [ :r | r dispose ].
		eachWindow dispose.
		eventCounts removeKey: id ifAbsent: [ ] ]
]

{ #category : 'private' }
SDL3WindowChildrenDemoApp >> removePopupMenus [

	self removeChildrenSuchThat: [ :childWindow | childWindow isPopupMenu ]
]

{ #category : 'private' }
SDL3WindowChildrenDemoApp >> removeTooltips [

	self removeChildrenSuchThat: [ :childWindow | childWindow isTooltip ]
]

{ #category : 'hooks' }
SDL3WindowChildrenDemoApp >> renderChild: childWindow [

	| childRenderer childColor eventCount id childType |
	id := childWindow id.
	childRenderer := childWindow renderer.
	eventCount := eventCounts at: id ifAbsent: [ 0 ].
	childType := childTypes at: id.
	childColor := colorByType at: childType.

	childRenderer renderDrawColor: childColor.
	childRenderer renderClear.
	childRenderer renderDrawColor: Color white.
	childRenderer renderDebugTextX: 10 y: 10 str: ('Type: <1s>' expandMacrosWith: childType).
	childRenderer renderDebugTextX: 10 y: 25 str: ('Events: <1p>' expandMacrosWith: eventCount).
	childRenderer renderDebugTextX: 10 y: 40 str: ('Opacity: <1p>' expandMacrosWith: (childWindow opacity * 100) rounded).
	
	childWindow hasInputFocus
		ifTrue: [ 
			childRenderer renderDrawColor: Color green.
			childRenderer renderDebugTextX: 10 y: 55 str: '*** FOCUSED ***' ]
		ifFalse: [
			"If there is a modal and it's not myself, then I'm locked by it."
			(isModalActive and: [ childWindow isModal not ]) ifTrue: [ 
				childRenderer renderDrawColor: Color red.
				childRenderer renderDebugTextX: 10 y: 55 str: '*** LOCKED BY MODAL ***' ] ].
		
	childRenderer renderPresent
]

{ #category : 'rendering' }
SDL3WindowChildrenDemoApp >> renderParent [

	| x y |
	self clearColor: Color black.

	x := 20.
	y := 20.

	self showText: 'U: Toggle Utility Window (at right)' x: x y: y color: Color white.
	self showText: 'T: Show Popup Tooltip (receives no events; click to dismiss)' x: x y: y + 15 color: Color white.
	self showText: 'M: Show Popup Menu (click to dismiss)' x: x y: y + 30 color: Color white.
	self showText: 'D: Show Modal Dialog' x: x y: y + 45 color: Color white.
	self showText: 'A: Toggle Always-on-Top' x: x y: y + 60 color: (window isAlwaysOnTop ifTrue: [ Color green ] ifFalse: [ Color white ]).
	self showText: 'Wheel: Adjust Opacity of window under cursor' x: x y: y + 75 color: Color white.

	flashCountdown > 0
		ifFalse: [
			self
				showText: 'F: Flash Main Window (3s delay - lose focus to see the effect)'
				x: x y: y + 90 color: Color white ]
		ifTrue: [
			| now |
			now := Time millisecondClockValue.
			now >= flashCountdown
				ifTrue: [
					window flashWithOperation: SDL3FlashOperation untilFocused.
					flashCountdown := 0 ]
				ifFalse: [
					| remaining |
					remaining := ((flashCountdown - now) / 1000.0) printShowingDecimalPlaces: 1.
					self
						showText: ('*** FLASHING IN ', remaining, 's ***')
						x: x y: y + 90 color: Color yellow ] ].

	self showText: ('Active Child Windows: ', children size asString) x: x y: y + 115 color: Color lightYellow.

	self showText: ('Main Window Events: ', (eventCounts at: window id ifAbsent: [ 0 ]) asString)
		x: x y: y + 140 color: Color cyan.

	self showText: ('Main Window Opacity: ', (window opacity * 100) rounded asString, '%')
		x: x y: y + 155 color: Color cyan.

	window hasInputFocus ifTrue: [
		self showText: '*** FOCUSED ***' x: x y: y + 170 color: Color green ].

	isModalActive ifTrue: [
		self showText: '*** LOCKED BY MODAL WINDOW  ***' x: x y: y + 170 color: Color red ].

	self present
]

{ #category : 'hooks' }
SDL3WindowChildrenDemoApp >> step [

	isModalActive := children values anySatisfy: [ :each | each isModal ].

	children valuesDo: [ :each | self renderChild: each ].

	self renderParent
]

{ #category : 'visiting - concrete' }
SDL3WindowChildrenDemoApp >> visitMouseButtonDownEvent: aMouseButtonDownEvent [

	| windowID |
	windowID := aMouseButtonDownEvent windowID.

	"If main window is clicked, dismiss all popups and tooltips"
	windowID = window id ifTrue: [
		self removePopupMenus.
		self removeTooltips ].

	"Dismiss popups/tooltips on click on themselves"
	children at: windowID ifPresent: [ :childWindow |
		(childWindow isTooltip or: [ childWindow isPopupMenu ])
			ifTrue: [ self removeChildWithID: windowID ] ].

	super visitMouseButtonDownEvent: aMouseButtonDownEvent
]

{ #category : 'visiting - concrete' }
SDL3WindowChildrenDemoApp >> visitMouseWheelEvent: aMouseWheelEvent [

	| windowID |
	windowID := aMouseWheelEvent windowID.

	windowID = window id ifTrue: [
		window opacity:
			((window opacity + (aMouseWheelEvent y * 0.05)) min: 1.0 max: 0.1) ].

	children at: windowID ifPresent: [ :childWindow |
		childWindow opacity:
			(childWindow opacity + (aMouseWheelEvent y * 0.05) min: 1.0 max: 0.1) ].

	super visitMouseWheelEvent: aMouseWheelEvent
]

{ #category : 'hooks' }
SDL3WindowChildrenDemoApp >> visitWindowCloseRequestedEvent: aWindowEvent [

	self removeChildWithID: aWindowEvent windowID.
	
	super visitWindowCloseRequestedEvent: aWindowEvent
]

{ #category : 'visiting - abstract' }
SDL3WindowChildrenDemoApp >> visitWindowIDEvent: aWindowIDEvent [

	| windowID count |
	windowID := aWindowIDEvent windowID.
	count := eventCounts at: windowID ifAbsent: [ 0 ].
	eventCounts at: windowID put: count + 1.

	super visitWindowIDEvent: aWindowIDEvent
]
