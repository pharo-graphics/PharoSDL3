"
I demonstrate special SDL3 window types and behaviors, including:
- Utility windows (toggled with U, appears at the right)
- Tooltip windows (relative to parent, click to dismiss)
- Popup menu windows (relative to parent, click to dismiss)
- Always-on-top windows
- Modal windows (blocking parent interaction)

Features:
- **Focus Tracking**: Shows which window has focus. Modal windows block parent focus.
- **Opacity**: Use **Mouse Wheel** over any window to change its opacity.
- **Flashing**: Press **F** to flash the main window until focused.
- **Event Counting**: Visualizes which windows receive events (Tooltips do not).

### Usage
- Press **U** to toggle a **Utility** window at the right.
- Press **T** to spawn a **Tooltip** at the mouse position.
- Press **P** to spawn a **Popup Menu** at the mouse position.
- Press **M** to spawn a **Modal** window.
- Press **A** to toggle **Always-on-Top** on the main window.
- Press **F** to **Flash** the main window.
- Scroll **Mouse Wheel** to fade windows in/out.
- Press **ESCAPE** to exit.
"
Class {
	#name : 'SDL3WindowChildrenDemo',
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

{ #category : 'private' }
SDL3WindowChildrenDemo >> addChild: aWindow type: aSymbol [

	| id |
	id := aWindow id.
	children at: id put: aWindow.
	childTypes at: id put: aSymbol.
	aWindow newRenderer. "Ensure the window has an associated default renderer"
]

{ #category : 'lifecycle' }
SDL3WindowChildrenDemo >> close [

	children valuesDo: [ :each |
		each renderer destroy.
		each destroy ].
	children removeAll.

	super close
]

{ #category : 'accessing' }
SDL3WindowChildrenDemo >> initialExtent [

	^ 600 @ 300
]

{ #category : 'initialization' }
SDL3WindowChildrenDemo >> initialize [

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

{ #category : 'private' }
SDL3WindowChildrenDemo >> removeChildWithID: aWindowID [

	self removeChildrenSuchThat: [ :childWindow | childWindow id = aWindowID ]
]

{ #category : 'private' }
SDL3WindowChildrenDemo >> removeChildrenSuchThat: aBlock [

	| toRemove |
	toRemove := children values select: aBlock.
	toRemove do: [ :eachWindow |
		| id |
		id := eachWindow id.
		(children removeKey: id ifAbsent: [ nil ])
			ifNotNil: [ :w | w renderer destroy. w destroy ].
		eventCounts removeKey: id ifAbsent: [ ] ]
]

{ #category : 'private' }
SDL3WindowChildrenDemo >> removePopupMenus [

	self removeChildrenSuchThat: [ :childWindow | childWindow isPopupMenu ]
]

{ #category : 'private' }
SDL3WindowChildrenDemo >> removeTooltips [

	self removeChildrenSuchThat: [ :childWindow | childWindow isTooltip ]
]

{ #category : 'hooks' }
SDL3WindowChildrenDemo >> renderChild: childWindow [

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

{ #category : 'hooks' }
SDL3WindowChildrenDemo >> renderParent [

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
SDL3WindowChildrenDemo >> step [

	isModalActive := children values anySatisfy: [ :each | each isModal ].

	children valuesDo: [ :each | self renderChild: each ].

	self renderParent
]

{ #category : 'hooks' }
SDL3WindowChildrenDemo >> visitKeyboardDownEvent: aKeyboardDownEvent [

	| key child |
	key := aKeyboardDownEvent key.
	
	key = SDLK_U ifTrue: [ 
		children values
			detect: [ :e | e isUtility ]
			ifFound: [ :existing | self removeChildWithID: existing id ]
			ifNone: [
				| length |
				length := 200.
				child :=
					SDL3Window
						unsafeNewTitle: ''
						w: length h: length flags: SDL_WINDOW_UTILITY.
				child parent: window.
				child position: window position + window extent - length.
				self addChild: child type: #Utility ] ].

	key = SDLK_T ifTrue: [
		| position |
		self removeTooltips.
		position := sdl mousePositionRounded.
		child := window
			newPopupParentOffsetX: position x
			offsetY: position y - 300
			w: 200 h: 300 flags: SDL_WINDOW_TOOLTIP.
		self addChild: child type: #PopupTooltip ].

	key = SDLK_M ifTrue: [
		| position |
		self removePopupMenus.
		position := sdl mousePositionRounded.
		child := window
			newPopupParentOffsetX: position x - 10
			offsetY: position y - 10
			w: 150 h: 300 flags: SDL_WINDOW_POPUP_MENU.
		self addChild: child type: #PopupMenu ].

	key = SDLK_D ifTrue: [
		child := SDL3Window
			unsafeNewTitle: 'Modal Dialog'
			w: 150 h: 150 flags: 0.
		child parent: window.
		child modal: true.
		self addChild: child type: #Modal ].

	key = SDLK_A ifTrue: [ 
		window alwaysOnTopOnTop: window isAlwaysOnTop not ].

	key = SDLK_F ifTrue: [ 
		flashCountdown := Time millisecondClockValue + 3000 ].

	super visitKeyboardDownEvent: aKeyboardDownEvent
]

{ #category : 'visiting - concrete' }
SDL3WindowChildrenDemo >> visitMouseButtonDownEvent: aMouseButtonDownEvent [

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
SDL3WindowChildrenDemo >> visitMouseWheelEvent: aMouseWheelEvent [

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
SDL3WindowChildrenDemo >> visitWindowCloseRequestedEvent: aWindowEvent [

	self removeChildWithID: aWindowEvent windowID.
	
	super visitWindowCloseRequestedEvent: aWindowEvent
]

{ #category : 'visiting - abstract' }
SDL3WindowChildrenDemo >> visitWindowIDEvent: aWindowIDEvent [

	| windowID count |
	windowID := aWindowIDEvent windowID.
	count := eventCounts at: windowID ifAbsent: [ 0 ].
	eventCounts at: windowID put: count + 1.

	super visitWindowIDEvent: aWindowIDEvent
]
