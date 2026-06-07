"
I am a demo application that demonstrates how to grab and ungrab the mouse in SDL3.
I also demonstrate relative mouse mode, cursor visibility, mouse warping, and mouse rect confinement.

### Usage
- Press **M** to toggle Mouse Grab. When grabbed, the mouse cursor is confined to the window.
- Press **R** to toggle Relative Mouse Mode. When enabled, the mouse cursor is hidden and only relative motion is reported.
- Press **C** to toggle Cursor Visibility.
- Press **W** to Warp Mouse to the center of the window.
- Press **L** to Lock Mouse to a central sub-rectangle.
- Press **ESCAPE** to exit.
"
Class {
	#name : 'SDL3MouseDemo',
	#superclass : 'SDL3ConsoleDemoApp',
	#instVars : [
		'cursorIdGenerator',
		'cursorId'
	],
	#category : 'SDL3-Demos-API',
	#package : 'SDL3-Demos',
	#tag : 'API'
}

{ #category : 'private' }
SDL3MouseDemo >> activateNextSystemCursor [

	| cursor |
	cursorId := cursorIdGenerator next.
	Stdio stdout << cursorId asString; lf; flush.
	cursor := SDL3Cursor unsafeNewSystem: cursorId.
	cursor setActive
]

{ #category : 'accessing' }
SDL3MouseDemo >> initialExtent [

	^ 800 @ 240
]

{ #category : 'hooks' }
SDL3MouseDemo >> step [

	| x y mousePosition globalMousePosition pressedButtons mouseSDLRect isMouseLocked |
	self clearColor: Color black.
	
	x := 20.
	y := 20.
	
	self showText: ('M: Mouse Grabbed: ', window isMouseGrabbed asString, ' - Confines the cursor within the window boundaries.') 
		x: x y: y 
		color: (window isMouseGrabbed ifTrue: [ Color green ] ifFalse: [ Color white ]).
		
	self showText: ('R: Relative Mouse Mode: ', window isRelativeMouseMode asString, ' - Hides cursor; sends motion as deltas.') 
		x: x y: y + 15 
		color: (window isRelativeMouseMode ifTrue: [ Color green ] ifFalse: [ Color white ]).

	self showText: ('C: Cursor Visible: ', SDL3Cursor isVisible asString, ' - Toggles the visibility of the system mouse cursor.') 
		x: x y: y + 30 
		color: (SDL3Cursor isVisible ifTrue: [ Color green ] ifFalse: [ Color white ]).

	mouseSDLRect := window mouseRect.
	isMouseLocked := mouseSDLRect isNull not.
	isMouseLocked ifTrue: [
		renderer renderDrawColor: Color yellow.
		renderer renderRect: (SDL3FRect newFrom: mouseSDLRect) ].
	self showText: ('L: Mouse Locked to Rect: ', isMouseLocked asString, ' - Confines mouse to a specific sub-area.') 
		x: x y: y + 45 
		color: (isMouseLocked ifTrue: [ Color green ] ifFalse: [ Color white ]).

	self showText: 'W: Warp Mouse - Move mouse cursor to the specified position.' 
		x: x y: y + 60 
		color: Color white.

	self showText: ('N: Current system cursor: ', cursorId item)
		x: x y: y + 75
		color: Color cyan.
		
	mousePosition := sdl mousePosition.
	self showText: ('Local Position: ', (mousePosition x printShowingDecimalPlaces: 2), ' @ ', (mousePosition y printShowingDecimalPlaces: 2))
		x: x y: y + 100
		color: Color lightYellow.

	globalMousePosition := sdl globalMousePosition.
	self showText: ('Global Position: ', (globalMousePosition x printShowingDecimalPlaces: 2), ' @ ', (globalMousePosition y printShowingDecimalPlaces: 2))
		x: x y: y + 115
		color: Color lightYellow.

	pressedButtons := (SDL3MouseButtonFlagsMask allValuesIn:
		(sdl getMouseStateX: ExternalAddress null y: ExternalAddress null))
			collect: [ :e | e item  ].
	self showText: ('Buttons: ', (pressedButtons ifEmpty: [ 'None' ] ifNotEmpty: [ ', ' join: pressedButtons ]))
		x: x y: y + 130
		color: Color lightYellow.

	self present
]

{ #category : 'private' }
SDL3MouseDemo >> toggleLockedMouseRectangle [

	window mouseRect isNull
		ifTrue: [ 
			| extent lockRect |
			extent := window extent.
			lockRect := (extent // 4) extent: (extent // 2).
			window mouseRect: (SDL3Rect newFrom: lockRect) ]
		ifFalse: [
			window mouseRect: ExternalAddress null ]
]

{ #category : 'hooks' }
SDL3MouseDemo >> visitKeyboardDownEvent: aKeyboardDownEvent [

	| key |
	key := aKeyboardDownEvent key.
	
	key = SDLK_M ifTrue: [ 
		window mouseGrabbed: window isMouseGrabbed not ].

	key = SDLK_R ifTrue: [ 
		window relativeMouseModeEnabled: window isRelativeMouseMode not ].

	key = SDLK_C ifTrue: [ SDL3Cursor toggleVisible ].

	key = SDLK_W ifTrue: [ window warpMouseInX: 10 y: 10 ].

	key = SDLK_L ifTrue: [ self toggleLockedMouseRectangle ].

	key = SDLK_N ifTrue: [ self activateNextSystemCursor ].

	super visitKeyboardDownEvent: aKeyboardDownEvent
]
